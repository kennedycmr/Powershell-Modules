if ($ss -eq $null) { .\Set-ScriptingEnvironment.ps1 }
Get-NeVolumeCopyPair @c |% {
    Remove-NeVolumeCopyPair @c -ObjectId $_.id 
}