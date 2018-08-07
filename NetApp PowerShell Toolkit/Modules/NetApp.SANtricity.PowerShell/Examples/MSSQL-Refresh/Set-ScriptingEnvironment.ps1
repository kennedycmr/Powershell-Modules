# --------------------------------------------------------------------------- #
# This script will set an environment for testing by configuring the proxy url 
# and storage array by setting some global variables.  This means the 
# variables are durable after running this script.
# --------------------------------------------------------------------------- #
param([string]$ArrayName="Site_B_01", [string]$Url="https://ICTM0902R720-6:8082/devmgr/",
        [string]$user="rw", [string]$pwd="rw")

if (-not $Url.EndsWith("/")) { $Url+="/" }
$global:cred = Get-NeProxyCredential -Url $Url -ProxyUser $user -ProxyPwd $pwd

# ARVM config of MP's
$global:ss = Get-NeStorageSystem -Credential $cred |? { $_.name -eq $ArrayName }

# this is a fancy trick that allows me to specify both parameters when 
# calling a cmdlet (splatting)
# Get-NeStorageSystem @c is eqal to Get-NeStorageSystem -cred $cred -SystemId $ss.id
$global:c = @{
              Credential= $cred
              SystemId = $ss.id
             }

Write-Host "Array [$($ss.Name)] Id [$($ss.Id)]"
