<#
.DESCRIPTION
    * * * THIS IS A DESTRUCTIVE SCRIPT.  DO NOT USE IN A PRODUCTION ENVIRONMENT * * * 
    This is an example script that removes the existing ARVM configuration   
    and demonstrates how to build it back up again.

.PARAMETER LocalVolume
    The name of the volume on the primary array that will be the base volume 
    for the mirror pair.

.PARAMETER RemoteVolume
    The name of the volume on the secondary array that will be the mirrored
    volume for the mirror pair.

.PARAMETER RemoteArrayName
    The name of the remote or secondary storage array.  This is a mandatory 
    parameter.

.PARAMETER  Destructive
    Switch to indicate that you want to remove all mirrored pairs in all mirror
    groups. This switch is not set by default.

.NOTES
    The script assumes a simple storage configuration.  It provides the option to
    destroy the existing asynchronous mirror groups.
#>

param(
      [string] $LocalVolume="41-42-Vol1",[string]$RemoteVolume="mirror-42-41-Vol1", 
      [string] $RemoteArrayName=$(throw "This script requires a remote storage array"),
      [string] $LocalArrayName="icta-titan",
      [switch] $Destructive=$False,
      [string] $ARVMProtocol="iscsi",
      [string] $MirrorGroupName="SANtricityTest-AMG-PoSH"
     )

<#
 Remove all of the existing AMGs. This is only called when the script is 
 run with the Destructive switch.  The script is not destructive by default.
#>
function Remove-ExistingAMGs
{
    # Get the ASync Mirror Groups.  For 1.0 release, Get-NeAsyncMirrorGroups was the cmdlet name.
    $mgs = Get-NeAsyncMirrorGroup @c |? {$_.Label -eq $MirrorGroupName}

    foreach ($mg in $mgs) {
        # Get the existing mirror group pairs and delete them. For 1.0 release, Get-NeAsyncMirrorPairs was the cmdlet name.
        $pairs = Get-NeAsyncMirrorGroupPairs @c -MirrorId $mg.Id
        foreach ($pair in $pairs) {
            if ($pair.MirrorGroup -eq $mg.id) {
                Remove-NeAsyncMirrorGroupPairs @c -Id $pair.Id -MirrorId $mg.Id 
            }
        }
        Remove-NeAsyncMirrorGroup @c -Id $mg.GroupRef
    }
}

<#
 Run a script that sets up basic array connection information.
 $ss is the primary StorageSystem while $rss is the remote or secondary 
#> 
if ($rss -eq $null) { ..\Set-DiTEnv.ps1 -RemoteArrayName $RemoteArrayName }
if ($Destructive) { Remove-ExistingAMGs }

# Get the names of the disk pools and volumes on the primary and secondary arrays.
$PriVol = Get-NeVolume @c |? {$_.label -eq $LocalVolume }
$SecVol = Get-NeVolume -cred $cred -SystemId $rss.id |? { $_.label -eq $RemoteVolume }
$PriVg = Get-NeVolumeGroup @c |? { $PriVol.VolumeGroupRef -eq $_.VolumeGroupRef }
$SecVg = Get-NeVolumeGroup -cred $cred -SystemId $rss.id |? `
    { $SecVol.VolumeGroupRef -eq $_.VolumeGroupRef }

# Create the mirror group.
$mg = New-NeAsyncMirrorGroup @c -Name $MirrorGroupName -SecondaryArrayId $rss.id `
    -SyncInterval 50 -RecoveryWarnThreshold 500  `
    -RepoUtilization 50 -SyncWarnThreshold 50 -InterfaceType $ARVMProtocol

<#
 In production (or production test) environments, many volumes will be created, mapped to host(s), and mirrored.
 This script example only makes one mirrored pair to demonstrate how it can be accomplished on a small
 scale.  Larger scale impelmentations can easily extend this example.
#>

# Create the mirror pair and check the status.
$pair = New-NeAsyncMirrorGroupPairs @c -PrimaryPoolId $PriVg.id -SecondaryPoolId $SecVg.Id -PrimaryVolumeRef `
    $PriVol.Id -SecondaryVolumeRef $SecVol.Id -MirrorId $mg.GroupRef

<#
This is a progress meter.  It will give you an idea about how long it is going to take 
for the initial synchronization to complete.
#>
do {
    # Get-NeAsyncMirrorProgress was the 1.0 name; it was replaced by Get-NeAsyncMirrorGroupProgress
    $progress = Get-NeAsyncMirrorGroupProgress @c -MirrorGroupId $mg.GroupRef
    $pct = $progress.GroupPercentComplete
    Write-Progress -Activity "Sync Percent Complete" -Status "${pct}%" -PercentComplete $pct
    sleep 2
} while ($pct -ne -1)
