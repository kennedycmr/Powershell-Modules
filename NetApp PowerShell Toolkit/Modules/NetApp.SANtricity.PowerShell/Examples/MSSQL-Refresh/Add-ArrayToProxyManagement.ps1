<#
.SYNOPSIS
    A script that will add a storage array to be managed by the SANtricity PowerShell toolkit.  
.DESCRIPTION
    This script will add a storage array so it can be managed by the SANTricity PowerShell toolkit.
    This script only needs to be run once.  Subsequent executions are harmless in that management 
    connections do not accumulate.  The cmdlets use the SANtricity WebServices Proxy to interact 
    with the storage.  This is a convient way to centralize array managmenet while provivding the 
    flexibility of executing PowerShell scripts in many locations.  Future versions of the SANtricity OS
    will allow PowerShell scripts to be executed directly against the storage system.  However, all 
    currently available versions of SANtricity OS only support proxy managmenet.  Once the array is
    added, it will continue to be known by the SANtricity Web Services Proxy and be available to the
    PowerShell Toolkit without having to re-run this script.
    
    The script will set 2 variables that will be available for the scope of the PowerShell (or 
    PowerShell ISE) window.  They are called $ss which is a reference to the StorageSystem object
    and $cred which is a reference to the Credential to the WebService Proxy.

    The SANtricity WebServices Proxy runs as a web server container and will listen on http port 8080
    and https port 8443.  If these ports are already in use, then you will need to configure the 
    ports in C:/Program Files/NetApp/SANTricity Web Services Proxy/wsconfig.xml.  After editing 
    wsconfig.xml, you will need to restart the service (Stop-Service NetAppWebServicesProxy ; Start-Service NetAppWebServicesProxy)
    
.PARAMETER ManagmentIpAddresses
    An array of no more than 2 strings that are the managment ip addresses for the storage array you wish
    to add to proxy managment.
.PARAMETER Url
    The url to the host running the SANtricity Web Services Proxy.  For example, https://myHost:8443/devmgr/
.PARAMETER ProxyUser
    The name of the user on the SANtricity Web Services Proxy.  The default user is rw.
.PARAMETER ProxyPwd
    The password for the user on the SANtricity Web Services Proxy.  The default user is rw.

.NOTES
    Prerequisites
    1. NetApp.SANtricity.PowerShell PowerShell module.  Verify with command Get-Module -ListAvailable
    2. For the SANtricity PowerShell toolkit to work correctly, the SANtricity Web Services Proxy will need to be installed
       in the environment.  The url for that points to the webapi is configurable through Set-ScriptingEnvironment.ps1
    
.EXAMPLE
    ./Add-ArrayToProxyManagement.ps1 -ManagementIpAddresses "1.1.1.1","1.1.1.2"
    Add the array with management addresses of 1.1.1.1 and 1.1.1.2 to be managed by the SANtricity WebServices Proxy.
#>
param([Parameter(Mandatory=$true)][string[]]$ManagementIpAddresses, 
      [Parameter(Mandatory=$true)][string]$Url="https://ICTM0902R720-6:8082/devmgr/",
      [string]$user="rw", 
      [string]$pwd="rw")

if (-not $Url.EndsWith("/")) { $Url+="/" }
$global:cred = Get-NeProxyCredential -Url $Url -ProxyUser $user -ProxyPwd $pwd

$(New-NeStorageSystem -Cred $cred -ControllerAddresses $ManagementIpAddresses) |Out-Null
Start-sleep 2 # this allows the proxy to contact the array and load it's data to memory.
$global:ss = Get-NeStorageSystem -Credential $cred |? { $_.ip1 -eq $ManagementIpAddresses[0] }

# this is a fancy trick that allows me to specify both parameters when 
# calling a cmdlet (splatting)
$global:c = @{
              Credential= $cred
              SystemId = $ss.id
             }

Write-Host "Array [$($ss.Name)] Id [$($ss.Id)]"