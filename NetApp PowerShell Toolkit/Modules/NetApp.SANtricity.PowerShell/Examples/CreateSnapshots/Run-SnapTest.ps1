<#
.DESCRIPTION
    * * * THIS IS A DESTRUCTIVE SCRIPT.  DO NOT USE IN A PRODUCTION ENVIRONMENT * * * 
    Script that demonstrates creating snapshot volumes for thick and thin       
    volumes of a storage configuration.
    Ideally, run this script after running Run-VolumeCreateExample.ps1 located
    in CreateVolume directory.
    This script will only make snapshots and snapshot groups for volumes whose
    name begin with "SANtricity-PoSH"

.PARAMETER ArrayName
    The name of the storage array that is managed by the WebServices proxy at the
    specified Url.  This is a mandatory parameter.

.PARAMETER  Url
    The url to the SANtricity Web Services Proxy that is managing E-Series storage 
    arrays. Example: https://finance.it.acme.com/devmgr

.NOTES
    The script assumes a simple storage configuration.  

    This script will only make snapshots and snapshot groups for volumes whose
    name begin with "SANtricity-PoSH"
#>
param(
        [string]$ArrayName="ICT207C03", [string]$Url="https://bol-win2kr2/devmgr", 
        [switch]$Thins=$true
     )

if ($ss -eq $null) 
{ 
    # Sets our global parameters
    ..\Set-DiTEnv.ps1 -ArrayName $ArrayName -Url $Url 
}

$Vols = Get-NeVolume @c 
if ($Thins) 
{    
    $tVols = Get-NeThinVolume @c |? {$_.Label -like "SANtricity-PoSH-ThinVol*" } 
} 

$ThickVols = @($Vols |? {$_.Label -like "SANtricity-PoSH-Vol*"})

$RepoVol = $Vols |? {$_.volumeuse -eq "concatVolume"}
$RepoVolId = $RepoVol[0].VolumeGroupRef
$VGs = Get-NeVolumeGroup @c 
$vg = $vgs |? {$_.VolumeGroupRef -eq $RepoVolId}
$VolList = $ThickVols
$VolumesToSnap = @()
foreach ($vol in $ThickVols) 
{
    $VolumesToSnap += $vol
} 
if ($Thins) { 
    foreach ($vol in $tVols) 
    {
        $VolumesToSnap += $vol
    } 
}

foreach ($vol in $VolumesToSnap) {
    $wwn = $vol.id

    # CAREFUL...the name of a snapshot group is limited to 30 characters.
    $SnapGroupName="S"
    $SnapGroupName= $SnapGroupName+"-"+$vol.Label 
    $groupTest = Get-NeSnapshotGroup @c |? {$_.Label -eq $SnapGroupName }
    if ($groupTest -eq $null) 
    {
        $SnapshotGroup = New-NeSnapshotGroup @c -BaseMappableObjectId $wwn -Name $SnapGroupName `
             -RepositoryPercentage 20 -WarningThreshold 70 -AutoDeleteLimit 8 -FullPolicy purgepit `
             -StoragePoolId $vg.id
    }
    else 
    {
        $SnapShotGroup = $groupTest
    }

    $Snapshot = New-NeSnapshotImages @c -GroupId $SnapshotGroup.Id
    Write-Host -ForegroundColor Green "Snap created [$($Snapshot.id)] - volume [$($vol.Label)] - snap group [$($SnapshotGroup.id)]"
}

Write-Host -ForegroundColor Yellow "* * * Deleting snaps and snap groups"

Start-Sleep 5
$SnapGroups = Get-NeSnapshotGroup @c

foreach ($snapGroup in $SnapGroups)
{
    Write-Host -ForegroundColor Red "Removing snaps in snapshot group [$($snapGroup.Label)] - BaseVolume [$($snapGroup.BaseVolume)]"
    $Snaps = Get-NeSnapshotImages @c |? {$_.PitGroupRef -eq $SnapGroup.PitGroupRef} | Sort-Object -Property PitTimestamp -Descending
    foreach ($snap in $Snaps) 
    {
        Remove-NeSnapshotImages @c -Id $snap.id | Out-Null
    }
    Remove-NeSnapshotGroup @c -Id $snapGroup.Id | Out-Null
}
