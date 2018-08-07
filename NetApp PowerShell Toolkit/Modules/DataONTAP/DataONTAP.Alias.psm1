Set-Alias -Name Add-NcHostIscsiConnection -Value Add-NaHostIscsiConnection
Set-Alias -Name Connect-NcHostIscsiTarget -Value Connect-NaHostIscsiTarget
Set-Alias -Name ConvertTo-NcLun -Value ConvertTo-NaLun
Set-Alias -Name ConvertTo-NcVhd -Value ConvertTo-NaVhd
Set-Alias -Name ConvertTo-NcVhdx -Value ConvertTo-NaVhdx
Set-Alias -Name ConvertTo-NcVmdk -Value ConvertTo-NaVmdk
Set-Alias -Name Copy-NcHostFile -Value Copy-NaHostFile
Set-Alias -Name Disconnect-NcHostIscsiTarget -Value Disconnect-NaHostIscsiTarget
Set-Alias -Name Dismount-NcHostVolume -Value Dismount-NaHostVolume
Set-Alias -Name Dismount-NcVirtualDisk -Value Dismount-NaVirtualDisk
Set-Alias -Name Format-NcHostVolume -Value Format-NaHostVolume
Set-Alias -Name Get-NcHostDisk -Value Get-NaHostDisk
Set-Alias -Name Get-NcHostFcAdapter -Value Get-NaHostFcAdapter
Set-Alias -Name Get-NcHostIscsiAdapter -Value Get-NaHostIscsiAdapter
Set-Alias -Name Get-NcHostIscsiSession -Value Get-NaHostIscsiSession
Set-Alias -Name Get-NcHostIscsiTarget -Value Get-NaHostIscsiTarget
Set-Alias -Name Get-NcHostVolume -Value Get-NaHostVolume
Set-Alias -Name Get-NcHyperV -Value Get-NaHyperV
Set-Alias -Name Get-NcVirtualDiskAlignment -Value Get-NaVirtualDiskAlignment
Set-Alias -Name Get-NcVssProvider -Value Get-NaVssProvider
Set-Alias -Name Get-NcVssSnapshot -Value Get-NaVssSnapshot
Set-Alias -Name Get-NcVssWriter -Value Get-NaVssWriter
Set-Alias -Name Initialize-NcHostDisk -Value Initialize-NaHostDisk
Set-Alias -Name Invoke-NcHostVolumeSpaceReclaim -Value Invoke-NaHostVolumeSpaceReclaim
Set-Alias -Name Invoke-NcVssBackup -Value Invoke-NaVssBackup
Set-Alias -Name Mount-NcHostVolume -Value Mount-NaHostVolume
Set-Alias -Name Mount-NcVirtualDisk -Value Mount-NaVirtualDisk
Set-Alias -Name New-NcHostVolume -Value New-NaHostVolume
Set-Alias -Name New-NcVirtualDisk -Value New-NaVirtualDisk
Set-Alias -Name Remove-NcHostFile -Value Remove-NaHostFile
Set-Alias -Name Remove-NcHostIscsiConnection -Value Remove-NaHostIscsiConnection
Set-Alias -Name Remove-NcHostVolume -Value Remove-NaHostVolume
Set-Alias -Name Repair-NcVirtualDiskAlignment -Value Repair-NaVirtualDiskAlignment
Set-Alias -Name Restore-NcHostFile -Value Restore-NaHostFile
Set-Alias -Name Set-NcHostDisk -Value Set-NaHostDisk
Set-Alias -Name Set-NcHostVolumeSize -Value Set-NaHostVolumeSize
Set-Alias -Name Set-NcVirtualDiskSize -Value Set-NaVirtualDiskSize
Set-Alias -Name Start-NcHostDiskRescan -Value Start-NaHostDiskRescan
Set-Alias -Name Wait-NcHostDisk -Value Wait-NaHostDisk
Set-Alias -Name Invoke-NcVirtualDiskSpaceReclaim -Value Invoke-NaVirtualDiskSpaceReclaim

<#
.SYNOPSIS
Add the HelpInfoURI value to the DataONTAP module.

.DESCRIPTION
Add the HelpInfoURI value to the DataONTAP module.  The DataONTAP module will need to be reloaded for the change to take effect.

PowerShell 3.0 or higher required.

.EXAMPLE
Add-HelpInfoUri
#>
function Add-NaHelpInfoUri {
[CmdletBinding()]
param()

	# Check PowerShell Version
	if(-not $PSVersionTable.PSVersion -ge (New-Object System.Version @(3,0))) {
	
		Write-Warning "PowerShell 3.0 or greater is required to add HelpInfoURI."
		return;
	}

	# Add HelpInfoURI if not already present
	$module = Get-Module DataONTAP
	if([String]::IsNullOrEmpty($module.HelpInfoUri)) {

		if(-not [String]::IsNullOrEmpty($module.Path)) {
			$moduleContent = Get-Content $module.Path
			for($idx = 0; $idx -lt $moduleContent.Length; $idx++) { 
				$line = $moduleContent[$idx]
				if($line -match '^#\s*HelpInfoURI\s*=') {
					$moduleContent[$idx] = $line.Substring(1)
					break;
				}
			}
			Set-Content $module.Path $moduleContent
			
			Write-Warning "HelpInfoURI will be available the next time the DataONTAP module is loaded."
		}
	}
	else {
		
		Write-Warning "HelpInfoURI is already present."
	}
}

Export-ModuleMember -Function Add-NaHelpInfoUri

Export-ModuleMember -Alias Add-NcHostIscsiConnection
Export-ModuleMember -Alias Connect-NcHostIscsiTarget
Export-ModuleMember -Alias ConvertTo-NcLun
Export-ModuleMember -Alias ConvertTo-NcVhd
Export-ModuleMember -Alias ConvertTo-NcVhdx
Export-ModuleMember -Alias ConvertTo-NcVmdk
Export-ModuleMember -Alias Copy-NcHostFile
Export-ModuleMember -Alias Disconnect-NcHostIscsiTarget
Export-ModuleMember -Alias Dismount-NcHostVolume
Export-ModuleMember -Alias Dismount-NcVirtualDisk
Export-ModuleMember -Alias Format-NcHostVolume
Export-ModuleMember -Alias Get-NcHostDisk
Export-ModuleMember -Alias Get-NcHostFcAdapter
Export-ModuleMember -Alias Get-NcHostIscsiAdapter
Export-ModuleMember -Alias Get-NcHostIscsiSession
Export-ModuleMember -Alias Get-NcHostIscsiTarget
Export-ModuleMember -Alias Get-NcHostVolume
Export-ModuleMember -Alias Get-NcHyperV
Export-ModuleMember -Alias Get-NcVirtualDiskAlignment
Export-ModuleMember -Alias Get-NcVssProvider
Export-ModuleMember -Alias Get-NcVssSnapshot
Export-ModuleMember -Alias Get-NcVssWriter
Export-ModuleMember -Alias Initialize-NcHostDisk
Export-ModuleMember -Alias Invoke-NcHostVolumeSpaceReclaim
Export-ModuleMember -Alias Invoke-NcVssBackup
Export-ModuleMember -Alias Mount-NcHostVolume
Export-ModuleMember -Alias Mount-NcVirtualDisk
Export-ModuleMember -Alias New-NcHostVolume
Export-ModuleMember -Alias New-NcVirtualDisk
Export-ModuleMember -Alias Remove-NcHostFile
Export-ModuleMember -Alias Remove-NcHostIscsiConnection
Export-ModuleMember -Alias Remove-NcHostVolume
Export-ModuleMember -Alias Repair-NcVirtualDiskAlignment
Export-ModuleMember -Alias Restore-NcHostFile
Export-ModuleMember -Alias Set-NcHostDisk
Export-ModuleMember -Alias Set-NcHostVolumeSize
Export-ModuleMember -Alias Set-NcVirtualDiskSize
Export-ModuleMember -Alias Start-NcHostDiskRescan
Export-ModuleMember -Alias Wait-NcHostDisk
Export-ModuleMember -Alias Invoke-NcVirtualDiskSpaceReclaim
# SIG # Begin signature block
# MIIPsQYJKoZIhvcNAQcCoIIPojCCD54CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU1VkHA+e6LLfKFG+uZLtNtvot
# v+6gggo+MIIFAjCCA+qgAwIBAgIQIpimnAM9kbwAAAAAVWZCLDANBgkqhkiG9w0B
# AQsFADCBtDELMAkGA1UEBhMCVVMxFjAUBgNVBAoTDUVudHJ1c3QsIEluYy4xKDAm
# BgNVBAsTH1NlZSB3d3cuZW50cnVzdC5uZXQvbGVnYWwtdGVybXMxOTA3BgNVBAsT
# MChjKSAyMDE1IEVudHJ1c3QsIEluYy4gLSBmb3IgYXV0aG9yaXplZCB1c2Ugb25s
# eTEoMCYGA1UEAxMfRW50cnVzdCBDb2RlIFNpZ25pbmcgQ0EgLSBPVkNTMTAeFw0x
# NzA4MzEwNjEyMjVaFw0xODA5MTEwNjQyMjJaMGIxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpDYWxpZm9ybmlhMRIwEAYDVQQHEwlTdW5ueXZhbGUxFDASBgNVBAoTC05l
# dEFwcCwgSW5jMRQwEgYDVQQDEwtOZXRBcHAsIEluYzCCASIwDQYJKoZIhvcNAQEB
# BQADggEPADCCAQoCggEBAL2YuyaOt5bzoLtG1TAsNLRtGSFmKTPfkepcsij322fI
# QuWg4c+TgBO2lNoH+UBz9f3SLlcxnmUte9/Leff0IPtKX3N/C9woKP9zS3HvElZ2
# R5C2lsQA/CmiuILrgtHywFrJqMFgEvWto2foKIdfJdzzed6jYaE0Ier2+GINIoHY
# UymCB3QZxReyHtj9y5Jiazdwhk0ARLb3tleVBz7GU31IZzdmbO6q0mvg5DVfIN7h
# EZ9mT1NMk59g8UbbSSAo0Y8NQN3EhSYeV/cjXM2cSUepHLy8zCHrsr1nm8Qg8LHn
# dD3ByY8Pixa+t2N+DY0Ov94OtlMIusH/e88xvxOlwB0CAwEAAaOCAV8wggFbMA4G
# A1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzBqBggrBgEFBQcBAQRe
# MFwwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLmVudHJ1c3QubmV0MDUGCCsGAQUF
# BzAChilodHRwOi8vYWlhLmVudHJ1c3QubmV0L292Y3MxLWNoYWluMjU2LmNlcjAx
# BgNVHR8EKjAoMCagJKAihiBodHRwOi8vY3JsLmVudHJ1c3QubmV0L292Y3MxLmNy
# bDBKBgNVHSAEQzBBMDYGCmCGSAGG+mwKAQMwKDAmBggrBgEFBQcCARYaaHR0cDov
# L3d3dy5lbnRydXN0Lm5ldC9ycGEwBwYFZ4EMAQQwHwYDVR0jBBgwFoAUfhofGhF0
# XGTJDB+UAav9gWQuoSwwHQYDVR0OBBYEFJJZU7QRe6R2TtZOGcahgwJx3frsMAkG
# A1UdEwQCMAAwDQYJKoZIhvcNAQELBQADggEBAElSDudfVM0r5NB7069aqGnw27KL
# de+5EF2h9d6S94p21Ro/eu0OsUjoNlfWxQKJiC25hh/wJKFCYbLGwwaKYS9Q0Y1t
# +mDvHR9GO7gAsXca7dJf589olN9PV46RyWgSx90d3gTrTLya9AZx3418HdTWEJww
# UUXcahHXGUSnU3CfUCJYahEv4OllkvNdQcRFYRa/RG9qG5Y437c2X5NTUoB2F7Tz
# BiPIsnxcLg3hc8/1/BgvvvoTZaON8Niiunbe09lDbiCxIfOJ63Km3w4/33daNp8Z
# iHhh4L6EXCHCOm2fzBGPPsn46fgK9fydScfleTu7+a+zLow1QUp6GMKF02AwggU0
# MIIEHKADAgECAggyWOjuVK9cJzANBgkqhkiG9w0BAQsFADCBzzELMAkGA1UEBhMC
# VVMxEDAOBgNVBAgTB0FyaXpvbmExEzARBgNVBAcTClNjb3R0c2RhbGUxJTAjBgNV
# BAoTHFN0YXJmaWVsZCBUZWNobm9sb2dpZXMsIEluYy4xOjA4BgNVBAsTMWh0dHA6
# Ly9jZXJ0aWZpY2F0ZXMuc3RhcmZpZWxkdGVjaC5jb20vcmVwb3NpdG9yeS8xNjA0
# BgNVBAMTLVN0YXJmaWVsZCBTZXJ2aWNlcyBSb290IENlcnRpZmljYXRlIEF1dGhv
# cml0eTAeFw0xNjEyMTMwNzAwMDBaFw0yMTEyMTMwNzAwMDBaMIGRMQswCQYDVQQG
# EwJVUzEQMA4GA1UECBMHQXJpem9uYTETMBEGA1UEBxMKU2NvdHRzZGFsZTElMCMG
# A1UEChMcU3RhcmZpZWxkIFRlY2hub2xvZ2llcywgSW5jLjE0MDIGA1UEAxMrU3Rh
# cmZpZWxkIFNlcnZpY2VzIFRpbWVzdGFtcCBBdXRob3JpdHkgLSBHMTCCASIwDQYJ
# KoZIhvcNAQEBBQADggEPADCCAQoCggEBAMMSt+zDfQd/+EDESIH4xIOLzJkCgOFq
# yWKYMsVjvYH7vCdlU0EAGu2AlzYiIjKbaGYLbQFtOf+ohaiLl6ewX04FImdW6c97
# 5Uoie+XnMGYOVySnWHIXv/q6fFX7Rgwh50vOMCDuKHCCpx3MrYU5g0kP3J+Psv9j
# E2Nc0jkOeHQadrpVTo8HGCWoz7XCLFIfCdjjWkoDLu4B0/9yehNaC+ZwrOy9cnUE
# NhnE/+0WMIoUdOLkD/Eq24ATVBVXBe7Q3o4/7hzYWPoABigrHpB6q1u1ILpB+Ze2
# K3rdWz4t93k+yqCybnZVFKuJZy53VS4PDszfiRHfIEZo2TZGBgIVfX8CAwEAAaOC
# AU4wggFKMAwGA1UdEwEB/wQCMAAwDgYDVR0PAQH/BAQDAgbAMBYGA1UdJQEB/wQM
# MAoGCCsGAQUFBwMIMB0GA1UdDgQWBBTFhkohftnytX2hAaysXl3+FYL3vzAfBgNV
# HSMEGDAWgBS0xn8aQ8ybdV0vxEvyi5gQ6fFREDA6BggrBgEFBQcBAQQuMCwwKgYI
# KwYBBQUHMAGGHmh0dHA6Ly9vY3NwLnN0YXJmaWVsZHRlY2guY29tLzBEBgNVHR8E
# PTA7MDmgN6A1hjNodHRwOi8vY3JsLnN0YXJmaWVsZHRlY2guY29tL3JlcG9zaXRv
# cnkvc2Zzcm9vdC5jcmwwUAYDVR0gBEkwRzBFBgtghkgBhv1uAQcYAjA2MDQGCCsG
# AQUFBwIBFihodHRwOi8vY3JsLnN0YXJmaWVsZHRlY2guY29tL3JlcG9zaXRvcnkv
# MA0GCSqGSIb3DQEBCwUAA4IBAQAx1YcChxQWuDRUnv/Xm3XVrC0I3NT7Nlrd8yna
# 578XWTXIY5IMMI0YMTHlNUgejIxrMw5M22QL7IJ+IaXDhSVHCTm63uRauds4mfeP
# MGMyR+kbBRZTB2Z0BMAXK1nuNzyrHAdJcf7cyXktyZt+TF0i2W05p0x49o4ZpR7i
# NXOYwIVxF7+lI3qHmYuCI2afsuOJmHSYImWapbC0rVWfTujj7APM+6Vb40w+oyG/
# UE2+ypTjA2e/aweEuh8YUKxtAldLdBF6EFI+tvfa/0p048XAv2VWHVj6UOV5WrKE
# U1RrFwtW6TwzWMLpwU0/BxHrMQWdKYogINZ02I+O21xbakY6MYIE3TCCBNkCAQEw
# gckwgbQxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRydXN0LCBJbmMuMSgwJgYD
# VQQLEx9TZWUgd3d3LmVudHJ1c3QubmV0L2xlZ2FsLXRlcm1zMTkwNwYDVQQLEzAo
# YykgMjAxNSBFbnRydXN0LCBJbmMuIC0gZm9yIGF1dGhvcml6ZWQgdXNlIG9ubHkx
# KDAmBgNVBAMTH0VudHJ1c3QgQ29kZSBTaWduaW5nIENBIC0gT1ZDUzECECKYppwD
# PZG8AAAAAFVmQiwwCQYFKw4DAhoFAKBwMBAGCisGAQQBgjcCAQwxAjAAMBkGCSqG
# SIb3DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3
# AgEVMCMGCSqGSIb3DQEJBDEWBBRtrQL14rXI8WLEY8+4w+u5+VL3AzANBgkqhkiG
# 9w0BAQEFAASCAQBxflye0q6c48hxzwHhXLAGzm2OgiSH4Pur34p+ji9fC3DjtiYY
# 7TyndotZJZ/Czn3IiNXzDkQc2nltneRHRU3O9XUjmaHnGbwOB7oCrQkxcOip4HrP
# JuNuXrBCNvdAU6BfEffrdImgfTAykvs8cIibwcpaUmtZzrF5blytouPWyEHvFh0A
# l83UBt2zyeTglkY3jrK2Lns25ReNNntnFNOSv+D9n2QvpqT/PqssEQEHIzNCggrb
# 2rzRUbar5OYv48DFdQSwE6nJKkAbG1Ej4PtPlgH3PHtqSGgeJAcCZaO+tIrQb9St
# vDVgVfUUU/MKzSUUZdtw0R6sy2aNUZNrUtKGoYICdjCCAnIGCSqGSIb3DQEJBjGC
# AmMwggJfAgEBMIHcMIHPMQswCQYDVQQGEwJVUzEQMA4GA1UECBMHQXJpem9uYTET
# MBEGA1UEBxMKU2NvdHRzZGFsZTElMCMGA1UEChMcU3RhcmZpZWxkIFRlY2hub2xv
# Z2llcywgSW5jLjE6MDgGA1UECxMxaHR0cDovL2NlcnRpZmljYXRlcy5zdGFyZmll
# bGR0ZWNoLmNvbS9yZXBvc2l0b3J5LzE2MDQGA1UEAxMtU3RhcmZpZWxkIFNlcnZp
# Y2VzIFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5AggyWOjuVK9cJzAJBgUrDgMC
# GgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcN
# MTcxMDI2MTQ1MzA2WjAjBgkqhkiG9w0BCQQxFgQUE026+3gf2ydMKykhv6cPRpHG
# A60wDQYJKoZIhvcNAQEBBQAEggEAP+egnsEErA71eOjDjDegn1Qya69EYhVImYIH
# eQIr9dHnBUWqh+aKIXhWqPexED9x0XNcE7Gv+efVRmJAsvut2+FKUXL7kR76dgl2
# gvXX6bKbifswJsNnrsCy4IdZsXN8yVxR75jMMCbkj/1dHLW7yJrBxmKJ8M2tcjGY
# 65HHPc6fTTSVofpg7bPBNgqB3M91x03vq6wTUjx772fBat8hCi9gPgF9Ubse5fRQ
# Wj7EoDMxUPUiG0IVjFYSSiuh7uMn4sy9J79jGf/HuVRd9dDNJw6p++3Tai+0tDfv
# gKlPlDQ5aZqEH79mrGfuOqYN1A7o9oeNjU048uDZZWPN77HLPw==
# SIG # End signature block
