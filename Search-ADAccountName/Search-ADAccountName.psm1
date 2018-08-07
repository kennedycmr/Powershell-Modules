function Search-ADAccountName {
  <#
  .Synopsis
     Searches AD domain(s) for requested SamAccountName.  

  .DESCRIPTION
     This script will search an array of entered domains for inputted SamAccountName.
   
  .EXAMPLE
     Search-ADAccountName -UserName LoginName -Domains A.Domain.com,B.Domain.com,C.Domain.com
   
  .NOTES
     Tested on PowerShell 6.5+ 
     You need read access to the domains you want to search.
     You need the ActiveDirectory powershell module installed.
   
     AUTHOR: Cameron Kennedy
     LAST EDIT: 08/06/2018 : Updated -domains parameter to allow for array input. 
   
  .INPUTS
     If you do not provide the following parameters, you will be prompted for them: 
      "-Username"
      "-Domains"
   
  .LINK
   
  #>

  param (
    [Parameter(Mandatory=$true)][string]$UserName,
	[Parameter(Mandatory=$true)]$Domains
  )

  foreach ($Domain in $Domains) {
    write-host "Searching $Domain..."
    Get-ADUser -filter {SamAccountName -eq $UserName} -Server $Domain |Select SamAccountName,GivenName,Surname,DistinguishedName,Name,UserPrincipalName,Enabled 
    write-host ""
  }
}