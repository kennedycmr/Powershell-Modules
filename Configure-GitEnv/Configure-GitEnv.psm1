### script to set up git session on Windows computer. 
### change proxyserver, proxyport and gitinstallloc if your values are different.

function Configure-GitEnv() {
  # need to add to $PATH where the git binaries are. Ensure this is setup in your $ENV:PATH environment. 
  # Path should be similar to: C:\Users\{UserName}\AppData\Local\GitHubDesktop\app-1.3.2\resources\app\git\cmd

  # need to setup proxy so that we can use git. 
  $user = read-host -prompt 'Username for proxy server'
  $password = Read-Host 'Password for proxy server' -AsSecureString
  $password = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

  # I used a hosts file entry to store the IP for the proxy server as there was a problem with GIT and our proxy load balancer. 
  $proxyserver = 'PROXYDIRECT'
  $proxyport = '8081'

  $ENV:http_proxy = "http://'${user}':'${password}'@${proxyserver}:${proxyport}"
  $ENV:https_proxy = "http://'${user}':'${password}'@${proxyserver}:${proxyport}"

  write-host "Git environment setup."
}
