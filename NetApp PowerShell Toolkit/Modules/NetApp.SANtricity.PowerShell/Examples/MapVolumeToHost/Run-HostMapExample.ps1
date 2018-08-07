<#
.DESCRIPTION
    * * * THIS IS A DESTRUCTIVE SCRIPT.  DO NOT USE IN A PRODUCTION ENVIRONMENT * * * 
    This is an example script that creates a host and host group (cluster), maps
    volumes to each and then tears down the mappings, host and cluster.
    This script is meant to be an exmaple about how to map SANtricity volumes
    to both Host and HostGroups (cluster).  

.PARAMETER ProxyUrl
    The url for the SANtricity Web Services Proxy that is managing the storage
    array identified (by name) by the $ArrayName parameter.  This parameter
    is used in conjunction with the $ArrayName parameter.  If the global parameter
    called $ss is null, this script will run ../Set-DiT.ps1.  Otherwise, the 
    $ArrayName and $ProxyUrl parameters are not used.

.PARAMETER ArrayName
    The name of the storage array managing the volumes and hosts.  This parameter
    is used in conjunction with the $ProxyUrl parameter.  If the global parameter
    called $ss is null, this script will run ../Set-DiT.ps1.  Otherwise, the 
    $ArrayName and $ProxyUrl parameters are not used.

.PARAMETER Thins
    This is a switch parameter that when set directs the script to also map thin
    volumes.
#>
param( [string]$ProxyUrl="https://bol-win2kr2", [string]$ArrayName="icta-titan",[switch]$Thins=$true)
function New-Mapping 
{
    param([string]$HostId,[string]$HostLabel,[switch]$IsHostGroup)
    $Mappings = @()
    $lunNumber=1
    foreach ($vol in $VolumesToMap) 
    {
        if ($lunNumber -eq 7) { $lunNumber++ } # Skip lun 7.  it is reserved for the access volume
        $label = "Host"
        if ($IsHostGroup) { $label="Host Group" }
        $Mappings += New-NeVolumeMappings  @c -MappableObjectId $vol.id -TargetId $HostId -lun $lunNumber
        Write-Host -ForegroundColor Green "Mapping volume [$($vol.Label)] - $label [$HostLabel] - Lun[$lunNumber]"
        $lunNumber++
    }    
    foreach ($mapping in $Mappings) 
    {
        Remove-NeVolumeMappings @c -Id $mapping.Id 
        Write-Host -ForegroundColor Red "Removed mapping volume [$($vol.Label)] - $label [$HostLabel]"
    }   
}


if ($ss -eq $null) 
{ 
    # Sets some global parameters
    ..\Set-DiTEnv.ps1 -ArrayName $ArrayName -Url $ProxyUrl 
}

<# 
    Try getting the host and host group prior to creating them.
#>
$HostGroupName = "PoSH-HostGroup"
$HostName = "PoSH-Host"
$HostGroup = Get-NeHostGroup @c |? {$_.name -eq $HostGroupName}
$NeHost = Get-NeHost @c |? {$_.label -eq $HostName }

if ($HostGroup -eq $null) { $HostGroup = New-NeHostGroup @c -name $HostGroupName }
if ($NeHost -eq $null) {  $NeHost = New-NeHost @c -Name $HostName }

$VolNameQuery = "SANtricity-PoSH-Vol*"
$Vols = Get-NeVolume @c 
if ($Thins) {    
    $VolNameQuery = "Thin*"
    $tVols = Get-NeThinVolume @c |? {$_.Label -like "PoSH-ThinVol*" }     
} 
$ThickVols = @($Vols |? {$_.Label -like "SANtricity-PoSH-Vol*"})
$VolumesToMap = @()
foreach ($vol in $ThickVols) 
{
    $VolumesToMap += $vol
} 
if ($Thins) { 
    foreach ($vol in $tVols) 
    {
        $VolumesToMap += $vol
    } 
}

New-Mapping -HostId $NeHost.id -HostLabel $NeHost.Label
Remove-NeHost @c -Id $NeHost.id
New-Mapping -HostId $HostGroup.id -IsHostGroup -HostLabel $HostGroup.Label
Remove-NeHostGroup @c -Id $HostGroup.id