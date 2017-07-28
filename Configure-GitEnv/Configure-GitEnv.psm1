### script to set up git session on Windows computer. 
### change proxyserver, proxyport and gitinstallloc if your values are different.

function Configure-GitEnv() {
  # need to add to $PATH where the git binaries are
  $GITInstallLoc = 'c:\Users\kenc150\AppData\Local\GitHubDesktop\app-0.7.0\resources\app\git\cmd'
  $ENV:PATH = $ENV:PATH + ";" + $GITInstallLoc

  # need to setup proxy so that we can use git. 
  $user = read-host -prompt 'Username for proxy server'
  $password = Read-Host 'Password for proxy server' -AsSecureString
  $password = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

  $proxyserver = '172.24.32.221'
  $proxyport = '8081'

  $ENV:http_proxy = "http://'${user}':'${password}'@${proxyserver}:${proxyport}"
  $ENV:https_proxy = "http://'${user}':'${password}'@${proxyserver}:${proxyport}"

  write-host "Git environment setup."
}