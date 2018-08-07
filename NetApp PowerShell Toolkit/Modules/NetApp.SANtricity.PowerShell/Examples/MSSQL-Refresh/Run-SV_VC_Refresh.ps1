<#
.SYNOPSIS
    A script that will orchestrate failover sequence for SANtricity Storage supporting an MSSQL workload.  
.DESCRIPTION
    The script will first source and set the environment to work with the default storage system as 
    specified by script parameter defaults in Set-ScriptingEnvironment.ps1.

    The next step of the script is to unmount the SQLServer database.  This is done by running the 
    script called Invoke-SqlScript with the Unmount operation.  For this to be successfull an sql
    script called Unmount.sql must exist in the same directory as this script.  To extend this example
    you will need to write an sql script that is tuned to your specific environment.

    Now the script will recreate the consistency group snapshot volume.  This is accomplished with a
    script called Recreate-CGSnapshotVolume.ps1.  This script does not leverage powershell cmdlets to 
    suspend and resume (the recipe to the recreate action) but rather the legacy SANtricity command line
    application, SMcli.  The next release of this script will use the SANtriicty PowerShell Toolkit to 
    achieve this step.  The output of this script (since it is all text) is logged to a file called
    Recreate-cGSnapshotVolume.log.

    With the databases offline and consistency group refreshed, the next step is to make a copy for 
    each volume in the consistency group.  This step is accomplished in the scope of this script.  This
    step will take some time depending on the size of the volumes being copied and the current I/O load
    on the storage array.  The script displays a copy progress meter so you can guage how long this step
    will take.

    Finally, after snapshot volumes are copied, the database is restarted with the Invoke-SqlScript.ps1 script.
    This time it is run with the Mount operation.
    
.PARAMETER CGName
    The name of the consistency group that contains the MSSQL volumes.

.NOTES
    Prerequisites
    1. NetApp.SANtricity.PowerShell PowerShell module.  Verify with command Get-Module -ListAvailable
    2. SQLServer PowerShell module.  Verify with the same Get-Module command.
    3. For the SANtricity PowerShell toolkit to work correctly, the SANtricity WebApi will need to be installed
       in the environment.  The url for that points to the webapi is configurable through Set-ScriptingEnvironment.ps1
    
.LINK
    Invoke-SqlScript.ps1
    Set-ScriptingEnvironment.ps1
    Recreate-CGSnapshotVolume.ps1
.EXAMPLE
    ./Run-SV_VC_Refresh.ps1
    Run the script and refresh with the default consistency group.
.EXAMPLE
    ./Run-SV_VC_Refresh.ps1 -CGName "CG_SQLServer_WallaWalla"
    Run the script and refresh with the consistency group in Walla Walla, Wa.
#>
param([string]$CGName="CG_SQLServer_Test")
$elapsed = [System.Diagnostics.Stopwatch]::StartNew()
Write-Host "* * * INFO - Database Refresh started at $(Get-Date)"
if ($ss -eq $null) { .\Set-ScriptingEnvironment.ps1 }

function New-SnapshotVolumeCopy() {
param([NetApp.ESeries.PowerShell.TransferObjects.VolumeEx]$BaseVolume, 
      [NetApp.ESeries.PowerShell.TransferObjects.SnapshotGroup]$SnapshotVolume,
      [string]$CGViewRef
)
    $s = Get-NeConsistencyGroupSnapshotVolume @c -ObjectId $cg.CgRef |? {$_.cgviewref -eq $CGviewRef}
    $PitView = Get-NePitView @c |? {$_.BaseVol -eq $BaseVolume.id -and $_.Label.StartsWith($s.Label)}
    $BaseVolumeName = $BaseVolume.Label
    $VCCopyTarget="VC_" + $BaseVolumeName
    $VolumeObject = $BaseVolume
    $CopyTargetObject = Get-NeVolume @c |? {$_.Label -eq $VCCopyTarget } 
    New-NeVolumeCopyPair @c -SourceId $PitView.viewRef -TargetId $CopyTargetObject.Id -CopyPriority "priority4" `
        -DisableSnapshot $true -TargetWriteProtected $false |Out-Null
    Write-Host "* * * INFO - Made volume copy pair $($PitView.Label) ==> $($CopyTargetObject.Name)"
}

# Detach databases.  Sometimes the SQLServer provider doesn't return from it's "directory", so we guard against.
$Here = Get-Location
.\Invoke-SqlScript.ps1 -Operation Unmount
Set-Location $Here

# Remove Volume Copy Pairs
Write-Host "* * * Remove previously created volume copy pairs. " -NoNewline
.\Remove-AllVolumeCopyPairs.ps1 |Out-Null
Write-Host -ForegroundColor Green " [Complete]"

# Consistency group and use the script parameter $CGName. 
$cg = Get-NeConsistencyGroup @c |? {$_.label -eq $CGName }

# Recreate the consistency group snapshot volume
.\Recreate-CGSnapshotVolume.ps1 -ArrayName $($ss.Name)

# Get the members of the snapshot group in the CG.
$MemberVolumes = Get-NeSnapshotGroup @c |? {$_.ConsistencyGroupRef -eq $cg.CgRef}

# Make a volume copy for each snapshot volume in the consistency group.
foreach ($memberVolume in $MemberVolumes) {
    $baseVolume = Get-NeVolume @c |? {$_.id -eq $memberVolume.BaseVolume}
    $CGSnap = Get-NeConsistencyGroupSnapshotVolume @c -ObjectId $cg.CgRef |? {$_.label -eq $($CGName + "_0001")}
    New-SnapshotVolumeCopy -BaseVolume $baseVolume -SnapshotVolume $memberVolume -CGViewRef $CGSnap.cgViewRef
}

# Now that the volume copy's are started, we need to wait for the copy operations to complete.
$PercentComplete = 0
do {
    $VolCopyProgress = Get-NeVolumeCopyProgress @c
    $totalPercent = 0
    foreach ($progress in $VolCopyProgress) {
        if ($progress.PercentComplete -gt 0) {
            $totalPercent += $progress.PercentComplete 
        } elseif ($progress.PercentComplete -eq -1) {
            $totalPercent+=100
        }
    }
    $totalPercent /= $VolCopyProgress.count
    $PercentComplete = $totalPercent
    Write-Progress -Activity "Volume Copy Progress" -PercentComplete $PercentComplete
    Start-sleep -Seconds 1
} until ($PercentComplete -eq 100)

# Fire up databases on the volume copies.
.\Invoke-SqlScript.ps1 -Operation Mount
$totalTime = $($elapsed.Elapsed.ToString())
Write-Host  "* * * INFO - Database Refresh finished - total time [$totalTime]"