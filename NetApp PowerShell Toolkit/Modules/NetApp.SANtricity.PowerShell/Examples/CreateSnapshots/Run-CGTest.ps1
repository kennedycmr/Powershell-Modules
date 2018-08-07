param([string]$ArrayName="ICT207C03", [string]$Url="https://bol-win2kr2/devmgr/")

if ($ss -eq $null) { ..\Set-DiTEnv.ps1 -ArrayName $ArrayName -Url $Url }

$Vols = Get-NeVolume @c 
$ThickVols = $Vols |? {$_.Label -like "SANtricity-PoSH-*"}
$RepoVol = $Vols |? {$_.volumeuse -eq "concatVolume"}
$RepoVolId = $RepoVol[0].VolumeGroupRef
$VGs = Get-NeVolumeGroup @c 
$vg = $vgs |? {$_.VolumeGroupRef -eq $RepoVolId}
$cg = Get-NeConsistencyGroup @c
if ($null -eq $cg) 
{
    $cg = New-NeConsistencyGroup @c -name "SANtricity-PoSH-CG"
}
foreach ($wwn in $ThickVols.Id) {
    New-NeConsistencyGroupMember @c -CgId $cg.CgRef -ScanM $false -ValidatePar $false -VolumeId $wwn -RepositoryPoolId $VG.id
}
$cg=Get-NeConsistencyGroup -sys $ss.id -cred $cred
$cgmembers=Get-NeConsistencyGroupMember -sys $ss.id -cred $cred -CgId $cg.cgref
Get-NeConsistencyGroupMember -sys $ss.id -cred $cred -CgId $cg.cgref -VolumeRef $cgmembers[0].volumeId
$vol = get-neconsistencygroupmember -sys $ss.id -cred $cred -CgId $cg.cgref -VolumeRef $cgmembers[0].volumeId
$vol.volumewwn
foreach ($wwn in $ThickVols.Id) 
{
    Remove-NeConsistencyGroupMember -sys $ss.id -cred $cred -CgId $cg.cgref -VolumeRef $wwn
}
Remove-NeCG @c -Id $cg.CgRef

