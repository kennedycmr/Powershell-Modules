<#
.DESCRIPTION
    This script will set an environment for testing by configuring the proxy url 
    and storage array by setting some global variables.  This means the 
    variables are durable after running this script.  Durable variables are
    identified with the "global:" prefix in their variable name.

    If you plan on using this script more than a couple of times, you should 
    consider changing the script parameter defaults.  These defaults are located
    in the 'param' section.  When editing the script, the param section immediately
    follows this help documentation.

    The script will create a credential to the Web Services Proxy.  This is a normal 
    PowerShell credential that is extended to define attributes specific to the 
    SANtricity PowerShell toolkit.

.PARAMETER ArrayName
    The name of the storage array.  This array must be managed with the Web Services
    proxy defined by the $Url parameter.

.PARAMETER Url
    The url of the SANtricity Web Services proxy that manages the storage system(s).
    The url should be up to the name of the web application, devmgr.  For example, 
    'https://host.dev.acme.com/devmgr'.

.PARAMETER user
    The name of the Web Services Proxy user with read/write privilege.

.PARAMETER pw
    The password of the user to the Web Services Proxy.
#>
param(
      [string]$ArrayName="LehighSim", [string]$RemoteArrayName="",
      [string]$Url="https://bol-win2kr2/devmgr",
      [string]$user="rw", [string]$pwd="rw"
     )

if (-not $Url.EndsWith("/")) { $Url+="/" }
$global:cred = Get-NeProxyCredential -Url $Url -ProxyUser $user -ProxyPwd $pwd

# The primary storage system
$global:ss = Get-NeStorageSystem -Credential $cred |? { $_.name -eq $ArrayName }
if ($RemoteArrayName.Length -gt 0) {
    $global:rss = Get-NeStorageSystem -Credential $cred |? { $_.name -eq $RemoteArrayName }
}

# this is a fancy trick that allows me to specify both parameters when 
# calling a cmdlet (splatting)
$global:c = @{
              Credential= $cred
              SystemId = $ss.id
             }
if ($RemoteArrayName.Length -eq 0) {
    Write-Host "Array [$($ss.Name)] Id [$($ss.Id)]"
} else {
    Write-Host "Async Mirroring Capable"
    Write-Host "Array [$($ss.Name)] Id [$($ss.Id)] Remote Array [$($rss.Name)] Remote Id [$($rss.Id)]"
}
