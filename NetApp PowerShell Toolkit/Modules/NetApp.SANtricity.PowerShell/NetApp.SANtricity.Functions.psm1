<#
    .SYNOPSIS
    This function creates a new NeCredential.  

    .DESCRIPTION
	Mode (embedded, proxy, or both): proxy
	
    The credential will be stored in the NetApp 
    credential cache so that a credential does not need to be passed to every call to 
    SANtricity cmdlets.  It is important to understand that these credentials are not 
    credentials to the storage system.  They are to the storage system proxy.  The proxy 
    is a web service that is capable of proxying for numerous storage systems.

    .PARAMETER UserName
    The user name on the web service proxy.  

    .PARAMETER ProxyPwd
    The password for the web service proxy. This is not the password to the storage system.

    .PARAMETER Url
    The url to the web service proxy.  It should include protocol, host, port and application.

    .PARAMETER CredName
    The name this credential will be known as in the NetApp credential cache.  

    .PARAMETER ProxyUser
    This is a vestigial parameter that is included to maintain parity with the NetApp
    7mode and Cmode PowerShell modules.
#>
function Get-NeProxyCredential () {
    Param ([string] $ProxyUser, [string] $ProxyPwd, 
    [string] $Url="http://localhost:8080/devmgr/",
    [string] $CredName=[System.Environment]::MachineName, [string] $User=[System.Environment]::UserName)

    if ( ($ProxyUser.Length -eq 0) -or ($ProxyPwd.Length -eq 0) ) 
    {
        $PSCred = Get-Credential
    } 
    else 
    {
        $SecurePwd = ConvertTo-SecureString $ProxyPwd -AsPlainText -Force
        $PSCred = New-Object system.management.automation.pscredential($ProxyUser,$SecurePwd)
    }
    $CredName = [System.Net.Dns]::GetHostName()
    New-NeCredential -CredentialUser $User -ProxyUrl $Url -CredentialName $CredName -SystemCredential $PSCred 
}

<#
    .SYNOPSIS
    Lists all of the commands in this PowerShell module.  

    .DESCRIPTION
	Mode (embedded, proxy, or both): both
	
    This function lists all of the commands in this PowerShell module.  

    .PARAMETER filter
    This is a string. This will filter out all cmdlets that cannot be run on a given framework. 
    If you type in "proxy" it will filter out all the cmdlets that can only be run on embedded. 
    If you type in "embedded" it will filter out all the cmdelts that can only be run on a proxy.
#>
function Get-NeCommands([string]$filter)
{
    $allCommands = ((Get-Module -list -name Netapp.SANtricity.PowerShell).exportedcommands.keys |sort-object )
    $output = ($allCommands | Get-Command | Select-Object @{
        Expression={$_.Name};
        Label="Name";
        },@{
            Expression={
                (Get-Help $_.Name).Synopsis
            };
            Label="Synopsis"
        },@{Expression={
                $modeInfo = (([string]((Get-help $_).Description[0])).split(":}")[1]).split("`r`n")[0]
                if($modeInfo -ne $null) {
                    $modeInfo
                } else {
                    "No Mode Info Available"
                }
        };
        Label="Mode"        
    })
    
    if($filter -eq "proxy") {
        $rv = $output | where {$_.mode -ne "embedded"}
    }
    elseif ($filter -eq "embedded") {
        $rv = $output | where {$_.mode -ne "proxy"}
    }
    else {
        $rv = $output
    }
    $rv
}

<#
    .SYNOPSIS
    Sets/Unsets the environment variable that logs debug ouput to the Event Log  

    .DESCRIPTION
	Mode (embedded, proxy, or both): both

    This function Sets/Unsets the environment variable that logs debug ouput to the Event Log  
#>
function Set-NeEventLogDebug()
{
	param( [Parameter(ParameterSetName='On')]  [Switch] $On = $false, 
	       [Parameter(ParameterSetName='Off')] [Switch] $Off = $false)
	$output = "SANtricity PowerShell Toolkit - Debug Output to Event Log "
	if ($On)
	{
		$env:SANtricityPSTKEventLog=$true
	    $color = "green"
	    $status = "[ON]"
	}
	elseif ($Off)
	{
		Remove-Item Env:\SANtricityPSTKEventLog
	    $color = "red"
	    $status = "[OFF]"
	}
	Write-Host -NoNewline $output
	Write-Host -ForegroundColor $color "$status"
}

<#
    .SYNOPSIS
    Retrieve web server component build information. 

    .DESCRIPTION
	Mode (embedded, proxy, or both): both

    This retrieves web server component build information.  
#>

function Get-NeBuildinfo()
{
	$getBuildInfoCmdlet = Get-Command 'Get-NeBuildinfo' -CommandType Cmdlet
	$c = '& $getBuildInfoCmdlet '+$args
    (Invoke-Expression $c).Components
}

<#
    .SYNOPSIS
    This gets a key-value pair

    .DESCRIPTION
	Mode (embedded, proxy, or both): both

    This gets a key-value pair  
#>
function Get-NeKeyValue()
{
    # Invoke the actual credential creation process
    $splat = @{}
    for($i=0; $i -lt $args.Count; $i+=2) {
        $splat.($args[$i]) = $args[$i+1]
    }
	$splat.ErrorAction = "stop"
	$getKeyValueCmdlet = Get-Command 'Get-NeKeyValue' -CommandType Cmdlet

	& $getKeyValueCmdlet @splat | Select-Object -Property * -ExcludeProperty "ValueList"
}

<#
    .SYNOPSIS
    This makes a key-value pair

    .DESCRIPTION
	Mode (embedded, proxy, or both): both

    This makes a key-value pair  
#>
function New-NeKeyValue()
{
    # Invoke the actual credential creation process
    $splat = @{}
    for($i=0; $i -lt $args.Count; $i+=2) {
        $splat.($args[$i]) = $args[$i+1]
    }
	$splat.ErrorAction = "stop"
	$getKeyValueCmdlet = Get-Command 'New-NeKeyValue' -CommandType Cmdlet

	& $getKeyValueCmdlet @splat | Select-Object -Property * -ExcludeProperty "ValueList"
}

<#
    .SYNOPSIS
    Returns $true when debug logging is enabled for this session of the PowerShell Toolkit.

    .DESCRIPTION
	Mode (embedded, proxy, or both): both

    Returns $true when debug logging is enabled for this session of the PowerShell Toolkit.
#>
function Get-NeEventLogDebug()
{
	$var = $env:SANtricityPSTKEventLog
	if ($var -eq $null) 
	{
		$false
	} else {
		$true
	}
}


<#
    .SYNOPSIS
    Retrieve web server component build information. 

    .DESCRIPTION
	Mode (embedded, proxy, or both): both

    This retrieves web server component build information.  
#>
function New-NeCredential()
{
    # Invoke the actual credential creation process
    $splat = @{}
    for($i=0; $i -lt $args.Count; $i+=2) {
        $splat.($args[$i]) = $args[$i+1]
    }
	$splat.ErrorAction = "stop"
	$newCredentialCmdlet = Get-Command 'New-NeCredential' -CommandType Cmdlet

	$returnValue = & $newCredentialCmdlet @splat
	
	if(Test-Path Env:\SANtricityAutoSupportOptOut) 
	{
		return $returnValue
	}
	
	# ASUP Data collection and storage services Here!!!
	# Now move the credential cache so that we don't overwrite it during our ASUP shenanigans:
	$credCacheLocation = [Environment]::GetFolderPath("CommonApplicationData")
	$credCacheLocation = $credCacheLocation+"/OnCommand/Common/"
	if (Test-path -Path $credCacheLocation"StorageSystemsOld.xml") {
		$lock=$false
	} else {
		$lock=$true
	}
	if((Test-Path -Path $credCacheLocation"StorageSystems.xml") -and (-Not (Test-Path -Path $credCacheLocation"StorageSystemsOld.xml")))
	{
		Move-Item $credCacheLocation"StorageSystems.xml" $credCacheLocation"StorageSystemsOld.xml"
	}
	
    # Collect the ASUP Data
    $poshPid = [System.Diagnostics.Process]::GetCurrentProcess().ID
    if($returnValue.Credential -ne $null) {
        $credPw = $returnValue.Credential.Password
    } else {
        return $returnValue
    }
	$ModuleBase = (Get-Module -list -name Netapp.SANtricity.PowerShell)[0].ModuleBase
	$dllPath = Join-Path $ModuleBase "NetApp.SANtricity.PowerShell.dll"
    $dataPack = @{
        'host' = @{
                    'os' = [environment]::OSVersion.Version.ToString()
                    'posh-ver' = $Host.Version.ToString()
                    'toolkit-ver' = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($dllPath).ProductVersion
                    'posh-pid' = $poshPid
                 }
        'wsp'  = @{
                    'proxy' = $returnValue.Url
                    'proxy-user' = $returnValue.Credential.UserName
                    'proxy-pwd' = ($credPw | ConvertFrom-SecureString).ToString()
                    'array-count' = (Get-NeStorageSystem -Credential $returnValue).Count
                    'embedded' = -Not $returnValue.Proxy
                 }

    }

    # Make a spot for the data
    $asupDataLocation = [Environment]::GetFolderPath('ApplicationData')+"\NetApp\SANtricity_PSTK\"
    $cmdletDetails = "pstk_"+$env:COMPUTERNAME+"_"+$poshPid+"_"+(Get-Date -Format yyyy.M.d)
	$credentialCounter = 0
	if(Test-Path "$asupDataLocation") {
		$credentialCounter = (ls "$asupDataLocation$cmdletDetails*").Count
	}

    # Now add it to our repo iff it is unique for today
    $lastCredential = $asupDataLocation+$cmdletDetails+"_"+($credentialCounter-1)    
    $currentCredential = $asupDataLocation+$cmdletDetails+"_"+($credentialCounter)
    $currentCredentialContents = Convertto-Json $dataPack
    if(Test-Path $lastCredential) {
		$lastCredentialContents = gc $lastCredential -raw
        if(($lastCredentialContents -eq $null) -or ($lastCredentialContents).Trim() -eq $currentCredentialContents) {
            # Skip!
        } else {
            $currentCredentialContents > $currentCredential
        }
    }
    else {
        New-Item -ItemType File -Force -Path $currentCredential | Out-Null
        $currentCredentialContents > $currentCredential
    }

	# Finally, restore the previous cache if there is one. Otherwise, delete the current cache.
	if(-Not $lock) {
		return $returnValue
	}
	if(Test-Path -Path $credCacheLocation"StorageSystemsOld.xml") {
		Move-Item $credCacheLocation"StorageSystemsOld.xml" $credCacheLocation"StorageSystems.xml" -force
	}
	else {
		Remove-Item $credCacheLocation"StorageSystems.xml"
	}

    # Return the credential
    $returnValue
}

<#
    .SYNOPSIS
	This will run when the module is loaded. It schedules a job to dispatch the ASUP data on MWF at 12:00PM.

    .DESCRIPTION
	Mode (embedded, proxy, or both): both

    This will run when the module is loaded. It schedules a job to dispatch the ASUP data on MWF at 12:00PM.  
#>
function Start-NeAutoSupport {
    #Job Name:
    $jobName = "SANtricity-PSTK-ASUP-Dispatch"
	
    # If the job already exists, skip it.
    if($jobName -in (Get-ScheduledJob).Name) {
        return
    }
    else {
        # Now register the job! :)
        $trigger = New-JobTrigger -Weekly -At 12:00 -DaysOfWeek @("Monday", "Wednesday", "Friday")
        $schedJobOption = New-ScheduledJobOption -MultipleInstancePolicy StopExisting -RequireNetwork -StartIfOnBattery
        Register-ScheduledJob -Name $jobName -Trigger $trigger -ScriptBlock {Send-NeAutoSupportData} -ScheduledJobOption $schedJobOption
    }
}

<#
    .SYNOPSIS
	This function will send the ASUP Data as a KVP to the wsp. It'll run MWF at 12:00, or whenevert the user runs this cmdlet.

    .DESCRIPTION
	Mode (embedded, proxy, or both): both

	This function will send the ASUP Data as a KVP to the wsp. It'll run MWF at 12:00, or whenevert the user runs this cmdlet.
#>
function Send-NeAutoSupportData {
    $asupDataLocation = [Environment]::GetFolderPath('ApplicationData')+"\NetApp\SANtricity_PSTK\"
	
	# Now move the credential cache so that we don't overwrite it, but if someone else is already trying to protect
	# a old cache, don't touch it!
	$credCacheLocation = [Environment]::GetFolderPath("CommonApplicationData")
	$credCacheLocation = $credCacheLocation+"/OnCommand/Common/"
	if (Test-path -Path $credCacheLocation"StorageSystemsOld.xml") {
		$lock=$false
	} else {
		$lock=$true
	}
	if((Test-Path -Path $credCacheLocation"StorageSystems.xml") -and ($lock))
	{
		Move-Item $credCacheLocation"StorageSystems.xml" $credCacheLocation"StorageSystemsOld.xml"
	}
	
    try{
	    foreach($file in (ls "$asupDataLocation")) {
		    if($file -match "pstk_") {
				$rawData = (gc -raw $asupDataLocation$file)
                $data = $rawData | ConvertFrom-Json
				$rawData = $rawData -replace "[\s]", ''
				$rawData = $rawData -replace "\n", ''
				$rawData = $rawData -replace "\r", ''

                # Recover the credential
                $PSCred = New-Object system.management.automation.pscredential($data.wsp."proxy-user",($data.wsp."proxy-pwd" | ConvertTo-SecureString))
                $Url = $data.wsp."proxy"
                $User = [Environment]::UserName
                $CredName = [System.Environment]::MachineName
	            $newCredentialCmdlet = Get-Command 'New-NeCredential' -CommandType Cmdlet
	            $cred = & $newCredentialCmdlet -CredentialUser $User -ProxyUrl $Url -CredentialName $CredName -SystemCredential $PSCred

                # Send the ASUP data off
			    New-NeKeyValue -Credential $cred -Key $file -ValueList $rawData | Out-Null
				Remove-Item $asupDataLocation$file
		    }
        }
        Write-EventLog -LogName "NetApp SANtricity PowerShell Toolkit" -Source "NetApp SANtricity PowerShell Toolkit" -EntryType Information -EventId 201 -Message "The ASUP data was successfully sent to the WSP."
    }
    catch {
		Write-Host $_
		Write-Host $_.GetType()
		Write-Host $_.Exception
		Write-Host $_.Excpetion.StackTrace
        Write-EventLog -LogName "NetApp SANtricity PowerShell Toolkit" -Source "NetApp SANtricity PowerShell Toolkit" -EntryType Error -EventId 201 -Message "A fatal error occurred when sending the ASUP data to the WSP."
		throw
	}
	
	# Finally, restore the previous cache if there is one. Otherwise, delete the current cache. However,
	# if we don't have the lock on this, just proceed and do nothing.
	if(-not $lock) {
		return
	}
	if(Test-Path -Path $credCacheLocation"StorageSystemsOld.xml") {
		Move-Item $credCacheLocation"StorageSystemsOld.xml" $credCacheLocation"StorageSystems.xml" -force
	}
	else {
		Remove-Item $credCacheLocation"StorageSystems.xml"
	}
}

<#
    .SYNOPSIS
    Returns information related to the NetApp SANtricity PowerShell module and took kit version running on the system.

    .DESCRIPTION
	Mode (embedded, proxy, or both): both

    Returns information related to the NetApp SANtricity PowerShell module and took kit version running on the system.
#>
function Get-NeModuleinfo()
{
	$ModuleVersion =  (Get-Module -list -name Netapp.SANtricity.PowerShell).Version.ToString()
	Write-Host "NetApp SANtricity PowerShell Module Version : " $ModuleVersion
	$ModuleBase = (Get-Module -list -name Netapp.SANtricity.PowerShell).ModuleBase
	$dllPath = $ModuleBase + "\NetApp.SANtricity.PowerShell.dll"
	$toolKitVer = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($dllPath).ProductVersion
	Write-Host "NetApp SANtricity PowerShell ToolKit Version : " $toolKitVer
}

Set-Alias -Name "Get-NeConsistencyGroup" -Value "Get-NeCG"
Set-Alias -Name "New-NeConsistencyGroupMember" -Value "Update-NeCGMemberVolumes"
Set-Alias -Name "New-NeSnapshot" -Value "New-NeSnapshotImages"
Set-Alias -Name "Get-NeSnapshot" -Value "Get-NeSnapshotImages"
Set-Alias -Name "Remove-NeSnapshot" -Value "Remove-NeSnapshotImages"
Set-Alias -Name "New-NeConsistencyGroup" -Value "New-NeCG"
Set-Alias -Name "Remove-NeConsistencyGroupMember" -Value "Remove-NeCGMemberVolumes"
Set-Alias -Name "Get-NeConsistencyGroupMember" -Value "Get-NeCGMemberVolumes"
Set-Alias -Name "Get-NeAsyncMirrorGroups" -Value "Get-NeAsyncMirrorGroup"
Set-Alias -name "Get-NeAsyncMirrorPairs" -Value "Get-NeAsyncMirrorGroupPairs"
Set-Alias -name "Get-NeAsyncMirrorGroupStorageSystems" -Value "Get-NeAsyncMirrorGroupArvmArrays"
Set-Alias -name "Get-NeAsyncMirrorIncompletePairs" -Value "Get-NeAsyncMirrorGroupIncompletePairs"
Set-Alias -name "Get-NeAsyncMirrorPairsRepositoryUtilization" -Value "Get-NeAsyncMirrorGroupPairsRepositoryUtilization"
Set-Alias -name "Get-NeFirmwareUpgrade" -Value "Get-NeCfwUpgrade"
Set-Alias -name "Get-NeConsistencyGroupSnapshots" -Value "Get-NeCGSnapshots"
Set-Alias -name "Get-NeConsistencyGroupViews" -Value "Get-NeCGViews"
Set-Alias -name "Get-NeConsistencyGroupViewVolumes" -Value "Get-NeCGViewsViews"
Set-Alias -name "Get-NeEthernetInterfaces" -Value "Get-NeConfigEthernetInterfaces"
Set-Alias -name "Get-NeValidateConfig" -Value "Get-NeConfigValidate"
Set-Alias -name "Get-NeSyslogConfig" -Value "Get-NeDeviceAlertsAlertSyslog"
Set-Alias -name "Get-NeDeviceAlertsConfig" -Value "Get-NeDeviceAlerts"
Set-Alias -name "Get-NeFirmwareFiles" -Value "Get-NeFirmwareCfwFiles"
Set-Alias -name "Get-NeStorageSystemFromFolder" -Value "Get-NeFolderStorageDevices"
Set-Alias -name "Get-NeAvailableMelEvents" -Value "Get-NeMelEventsAvailable"
Set-Alias -name "Get-NeRemoteMirrorSyncProgress" -Value "Get-NeRemoteMirrorPairsMirrorSyncProgress"
Set-Alias -name "Get-NeRemoteMirrorVolumeCandidates" -Value "Get-NeRemoteMirrorPairsRemoteMirrorTargetCandidates"
Set-Alias -name "Get-NeConcatRepositoryVolumes" -Value "Get-NeRepositoriesConcat"
Set-Alias -name "Get-NeVolumeExpansion" -Value "Get-NeVolumeExpand"
Set-Alias -name "Get-NeVolumeGroupExpansionCandidates" -Value "Get-NeVolumeGroupExpand"
Set-Alias -name "Get-NeVolumeGroupReductionCount" -Value "Get-NeVolumeGroupReduction"
Set-Alias -name "New-NeAsyncMirrorPairs" -Value "New-NeAsyncMirrorGroupPairs"
Set-Alias -name "New-NeAsyncMirrorGroups" -Value "New-NeAsyncMirrorGroup"
Set-Alias -name "New-NeConsistencyGroupSnapshots" -Value "New-NeCGSnapshots"
Set-Alias -name "New-NeConsistencyGroupViews" -Value "New-NeCGViews"
Set-Alias -name "New-NeConsistencyGroupViewsBatch" -Value "New-NeCGViewsBatch"
Set-Alias -name "Remove-NeAsyncMirrorGroups" -Value "Remove-NeAsyncMirrorGroup"
Set-Alias -name "Remove-NeAsyncMirrorIncompletePairs" -Value "Remove-NeAsyncMirrorGroupIncompletePairs"
Set-Alias -name "Remove-NeAsyncMirrorPairs" -Value "Remove-NeAsyncMirrorGroupPairs"
Set-Alias -name "Remove-NeConsistencyGroup" -Value "Remove-NeCG"
Set-Alias -name "Remove-NeConsistencyGroupMember" -Value "Remove-NeCGMemberVolumes"
Set-Alias -name "Remove-NeConsistencyGroupSnapshots" -Value "Remove-NeCGSnapshots"
Set-Alias -name "Remove-NeConsistencyGroupViews" -Value "Remove-NeCGViews"
Set-Alias -name "Set-NeResumeAsyncMirrorGroup" -Value "Set-NeAsyncMirrorGroupResume"
Set-Alias -name "Set-NeSuspendAsyncMirrorPair" -Value "Set-NeAsyncMirrorGroupSuspend"
Set-Alias -name "Set-NeSyncAsyncMirrorPair" -Value "Set-NeAsyncMirrorGroupSync"
Set-Alias -name "Set-NeResumeFlashCache" -Value "Set-NeFlashCacheResume"
Set-Alias -name "Set-NeSuspendFlashCache" -Value "Set-NeFlashCacheSuspend"
Set-Alias -name "Test-NeTestAsyncMirrorConnectivity" -Value "Test-NeAsyncMirrorGroupTest"
Set-Alias -name "Test-NeSendTestEmail" -Value "Test-NeDeviceAlertsAlertEmailTest"
Set-Alias -name "Test-NeSendTestSyslogMessages" -Value "Test-NeDeviceAlertsAlertSyslogTest"
Set-Alias -name "Test-NeTestRemoteMirrorCommunication" -Value "Test-NeRemoteMirrorPairsTestRemoteMirrorCommunication"
Set-Alias -name "Update-NeAsyncMirrorGroups" -Value "Update-NeAsyncMirrorGroup"
Set-Alias -name "Update-NeAsyncMirrorIncompletePairs" -Value "Update-NeAsyncMirrorGroupIncompletePairs"
Set-Alias -name "Update-NeFirmwareUpgrade" -Value "Update-NeCfwUpgrade"
Set-Alias -name "Update-NeActivateFirmwareUpgrade" -Value "Update-NeCfwUpgradeActivate"
Set-Alias -name "Update-NeConsistencyGroup" -Value "Update-NeCG"
Set-Alias -name "Update-NeConsistencyGroupMember" -Value "Update-NeCGMemberVolumes"
Set-Alias -name "Update-NeConsistencyGroupMemberBatch" -Value "Update-NeCGMemberVolumesBatch"
Set-Alias -name "Update-NeRollbackCgSnapshot" -Value "Update-NeCGSnapshotsRollback"
Set-Alias -name "Update-NeEthernetInterfaces" -Value "Update-NeConfigEthernetInterfaces"
Set-Alias -name "Update-NeValidateConfig" -Value "Update-NeConfigValidate"
Set-Alias -name "Update-NeDeviceAlertsConfig" -Value "Update-NeDeviceAlerts"
Set-Alias -name "Update-NeSyslogConfig" -Value "Update-NeDeviceAlertsAlertSyslog"
Set-Alias -name "Update-NeAddDrivesToFlashCache" -Value "Update-NeFlashCacheAddDrives"
Set-Alias -name "Update-NeConfigureFalshCache" -Value "Update-NeFlashCacheConfigure"
Set-Alias -name "Update-NeRemoveDrivesFromFlashCache" -Value "Update-NeFlashCacheRemoveDrives"
Set-Alias -name "Update-NeMoveHost" -Value "Update-NeHostMove"
Set-Alias -name "Update-NeExpandConcatRepositoryVolume" -Value "Update-NeRepositoriesConcatExpand"
Set-Alias -name "Update-NeConcatRepositoriesFromMutipleVolumes" -Value "Update-NeRepositoriesConcatMultiple"
Set-Alias -name "Update-NeConcatRepositoriesFromSingleVolume" -Value "Update-NeRepositoriesConcatSingle"
Set-Alias -name "Update-NeConvertToReadWriteSnapshotVolume" -Value "Update-NeSnapshotVolumeConvertReadOnly"
Set-Alias -name "Update-NeThinVolumeExpansion" -Value "Update-NeThinVolumeExpand"
Set-Alias -name "Update-NeInitializeThinVolume" -Value "Update-NeThinVolumeInitialize"
Set-Alias -name "Update-NeDownloadFirmwareUpgrade" -Value "Update-NeUpgradeDownload"
Set-Alias -name "Update-NeReloadFirmwareUpgrade" -Value "Update-NeUpgradeReload"
Set-Alias -name "Update-NeVolumeExpansion" -Value "Update-NeVolumeExpand"
Set-Alias -name "Update-NeVolumeGroupExpansion" -Value "Update-NeVolumeGroupExpand"
Set-Alias -name "Update-NeInitializeVolume" -Value "Update-NeVolumeInitialize"
Set-Alias -name "Update-NeMoveVolumeMappings" -Value "Update-NeVolumeMappingsMove"
Export-ModuleMember -Function * -Alias *

Start-NeAutoSupport
# SIG # Begin signature block
# MIIYEgYJKoZIhvcNAQcCoIIYAzCCF/8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCC2eQaylL8Q5eQS
# j5uoc5zytPctC5I8QZ9T1P/NJIMLR6CCEscwggPuMIIDV6ADAgECAhB+k+v7fMZO
# WepLmnfUBvw7MA0GCSqGSIb3DQEBBQUAMIGLMQswCQYDVQQGEwJaQTEVMBMGA1UE
# CBMMV2VzdGVybiBDYXBlMRQwEgYDVQQHEwtEdXJiYW52aWxsZTEPMA0GA1UEChMG
# VGhhd3RlMR0wGwYDVQQLExRUaGF3dGUgQ2VydGlmaWNhdGlvbjEfMB0GA1UEAxMW
# VGhhd3RlIFRpbWVzdGFtcGluZyBDQTAeFw0xMjEyMjEwMDAwMDBaFw0yMDEyMzAy
# MzU5NTlaMF4xCzAJBgNVBAYTAlVTMR0wGwYDVQQKExRTeW1hbnRlYyBDb3Jwb3Jh
# dGlvbjEwMC4GA1UEAxMnU3ltYW50ZWMgVGltZSBTdGFtcGluZyBTZXJ2aWNlcyBD
# QSAtIEcyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsayzSVRLlxwS
# CtgleZEiVypv3LgmxENza8K/LlBa+xTCdo5DASVDtKHiRfTot3vDdMwi17SUAAL3
# Te2/tLdEJGvNX0U70UTOQxJzF4KLabQry5kerHIbJk1xH7Ex3ftRYQJTpqr1SSwF
# eEWlL4nO55nn/oziVz89xpLcSvh7M+R5CvvwdYhBnP/FA1GZqtdsn5Nph2Upg4XC
# YBTEyMk7FNrAgfAfDXTekiKryvf7dHwn5vdKG3+nw54trorqpuaqJxZ9YfeYcRG8
# 4lChS+Vd+uUOpyyfqmUg09iW6Mh8pU5IRP8Z4kQHkgvXaISAXWp4ZEXNYEZ+VMET
# fMV58cnBcQIDAQABo4H6MIH3MB0GA1UdDgQWBBRfmvVuXMzMdJrU3X3vP9vsTIAu
# 3TAyBggrBgEFBQcBAQQmMCQwIgYIKwYBBQUHMAGGFmh0dHA6Ly9vY3NwLnRoYXd0
# ZS5jb20wEgYDVR0TAQH/BAgwBgEB/wIBADA/BgNVHR8EODA2MDSgMqAwhi5odHRw
# Oi8vY3JsLnRoYXd0ZS5jb20vVGhhd3RlVGltZXN0YW1waW5nQ0EuY3JsMBMGA1Ud
# JQQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIBBjAoBgNVHREEITAfpB0wGzEZ
# MBcGA1UEAxMQVGltZVN0YW1wLTIwNDgtMTANBgkqhkiG9w0BAQUFAAOBgQADCZuP
# ee9/WTCq72i1+uMJHbtPggZdN1+mUp8WjeockglEbvVt61h8MOj5aY0jcwsSb0ep
# rjkR+Cqxm7Aaw47rWZYArc4MTbLQMaYIXCp6/OJ6HVdMqGUY6XlAYiWWbsfHN2qD
# IQiOQerd2Vc/HXdJhyoWBl6mOGoiEqNRGYN+tjCCBKMwggOLoAMCAQICEA7P9DjI
# /r81bgTYapgbGlAwDQYJKoZIhvcNAQEFBQAwXjELMAkGA1UEBhMCVVMxHTAbBgNV
# BAoTFFN5bWFudGVjIENvcnBvcmF0aW9uMTAwLgYDVQQDEydTeW1hbnRlYyBUaW1l
# IFN0YW1waW5nIFNlcnZpY2VzIENBIC0gRzIwHhcNMTIxMDE4MDAwMDAwWhcNMjAx
# MjI5MjM1OTU5WjBiMQswCQYDVQQGEwJVUzEdMBsGA1UEChMUU3ltYW50ZWMgQ29y
# cG9yYXRpb24xNDAyBgNVBAMTK1N5bWFudGVjIFRpbWUgU3RhbXBpbmcgU2Vydmlj
# ZXMgU2lnbmVyIC0gRzQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCi
# Yws5RLi7I6dESbsO/6HwYQpTk7CY260sD0rFbv+GPFNVDxXOBD8r/amWltm+YXkL
# W8lMhnbl4ENLIpXuwitDwZ/YaLSOQE/uhTi5EcUj8mRY8BUyb05Xoa6IpALXKh7N
# S+HdY9UXiTJbsF6ZWqidKFAOF+6W22E7RVEdzxJWC5JH/Kuu9mY9R6xwcueS51/N
# ELnEg2SUGb0lgOHo0iKl0LoCeqF3k1tlw+4XdLxBhircCEyMkoyRLZ53RB9o1qh0
# d9sOWzKLVoszvdljyEmdOsXF6jML0vGjG/SLvtmzV4s73gSneiKyJK4ux3DFvk6D
# Jgj7C72pT5kI4RAocqrNAgMBAAGjggFXMIIBUzAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDBzBggrBgEFBQcBAQRn
# MGUwKgYIKwYBBQUHMAGGHmh0dHA6Ly90cy1vY3NwLndzLnN5bWFudGVjLmNvbTA3
# BggrBgEFBQcwAoYraHR0cDovL3RzLWFpYS53cy5zeW1hbnRlYy5jb20vdHNzLWNh
# LWcyLmNlcjA8BgNVHR8ENTAzMDGgL6AthitodHRwOi8vdHMtY3JsLndzLnN5bWFu
# dGVjLmNvbS90c3MtY2EtZzIuY3JsMCgGA1UdEQQhMB+kHTAbMRkwFwYDVQQDExBU
# aW1lU3RhbXAtMjA0OC0yMB0GA1UdDgQWBBRGxmmjDkoUHtVM2lJjFz9eNrwN5jAf
# BgNVHSMEGDAWgBRfmvVuXMzMdJrU3X3vP9vsTIAu3TANBgkqhkiG9w0BAQUFAAOC
# AQEAeDu0kSoATPCPYjA3eKOEJwdvGLLeJdyg1JQDqoZOJZ+aQAMc3c7jecshaAba
# tjK0bb/0LCZjM+RJZG0N5sNnDvcFpDVsfIkWxumy37Lp3SDGcQ/NlXTctlzevTcf
# Q3jmeLXNKAQgo6rxS8SIKZEOgNER/N1cdm5PXg5FRkFuDbDqOJqxOtoJcRD8HHm0
# gHusafT9nLYMFivxf1sJPZtb4hbKE4FtAC44DagpjyzhsvRaqQGvFZwsL0kb2yK7
# w/54lFHDhrGCiF3wPbRRoXkzKy57udwgCRNx62oZW8/opTBXLIlJP7nPf8m/PiJo
# Y1OavWl0rMUdPH+S4MO8HNgEdTCCBM0wggO1oAMCAQICEG9+qsO9F1i/BbAucWqM
# i8swDQYJKoZIhvcNAQELBQAwfzELMAkGA1UEBhMCVVMxHTAbBgNVBAoTFFN5bWFu
# dGVjIENvcnBvcmF0aW9uMR8wHQYDVQQLExZTeW1hbnRlYyBUcnVzdCBOZXR3b3Jr
# MTAwLgYDVQQDEydTeW1hbnRlYyBDbGFzcyAzIFNIQTI1NiBDb2RlIFNpZ25pbmcg
# Q0EwHhcNMTUwODE4MDAwMDAwWhcNMTgxMDExMjM1OTU5WjBgMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKQ2FsaWZvcm5pYTESMBAGA1UEBxMJU3Vubnl2YWxlMRMwEQYD
# VQQKFApOZXRBcHAgSW5jMRMwEQYDVQQDFApOZXRBcHAgSW5jMIIBIjANBgkqhkiG
# 9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1JdaO9tE5mhD3m3L/EHy7uWDx+CG9ND1LJwE
# i3oNmhn+b4VldDdKfS/b7wHvxlEEKoitImndL4LQifCAdLWMUBewwJm60M04M4u2
# Ve5VKcegAwI+REc1wKhb8GM3O+jpvBGEuzEIK+F3lM1Vow4DG6hDfrN1AckB2KBO
# 0oVKA2mWcTBoboipPjUJ5ykf//9tcrWkJXhrJcj6UuAMfyyYb8WTfqyfdrcxlQ0Q
# O6GfxLNHhsp+AGDtkBaSpoYeszKlzhre69lMrxePS1Ybj3V4dqOMlt36OSPcBHjB
# L4bpOT9EY/saO9GwSf2gqV1iiMyNFtrK9eHztEbOkbIg0GKNCQIDAQABo4IBYjCC
# AV4wCQYDVR0TBAIwADAOBgNVHQ8BAf8EBAMCB4AwKwYDVR0fBCQwIjAgoB6gHIYa
# aHR0cDovL3N2LnN5bWNiLmNvbS9zdi5jcmwwZgYDVR0gBF8wXTBbBgtghkgBhvhF
# AQcXAzBMMCMGCCsGAQUFBwIBFhdodHRwczovL2Quc3ltY2IuY29tL2NwczAlBggr
# BgEFBQcCAjAZDBdodHRwczovL2Quc3ltY2IuY29tL3JwYTATBgNVHSUEDDAKBggr
# BgEFBQcDAzBXBggrBgEFBQcBAQRLMEkwHwYIKwYBBQUHMAGGE2h0dHA6Ly9zdi5z
# eW1jZC5jb20wJgYIKwYBBQUHMAKGGmh0dHA6Ly9zdi5zeW1jYi5jb20vc3YuY3J0
# MB8GA1UdIwQYMBaAFJY7U/B5M5evfYPvLivMyreGHnJmMB0GA1UdDgQWBBTgs8Jh
# YS+FElQ3WjdcDK0yjiQ3VDANBgkqhkiG9w0BAQsFAAOCAQEADdo8SoxYgb0W6sH/
# Cghoxs+DwX8GsmFMQQPuUQst8qHZ3stkjJTk9yZffCtilovgy/XGsGPGtTl79wDh
# 3/A9bXuzCSI/g+JDiSgdcEDLowbnOj+XiG8Bfo6nT2+/vQMNvFMEnrjN9fVvwgs2
# dKyzr9XZ72tXLPtm4HoZ58zaBj3SjwMdVLxLuAxU5krnkWOlY9bkHJo1FChzC4z2
# 2YxP4Nm/68vHvEfu3ZRVlLp4MtmGysm2GadIwjODxQcb/Roq56kg1A524apwfe+N
# ncnfijMZci6nCFTW6++OiWALLSFpmShx2HQR1cifK0ac70Woj7KydJ6GQKOKxHRm
# SCxQIzCCBVkwggRBoAMCAQICED141/l2SWCyYX308B7KhiowDQYJKoZIhvcNAQEL
# BQAwgcoxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0G
# A1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazE6MDgGA1UECxMxKGMpIDIwMDYg
# VmVyaVNpZ24sIEluYy4gLSBGb3IgYXV0aG9yaXplZCB1c2Ugb25seTFFMEMGA1UE
# AxM8VmVyaVNpZ24gQ2xhc3MgMyBQdWJsaWMgUHJpbWFyeSBDZXJ0aWZpY2F0aW9u
# IEF1dGhvcml0eSAtIEc1MB4XDTEzMTIxMDAwMDAwMFoXDTIzMTIwOTIzNTk1OVow
# fzELMAkGA1UEBhMCVVMxHTAbBgNVBAoTFFN5bWFudGVjIENvcnBvcmF0aW9uMR8w
# HQYDVQQLExZTeW1hbnRlYyBUcnVzdCBOZXR3b3JrMTAwLgYDVQQDEydTeW1hbnRl
# YyBDbGFzcyAzIFNIQTI1NiBDb2RlIFNpZ25pbmcgQ0EwggEiMA0GCSqGSIb3DQEB
# AQUAA4IBDwAwggEKAoIBAQCXgx4AFq8ssdIIxNdok1FgHnH24ke021hNI2JqtL9a
# G1H3ow0Yd2i72DarLyFQ2p7z518nTgvCl8gJcJOp2lwNTqQNkaC07BTOkXJULs6j
# 20TpUhs/QTzKSuSqwOg5q1PMIdDMz3+b5sLMWGqCFe49Ns8cxZcHJI7xe74xLT1u
# 3LWZQp9LYZVfHHDuF33bi+VhiXjHaBuvEXgamK7EVUdT2bMy1qEORkDFl5KK0VOn
# mVuFNVfT6pNiYSAKxzB3JBFNYoO2untogjHuZcrf+dWNsjXcjCtvanJcYISc8gyU
# XsBWUgBIzNP4pX3eL9cT5DiohNVGuBOGwhud6lo43ZvbAgMBAAGjggGDMIIBfzAv
# BggrBgEFBQcBAQQjMCEwHwYIKwYBBQUHMAGGE2h0dHA6Ly9zMi5zeW1jYi5jb20w
# EgYDVR0TAQH/BAgwBgEB/wIBADBsBgNVHSAEZTBjMGEGC2CGSAGG+EUBBxcDMFIw
# JgYIKwYBBQUHAgEWGmh0dHA6Ly93d3cuc3ltYXV0aC5jb20vY3BzMCgGCCsGAQUF
# BwICMBwaGmh0dHA6Ly93d3cuc3ltYXV0aC5jb20vcnBhMDAGA1UdHwQpMCcwJaAj
# oCGGH2h0dHA6Ly9zMS5zeW1jYi5jb20vcGNhMy1nNS5jcmwwHQYDVR0lBBYwFAYI
# KwYBBQUHAwIGCCsGAQUFBwMDMA4GA1UdDwEB/wQEAwIBBjApBgNVHREEIjAgpB4w
# HDEaMBgGA1UEAxMRU3ltYW50ZWNQS0ktMS01NjcwHQYDVR0OBBYEFJY7U/B5M5ev
# fYPvLivMyreGHnJmMB8GA1UdIwQYMBaAFH/TZafC3ey78DAJ80M5+gKvMzEzMA0G
# CSqGSIb3DQEBCwUAA4IBAQAThRoeaak396C9pK9+HWFT/p2MXgymdR54FyPd/ewa
# A1U5+3GVx2Vap44w0kRaYdtwb9ohBcIuc7pJ8dGT/l3JzV4D4ImeP3Qe1/c4i6nW
# z7s1LzNYqJJW0chNO4LmeYQW/CiwsUfzHaI+7ofZpn+kVqU/rYQuKd58vKiqoz0E
# Aeq6k6IOUCIpF0yH5DoRX9akJYmbBWsvtMkBTCd7C6wZBSKgYBU/2sn7TUyP+3Jn
# d/0nlMe6NQ6ISf6N/SivShK9DbOXBd5EDBX6NisD3MFQAfGhEV0U5eK9J0tUviuE
# Xg+mw3QFCu+Xw4kisR93873NQ9TxTKk/tYuEr2Ty0BQhMYIEoTCCBJ0CAQEwgZMw
# fzELMAkGA1UEBhMCVVMxHTAbBgNVBAoTFFN5bWFudGVjIENvcnBvcmF0aW9uMR8w
# HQYDVQQLExZTeW1hbnRlYyBUcnVzdCBOZXR3b3JrMTAwLgYDVQQDEydTeW1hbnRl
# YyBDbGFzcyAzIFNIQTI1NiBDb2RlIFNpZ25pbmcgQ0ECEG9+qsO9F1i/BbAucWqM
# i8swDQYJYIZIAWUDBAIBBQCggdAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEICJF
# fbq0bHq1tYqYJbH4uAmon1NPXZTo4qh0v/l1Wf7oMGQGCisGAQQBgjcCAQwxVjBU
# oFKAUABTAGkAZwBuAGkAbgBnACAATgBlAHQAQQBwAHAALgBTAEEATgB0AHIAaQBj
# AGkAdAB5AC4ARgB1AG4AYwB0AGkAbwBuAHMALgBwAHMAbQAxMA0GCSqGSIb3DQEB
# AQUABIIBAJr8g76KkwCVX1sb0CIWHLXkGPWFPKlyfqrvws/Nz1wsL6Keywl+NFAO
# mae9kuZXfCf5m6SrKwHjBB70CU3rytaYSfpebYxI2m4SjmsqPAigyFhTIKk+aDXC
# E2Uvz/l3hLmCCyDAKk7hMzaK6JZMVEyevaYLYCqWT0VVtN26CFDl//7E/Xd+DSCP
# S4J5DeVX6TSKVYIKEdHI+9uSoe9NjhXGODxKS94arqwjmZKHVnKFRZ2g4NNTldvL
# Z3+WR0WnTYoYOB2D6VMTjRserw0SxIOFx/eq1zdXyUfcarOPsgEVr6iYVOrjflQ+
# hg6fzIfsRowQ29NzbzqTMp5Nk0d7L8uhggILMIICBwYJKoZIhvcNAQkGMYIB+DCC
# AfQCAQEwcjBeMQswCQYDVQQGEwJVUzEdMBsGA1UEChMUU3ltYW50ZWMgQ29ycG9y
# YXRpb24xMDAuBgNVBAMTJ1N5bWFudGVjIFRpbWUgU3RhbXBpbmcgU2VydmljZXMg
# Q0EgLSBHMgIQDs/0OMj+vzVuBNhqmBsaUDAJBgUrDgMCGgUAoF0wGAYJKoZIhvcN
# AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTcxMDAxMjI1MTEyWjAj
# BgkqhkiG9w0BCQQxFgQUxCho/hZGwnV1j/0rhpBMYaftmd8wDQYJKoZIhvcNAQEB
# BQAEggEAJISJldmaijGZBUCD14tdgx1EZQCXP2KxHCM+9HmGjSvk7BgBrH7p9UxR
# v0eN0v3uRtXek+/2mFjIL3XeqjSViA/7Y3/gLjrvVP+pif0h7jeRbX7i6OVV20uv
# OiblR8heH9HrRZQsWfYXRCuRZ593xNuBBdX27H77SEwH2yfFHK0uDsFXd0OEb5OJ
# orqyfqpQLp5wOozGkJT4QDVrV6GVbAJZZBFAiYUsmojZ5yy7UD5PdNDNsk1tm1H1
# dAa3OT70DRAHEawpFLcq4gLPGYhxAjAEF72/gwAJgoNXOxWHiROCpCGesU8OEBg6
# 2kgpw4d3oEOF861emyoHZKMP0MYjMA==
# SIG # End signature block
