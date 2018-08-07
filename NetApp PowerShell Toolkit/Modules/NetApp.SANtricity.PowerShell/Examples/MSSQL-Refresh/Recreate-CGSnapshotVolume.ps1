param([ValidateScript({Test-Path $_ })]
      [string]$SMcli='C:\Program Files (x86)\StorageManager\client\SMcli.exe',
      [string]$ArrayName="Site_B_02",
      [string]$CGSnapVolume="CG_SQLServer_Test_SV_0001",
      [string]$CGSnapImage="CG_SQLServer_Test",
      [string]$CGSnapImageRevision="NEWEST",
      [string]$LogFile="RecreateCGSnapshotVolume.log"
)
Write-Host -NoNewline "* * * INFO - Stopping Consistency Group Snapshot volume [$($CGSnapVolume)]"
& $SMcli -n $ArrayName -c @"
stop cgSnapVolume [\"$($CGSnapVolume)\"] ;
"@ | Out-File -FilePath $LogFile
Write-Host -ForegroundColor Green " [Complete]"

Write-Host -NoNewline "* * * INFO - Create a new snapshot image. [$($CGSnapImage)]"
& $SMcli -n $ArrayName -c @"
create cgSnapImage ConsistencyGroup=\"$($CGSnapImage)\";
"@ |Out-File -Append -FilePath $LogFile
Write-Host -ForegroundColor Green " [Complete]"

Write-Host -NoNewline "* * * INFO - Resume Consistency Group Snapshot volume [$($CGSnapVolume)]"
& $SMcli -n $ArrayName -c @"
resume cgSnapVolume [\"$($CGSnapVolume)\"] cgSnapImage = \"$($CGSnapImage + ":"+$CGSnapImageRevision)\";
"@ | Out-File -Append -FilePath $LogFile
Write-Host -ForegroundColor Green " [Complete]"