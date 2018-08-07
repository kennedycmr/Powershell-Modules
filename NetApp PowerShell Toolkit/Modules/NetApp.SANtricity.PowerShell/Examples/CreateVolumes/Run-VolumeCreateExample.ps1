# --------------------------------------------------------------------------- #
# Script that demonstrates creating snapshot volumes for thick and thin       #
# volumes of a storage configuration.                                         #
# --------------------------------------------------------------------------- #
param( [string]$ArrayName="ICT207C03", 
       [string]$Url="https://bol-win2kr2/devmgr/", 
       [string]$PoolName="Disk_Pool_1",
       [ValidateRange(1,10)][int]$NumToCreate=5,[string]$user="rw",
       [string]$pwd="Infinit1"
     )

function Remove-Volumes
{
    param([switch]$Thins, [array]$List)
    $command = Get-Command Remove-NeVolume
    if ($Thins) { $command = Get-Command Remove-NeThinVolume }
    foreach ($vol in $List) 
    {
        &$command @c -Id $vol.id
        Write-Host -ForegroundColor Red "* * * Delete - Volume [$($vol.Label)]"
    }
}

function Create-Volumes
{
   param([switch]$Thins,[Parameter(Mandatory=$true)][string]$PoolId,
         [ValidateRange(1,10)][int]$NumToCreate=5
        )
    $command = Get-Command New-NeVolume
    $prefix = $ThickVolPrefix
    $parameters = @{Size=10; SegSize=512}
    $type = "Thick"
    if ($Thins) 
    { 
        $command = Get-Command New-NeThinVolume 
        $prefix = $ThinVolPrefix
        $parameters = @{VirtualSize=1; RepositorySize=4; MaximumRepositorySize=32}
        $type = "Thin"
    }
    $Numbers = @(1..$NumToCreate)
    foreach ($volNum in $Numbers) 
    {
        # I'm sure this could be written better.  If the pool isn't a disk pool, we cannot make a thin volume.
        if ( -not ($(Get-NeVolumeGroup @c -Id $PoolId).DiskPool) -and $Thins) {
            Write-Host -ForegroundColor Red "* * * Cannot create a thin volume in a RAID Pool.  Use a Disk Pool instead."
        } else {
            $vol = &$command @c -SizeUnit gb -PoolId $PoolId -Name ${prefix}${volNum} @parameters
            Write-Host -ForegroundColor Green "* * * Create - Volume [$($vol.Label)] - Type [$($type)]"
        }
    }
}

if ($ss -eq $null) 
{ 
    ..\Set-DiTEnv.ps1 -ArrayName $ArrayName -Url $Url -user $user -pwd $pwd
}

$ThickVolPrefix = "SANtricity-PoSH-Vol-"
$ThinVolPrefix = "SANtricity-PoSH-ThinVol-"

$Volumes = Get-NeVolume @c |? {$_.Label -like $ThickVolPrefix + "*" }
$ThinVolumes = Get-NeThinVolume @c |? {$_.Label -like $ThinVolPrefix + "*" } 

Remove-Volumes -List $Volumes
Remove-Volumes -Thins -List $ThinVolumes

$vg = Get-NeVolumeGroup @c |? {$_.Label -eq $PoolName}

Create-Volumes -PoolId $vg.Id -NumToCreate $NumToCreate
Create-Volumes -PoolId $vg.Id -Thins -NumToCreate $NumToCreate
