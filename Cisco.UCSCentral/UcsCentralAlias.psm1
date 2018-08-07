Set-Alias Compare-UcsCentralMo Compare-UcsCentralManagedObject
Set-Alias Sync-UcsCentralMo Sync-UcsCentralManagedObject
Set-Alias Get-UcsCentralMo Get-UcsCentralManagedObject
Set-Alias Remove-UcsCentralMo Remove-UcsCentralManagedObject
Set-Alias Add-UcsCentralMo Add-UcsCentralManagedObject
Set-Alias Set-UcsCentralMo Set-UcsCentralManagedObject
Set-Alias Acknowledge-UcsCentralFault Confirm-UcsCentralFault
Set-Alias Get-UcsCentralUcsDomain Get-UcsCentralExtpolClient
Set-Alias Associate-UcsCentralServiceProfile Connect-UcsCentralServiceProfile
Set-Alias Disassociate-UcsCentralServiceProfile Disconnect-UcsCentralServiceProfile
##############################################################################
#.SYNOPSIS
# Remove a Fex
#
#.DESCRIPTION
# Remove a Fex
#
##############################################################################
function FnRemoveUcsCentralFex([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralEquipmentFexOperation -AdminState remove -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralEquipmentFexOperation -AdminState remove -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralEquipmentFexOperation -AdminState remove -Force
	}
	else
	{
		$input | Set-UcsCentralEquipmentFexOperation -AdminState remove 
	}
}
Set-Alias Remove-UcsCentralFex FnRemoveUcsCentralFex
##############################################################################
#.SYNOPSIS
# Decommission a Fex
#
#.DESCRIPTION
# Decommission a Fex
#
##############################################################################
function FnDecommissionUcsCentralFex([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralEquipmentFexOperation -AdminState decommission -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralEquipmentFexOperation -AdminState decommission -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralEquipmentFexOperation -AdminState decommission -Force
	}
	else
	{
		$input | Set-UcsCentralEquipmentFexOperation -AdminState decommission 
	}
}
Set-Alias Decommission-UcsCentralFex FnDecommissionUcsCentralFex
##############################################################################
#.SYNOPSIS
# Recommission a Fex
#
#.DESCRIPTION
# Recommission a Fex
#
##############################################################################
function FnRecommissionUcsCentralFex([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralFabricSwChPhEpOperation -AdminState enabled -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralFabricSwChPhEpOperation -AdminState enabled -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralFabricSwChPhEpOperation -AdminState enabled -Force
	}
	else
	{
		$input | Set-UcsCentralFabricSwChPhEpOperation -AdminState enabled 
	}
}
Set-Alias Recommission-UcsCentralFex FnRecommissionUcsCentralFex
##############################################################################
#.SYNOPSIS
# Acknowledge a Fex
#
#.DESCRIPTION
# Acknowledge a Fex
#
##############################################################################
function FnAcknowledgeUcsCentralFex([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralEquipmentFexOperation -AdminState re-acknowledge -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralEquipmentFexOperation -AdminState re-acknowledge -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralEquipmentFexOperation -AdminState re-acknowledge -Force
	}
	else
	{
		$input | Set-UcsCentralEquipmentFexOperation -AdminState re-acknowledge 
	}
}
Set-Alias Acknowledge-UcsCentralFex FnAcknowledgeUcsCentralFex
##############################################################################
#.SYNOPSIS
# Decommission a ServerUnit
#
#.DESCRIPTION
# Decommission a ServerUnit
#
##############################################################################
function FnDecommissionUcsCentralServerUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc decommission -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc decommission -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc decommission -Force
	}
	else
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc decommission 
	}
}
Set-Alias Decommission-UcsCentralServerUnit FnDecommissionUcsCentralServerUnit
##############################################################################
#.SYNOPSIS
# Recommission a ServerUnit
#
#.DESCRIPTION
# Recommission a ServerUnit
#
##############################################################################
function FnRecommissionUcsCentralServerUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralFabricComputePhEpOperation -AdminState enabled -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralFabricComputePhEpOperation -AdminState enabled -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralFabricComputePhEpOperation -AdminState enabled -Force
	}
	else
	{
		$input | Set-UcsCentralFabricComputePhEpOperation -AdminState enabled 
	}
}
Set-Alias Recommission-UcsCentralServerUnit FnRecommissionUcsCentralServerUnit
##############################################################################
#.SYNOPSIS
# Acknowledge a ServerUnit
#
#.DESCRIPTION
# Acknowledge a ServerUnit
#
##############################################################################
function FnAcknowledgeUcsCentralServerUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc rediscover -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc rediscover -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc rediscover -Force
	}
	else
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc rediscover 
	}
}
Set-Alias Acknowledge-UcsCentralServerUnit FnAcknowledgeUcsCentralServerUnit
##############################################################################
#.SYNOPSIS
# Remove a ServerUnit
#
#.DESCRIPTION
# Remove a ServerUnit
#
##############################################################################
function FnRemoveUcsCentralCartridge([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralComputeCartridgeOperation -Lc remove -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralComputeCartridgeOperation -Lc remove -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralComputeCartridgeOperation -Lc remove -Force
	}
	else
	{
		$input | Set-UcsCentralComputeCartridgeOperation -Lc remove 
	}
}
Set-Alias Remove-UcsCentralCartridge FnRemoveUcsCentralCartridge
##############################################################################
#.SYNOPSIS
# Decommission a Chassis
#
#.DESCRIPTION
# Decommission a Chassis
#
##############################################################################
function FnDecommissionUcsCentralChassis([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralEquipmentChassisOperation -AdminState decommission -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralEquipmentChassisOperation -AdminState decommission -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralEquipmentChassisOperation -AdminState decommission -Force
	}
	else
	{
		$input | Set-UcsCentralEquipmentChassisOperation -AdminState decommission 
	}
}
Set-Alias Decommission-UcsCentralChassis FnDecommissionUcsCentralChassis
##############################################################################
#.SYNOPSIS
# Recommission a Chassis
#
#.DESCRIPTION
# Recommission a Chassis
#
##############################################################################
function FnRecommissionUcsCentralChassis([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralFabricSwChPhEpOperation -AdminState enabled -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralFabricSwChPhEpOperation -AdminState enabled -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralFabricSwChPhEpOperation -AdminState enabled -Force
	}
	else
	{
		$input | Set-UcsCentralFabricSwChPhEpOperation -AdminState enabled 
	}
}
Set-Alias Recommission-UcsCentralChassis FnRecommissionUcsCentralChassis
##############################################################################
#.SYNOPSIS
# Acknowledge a Chassis
#
#.DESCRIPTION
# Acknowledge a Chassis
#
##############################################################################
function FnAcknowledgeUcsCentralChassis([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralEquipmentChassisOperation -AdminState re-acknowledge -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralEquipmentChassisOperation -AdminState re-acknowledge -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralEquipmentChassisOperation -AdminState re-acknowledge -Force
	}
	else
	{
		$input | Set-UcsCentralEquipmentChassisOperation -AdminState re-acknowledge 
	}
}
Set-Alias Acknowledge-UcsCentralChassis FnAcknowledgeUcsCentralChassis
##############################################################################
#.SYNOPSIS
# Remove a RackUnit
#
#.DESCRIPTION
# Remove a RackUnit
#
##############################################################################
function FnRemoveUcsCentralRackUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc remove -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc remove -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc remove -Force
	}
	else
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc remove 
	}
}
Set-Alias Remove-UcsCentralRackUnit FnRemoveUcsCentralRackUnit
##############################################################################
#.SYNOPSIS
# Decommission a RackUnit
#
#.DESCRIPTION
# Decommission a RackUnit
#
##############################################################################
function FnDecommissionUcsCentralRackUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc decommission -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc decommission -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc decommission -Force
	}
	else
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc decommission 
	}
}
Set-Alias Decommission-UcsCentralRackUnit FnDecommissionUcsCentralRackUnit
##############################################################################
#.SYNOPSIS
# Recommission a RackUnit
#
#.DESCRIPTION
# Recommission a RackUnit
#
##############################################################################
function FnRecommissionUcsCentralRackUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralFabricComputePhEpOperation -AdminState enabled -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralFabricComputePhEpOperation -AdminState enabled -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralFabricComputePhEpOperation -AdminState enabled -Force
	}
	else
	{
		$input | Set-UcsCentralFabricComputePhEpOperation -AdminState enabled 
	}
}
Set-Alias Recommission-UcsCentralRackUnit FnRecommissionUcsCentralRackUnit
##############################################################################
#.SYNOPSIS
# Acknowledge a RackUnit
#
#.DESCRIPTION
# Acknowledge a RackUnit
#
##############################################################################
function FnAcknowledgeUcsCentralRackUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc rediscover -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc rediscover -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc rediscover -Force
	}
	else
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc rediscover 
	}
}
Set-Alias Acknowledge-UcsCentralRackUnit FnAcknowledgeUcsCentralRackUnit
##############################################################################
#.SYNOPSIS
# Decommission a Blade
#
#.DESCRIPTION
# Decommission a Blade
#
##############################################################################
function FnDecommissionUcsCentralBlade([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc decommission -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc decommission -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc decommission -Force
	}
	else
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc decommission 
	}
}
Set-Alias Decommission-UcsCentralBlade FnDecommissionUcsCentralBlade
##############################################################################
#.SYNOPSIS
# Recommission a Blade
#
#.DESCRIPTION
# Recommission a Blade
#
##############################################################################
function FnRecommissionUcsCentralBlade([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralFabricComputePhEpOperation -AdminState enabled -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralFabricComputePhEpOperation -AdminState enabled -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralFabricComputePhEpOperation -AdminState enabled -Force
	}
	else
	{
		$input | Set-UcsCentralFabricComputePhEpOperation -AdminState enabled 
	}
}
Set-Alias Recommission-UcsCentralBlade FnRecommissionUcsCentralBlade
##############################################################################
#.SYNOPSIS
# Acknowledge a Blade
#
#.DESCRIPTION
# Acknowledge a Blade
#
##############################################################################
function FnAcknowledgeUcsCentralBlade([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc rediscover -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc rediscover -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc rediscover -Force
	}
	else
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc rediscover 
	}
}
Set-Alias Acknowledge-UcsCentralBlade FnAcknowledgeUcsCentralBlade
##############################################################################
#.SYNOPSIS
# Remove a Blade
#
#.DESCRIPTION
# Remove a Blade
#
##############################################################################
function FnRemoveUcsCentralBlade([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc remove -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc remove -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc remove -Force
	}
	else
	{
		$input | Set-UcsCentralComputePhysicalOperation -Lc remove 
	}
}
Set-Alias Remove-UcsCentralBlade FnRemoveUcsCentralBlade
##############################################################################
#.SYNOPSIS
# Acknowledge a Slot
#
#.DESCRIPTION
# Acknowledge a Slot
#
##############################################################################
function FnAcknowledgeUcsCentralSlot([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCentralFabricComputeSlotEpOperation -AdminState reacknowledge -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCentralFabricComputeSlotEpOperation -AdminState reacknowledge -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCentralFabricComputeSlotEpOperation -AdminState reacknowledge -Force
	}
	else
	{
		$input | Set-UcsCentralFabricComputeSlotEpOperation -AdminState reacknowledge 
	}
}
Set-Alias Acknowledge-UcsCentralSlot FnAcknowledgeUcsCentralSlot
Export-ModuleMember -Function * -Alias *

# SIG # Begin signature block
# MIIYyQYJKoZIhvcNAQcCoIIYujCCGLYCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCA563WDp5Gy8Uk/
# cUvu2O1nFLkcpTKGh2bPoMi+6YW0kaCCExAwggQVMIIC/aADAgECAgsEAAAAAAEx
# icZQBDANBgkqhkiG9w0BAQsFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3Qg
# Q0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2ln
# bjAeFw0xMTA4MDIxMDAwMDBaFw0yOTAzMjkxMDAwMDBaMFsxCzAJBgNVBAYTAkJF
# MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWdu
# IFRpbWVzdGFtcGluZyBDQSAtIFNIQTI1NiAtIEcyMIIBIjANBgkqhkiG9w0BAQEF
# AAOCAQ8AMIIBCgKCAQEAqpuOw6sRUSUBtpaU4k/YwQj2RiPZRcWVl1urGr/SbFfJ
# MwYfoA/GPH5TSHq/nYeer+7DjEfhQuzj46FKbAwXxKbBuc1b8R5EiY7+C94hWBPu
# TcjFZwscsrPxNHaRossHbTfFoEcmAhWkkJGpeZ7X61edK3wi2BTX8QceeCI2a3d5
# r6/5f45O4bUIMf3q7UtxYowj8QM5j0R5tnYDV56tLwhG3NKMvPSOdM7IaGlRdhGL
# D10kWxlUPSbMQI2CJxtZIH1Z9pOAjvgqOP1roEBlH1d2zFuOBE8sqNuEUBNPxtyL
# ufjdaUyI65x7MCb8eli7WbwUcpKBV7d2ydiACoBuCQIDAQABo4HoMIHlMA4GA1Ud
# DwEB/wQEAwIBBjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdDgQWBBSSIadKlV1k
# sJu0HuYAN0fmnUErTDBHBgNVHSAEQDA+MDwGBFUdIAAwNDAyBggrBgEFBQcCARYm
# aHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wNgYDVR0fBC8w
# LTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLm5ldC9yb290LXIzLmNybDAf
# BgNVHSMEGDAWgBSP8Et/qC5FJK5NUPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOC
# AQEABFaCSnzQzsm/NmbRvjWek2yX6AbOMRhZ+WxBX4AuwEIluBjH/NSxN8RooM8o
# agN0S2OXhXdhO9cv4/W9M6KSfREfnops7yyw9GKNNnPRFjbxvF7stICYePzSdnno
# 4SGU4B/EouGqZ9uznHPlQCLPOc7b5neVp7uyy/YZhp2fyNSYBbJxb051rvE9ZGo7
# Xk5GpipdCJLxo/MddL9iDSOMXCo4ldLA1c3PiNofKLW6gWlkKrWmotVzr9xG2wSu
# kdduxZi61EfEVnSAR3hYjL7vK/3sbL/RlPe/UOB74JD9IBh4GCJdCC6MHKCX8x2Z
# faOdkdMGRE4EbnocIOM28LZQuTCCBLkwggOhoAMCAQICEhEh7ZAYyqknt2JsUmuQ
# bZP1ZzANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xv
# YmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBUaW1lc3RhbXBpbmcg
# Q0EgLSBTSEEyNTYgLSBHMjAeFw0xNjA1MjQwMDAwMDBaFw0yNzA2MjQwMDAwMDBa
# MGkxCzAJBgNVBAYTAlNHMR8wHQYDVQQKExZHTU8gR2xvYmFsU2lnbiBQdGUgTHRk
# MTkwNwYDVQQDEzBHbG9iYWxTaWduIFRTQSBmb3IgTVMgQXV0aGVudGljb2RlIGFk
# dmFuY2VkIC0gRzIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDZeGGh
# lq4S/6P/J/ZEYHtqVi1n41+fMZIqSO35BYQObU4iVsrYmZeOacqfew8IyCoraNEo
# YSuf5Cbuurj3sOxeahviWLW0vR0J7c3oPdRm/74iIm02Js8ReJfpVQAow+k3Tr0Z
# 5ReESLIcIa3sc9LzqKfpX+g1zoUTpyKbrILp/vFfxBJasfcMQObSoOBNaNDtDAwQ
# HY8FX2RV+bsoRwYM2AY/N8MmNiWMew8niFw4MaUB9l5k3oPAFFzg59JezI3qI4AZ
# KrNiLmDHqmfWs0DuUn9WDO/ZBdeVIF2FFUDPXpGVUZ5GGheRvsHAB3WyS/c2usVU
# bF+KG/sNKGHIifAVAgMBAAGjggFnMIIBYzAOBgNVHQ8BAf8EBAMCB4AwTAYDVR0g
# BEUwQzBBBgkrBgEEAaAyAR4wNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
# YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADAWBgNVHSUBAf8EDDAK
# BggrBgEFBQcDCDBGBgNVHR8EPzA9MDugOaA3hjVodHRwOi8vY3JsLmdsb2JhbHNp
# Z24uY29tL2dzL2dzdGltZXN0YW1waW5nc2hhMmcyLmNybDBYBggrBgEFBQcBAQRM
# MEowSAYIKwYBBQUHMAKGPGh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2Fj
# ZXJ0L2dzdGltZXN0YW1waW5nc2hhMmcyLmNydDAdBgNVHQ4EFgQU1Ie4jeblQDyd
# WgZjxkWE2d27HMMwHwYDVR0jBBgwFoAUkiGnSpVdZLCbtB7mADdH5p1BK0wwDQYJ
# KoZIhvcNAQELBQADggEBABoNyP1vM0bImb43n4V/cnSxcc06JzuIVi37tGenLYff
# KO1667xpZdausb09yZuHFFrHHYfznXWCVD+Vd3XztEpqa5bvGaLH9y7tkBvUEY3K
# So2uf3J3uV/eUfQhPuWkZzteLiDC8ZeeeurddHqy+0MEr/rotNESYXqW6WWOT20i
# pdcM56kNGJ+29yN/LRgAntrES7Pn4QJwQPw9RSrLhph3XeDyLHewBRqkAkZruhsR
# C+rn5sHU7jMjMgCappWM+ioqyY2tZC+Lvtf/OvNDj84v1ky7ta8SgXko9x+7hRCK
# P8nTyPi0c2TE5yBMWRvKiTTR7MKKCtZ51dovtPZ1554wggTZMIIDwaADAgECAhAg
# dYM+s4RF6K1Qb3IlJSFAMA0GCSqGSIb3DQEBCwUAMH8xCzAJBgNVBAYTAlVTMR0w
# GwYDVQQKExRTeW1hbnRlYyBDb3Jwb3JhdGlvbjEfMB0GA1UECxMWU3ltYW50ZWMg
# VHJ1c3QgTmV0d29yazEwMC4GA1UEAxMnU3ltYW50ZWMgQ2xhc3MgMyBTSEEyNTYg
# Q29kZSBTaWduaW5nIENBMB4XDTE2MTEwOTAwMDAwMFoXDTE5MTEyNjIzNTk1OVow
# cTELMAkGA1UEBhMCVVMxEzARBgNVBAgMCkNhbGlmb3JuaWExETAPBgNVBAcMCFNh
# biBKb3NlMRwwGgYDVQQKDBNDaXNjbyBTeXN0ZW1zLCBJbmMuMRwwGgYDVQQDDBND
# aXNjbyBTeXN0ZW1zLCBJbmMuMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
# AQEAsuVUjhvmUZmLRkdteMgyU8Mu8XoLvGMcle2lHnNO9rGdA2+Oz7nviMATnvJG
# MXHCYqpaqjIcqhI07dieXGNST9u4OTjeb9AjWq2uz7XiLgqKneWYzYg4l4Wx0vGm
# w9ZIN1qS8WrLP4fVbXbrpfjYTku1ST0ouq38I/X21sDiRvISxJGMl9D5m+6BTKTY
# 1hNnwZqKsk+veV33GWzsY4jgm0Ix+q/Z6WFRHnS8z1h5zrqKXgY2BLgB/fdLPY7Z
# cDc5zPTaSbtd1LmxMisdlKOkClASa66AkGbbBhDSXA6V01sxbrVUD+8yw5HxjSkB
# dvaGiv163Z50O9jbUZhAKjeTBQIDAQABo4IBXTCCAVkwCQYDVR0TBAIwADAOBgNV
# HQ8BAf8EBAMCB4AwKwYDVR0fBCQwIjAgoB6gHIYaaHR0cDovL3N2LnN5bWNiLmNv
# bS9zdi5jcmwwYQYDVR0gBFowWDBWBgZngQwBBAEwTDAjBggrBgEFBQcCARYXaHR0
# cHM6Ly9kLnN5bWNiLmNvbS9jcHMwJQYIKwYBBQUHAgIwGQwXaHR0cHM6Ly9kLnN5
# bWNiLmNvbS9ycGEwEwYDVR0lBAwwCgYIKwYBBQUHAwMwVwYIKwYBBQUHAQEESzBJ
# MB8GCCsGAQUFBzABhhNodHRwOi8vc3Yuc3ltY2QuY29tMCYGCCsGAQUFBzAChhpo
# dHRwOi8vc3Yuc3ltY2IuY29tL3N2LmNydDAfBgNVHSMEGDAWgBSWO1PweTOXr32D
# 7y4rzMq3hh5yZjAdBgNVHQ4EFgQUwmh+ziCvAomdQWbz+MKGFJTJWoAwDQYJKoZI
# hvcNAQELBQADggEBACgChN6Dp2LOyxEkn3a3TpgUR0j47OO/XZHDxjVD9Int6bCI
# WoXKlD1j+U9L0uSBfHMgVYFeYLEWw8+kZCHRIb7nqib7ahmSPboTami7bfzaYFJF
# b8ZttE+gYYM9Dgfa5/keTiu7gCr9EZqQliTcHXS7S8xkBgqijmoc8MgN1M9Npg6U
# /PKH7tMdIlYI6qUK9JCx3hsADBqsk791vtC8gNUS3e0CyWX/M4BZNBUW7ys2Ohpd
# YcWjwnYm4Wu9wCDOgDP02yXx/9f9midjg7UVV4D5Ngh1+kg8mWRHW2wmLW0knvi6
# wpPlXhnR1fwlWAniCdO2MKfxgL3FaKFQ8NqlyNAwggVZMIIEQaADAgECAhA9eNf5
# dklgsmF99PAeyoYqMA0GCSqGSIb3DQEBCwUAMIHKMQswCQYDVQQGEwJVUzEXMBUG
# A1UEChMOVmVyaVNpZ24sIEluYy4xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5l
# dHdvcmsxOjA4BgNVBAsTMShjKSAyMDA2IFZlcmlTaWduLCBJbmMuIC0gRm9yIGF1
# dGhvcml6ZWQgdXNlIG9ubHkxRTBDBgNVBAMTPFZlcmlTaWduIENsYXNzIDMgUHVi
# bGljIFByaW1hcnkgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgLSBHNTAeFw0xMzEy
# MTAwMDAwMDBaFw0yMzEyMDkyMzU5NTlaMH8xCzAJBgNVBAYTAlVTMR0wGwYDVQQK
# ExRTeW1hbnRlYyBDb3Jwb3JhdGlvbjEfMB0GA1UECxMWU3ltYW50ZWMgVHJ1c3Qg
# TmV0d29yazEwMC4GA1UEAxMnU3ltYW50ZWMgQ2xhc3MgMyBTSEEyNTYgQ29kZSBT
# aWduaW5nIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAl4MeABav
# LLHSCMTXaJNRYB5x9uJHtNtYTSNiarS/WhtR96MNGHdou9g2qy8hUNqe8+dfJ04L
# wpfICXCTqdpcDU6kDZGgtOwUzpFyVC7Oo9tE6VIbP0E8ykrkqsDoOatTzCHQzM9/
# m+bCzFhqghXuPTbPHMWXBySO8Xu+MS09bty1mUKfS2GVXxxw7hd924vlYYl4x2gb
# rxF4GpiuxFVHU9mzMtahDkZAxZeSitFTp5lbhTVX0+qTYmEgCscwdyQRTWKDtrp7
# aIIx7mXK3/nVjbI13Iwrb2pyXGCEnPIMlF7AVlIASMzT+KV93i/XE+Q4qITVRrgT
# hsIbnepaON2b2wIDAQABo4IBgzCCAX8wLwYIKwYBBQUHAQEEIzAhMB8GCCsGAQUF
# BzABhhNodHRwOi8vczIuc3ltY2IuY29tMBIGA1UdEwEB/wQIMAYBAf8CAQAwbAYD
# VR0gBGUwYzBhBgtghkgBhvhFAQcXAzBSMCYGCCsGAQUFBwIBFhpodHRwOi8vd3d3
# LnN5bWF1dGguY29tL2NwczAoBggrBgEFBQcCAjAcGhpodHRwOi8vd3d3LnN5bWF1
# dGguY29tL3JwYTAwBgNVHR8EKTAnMCWgI6Ahhh9odHRwOi8vczEuc3ltY2IuY29t
# L3BjYTMtZzUuY3JsMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDAzAOBgNV
# HQ8BAf8EBAMCAQYwKQYDVR0RBCIwIKQeMBwxGjAYBgNVBAMTEVN5bWFudGVjUEtJ
# LTEtNTY3MB0GA1UdDgQWBBSWO1PweTOXr32D7y4rzMq3hh5yZjAfBgNVHSMEGDAW
# gBR/02Wnwt3su/AwCfNDOfoCrzMxMzANBgkqhkiG9w0BAQsFAAOCAQEAE4UaHmmp
# N/egvaSvfh1hU/6djF4MpnUeeBcj3f3sGgNVOftxlcdlWqeOMNJEWmHbcG/aIQXC
# LnO6SfHRk/5dyc1eA+CJnj90Htf3OIup1s+7NS8zWKiSVtHITTuC5nmEFvwosLFH
# 8x2iPu6H2aZ/pFalP62ELinefLyoqqM9BAHqupOiDlAiKRdMh+Q6EV/WpCWJmwVr
# L7TJAUwnewusGQUioGAVP9rJ+01Mj/tyZ3f9J5THujUOiEn+jf0or0oSvQ2zlwXe
# RAwV+jYrA9zBUAHxoRFdFOXivSdLVL4rhF4PpsN0BQrvl8OJIrEfd/O9zUPU8Uyp
# P7WLhK9k8tAUITGCBQ8wggULAgEBMIGTMH8xCzAJBgNVBAYTAlVTMR0wGwYDVQQK
# ExRTeW1hbnRlYyBDb3Jwb3JhdGlvbjEfMB0GA1UECxMWU3ltYW50ZWMgVHJ1c3Qg
# TmV0d29yazEwMC4GA1UEAxMnU3ltYW50ZWMgQ2xhc3MgMyBTSEEyNTYgQ29kZSBT
# aWduaW5nIENBAhAgdYM+s4RF6K1Qb3IlJSFAMA0GCWCGSAFlAwQCAQUAoIGEMBgG
# CisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcC
# AQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIE
# IBPyuMjJ9JQdQo8n5fITyhMX0ST6pRjcdI5Uf/d4FXlnMA0GCSqGSIb3DQEBAQUA
# BIIBAJIA2syjclpYHpy6dLmKfphGEDyRBE8XV0KmY4INUO82ogObNSXAGCJhzKTQ
# iPkILlBMB/rTeGexK0LnfJzY1L8ft/MQEM0UDH5IMl5aGxqc1A4bt6P1LMPUVsI4
# Ij9WJb6NgiFfg+lVXxOUYHVZM5/GJ8Jl/YfrQg6GgsfU9Emr7dfRI0Llh8O6+Pr3
# LHH6XuBRn2Ga73ZJxWWzmGrCTm8QEL09eMIPRbC+qsnikNd8qeC+xM/Z3sRYhLPH
# I1d2GAnhAoUZxAaMy3zboxNI89M5kX0y6VXV10+x7AoT3qfSKIgPg1ptgnKyFG5d
# QMWh15x28zYeYGm+U39LuquwHjGhggLFMIICwQYJKoZIhvcNAQkGMYICsjCCAq4C
# AQEwcTBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEx
# MC8GA1UEAxMoR2xvYmFsU2lnbiBUaW1lc3RhbXBpbmcgQ0EgLSBTSEEyNTYgLSBH
# MgISESHtkBjKqSe3YmxSa5Btk/VnMA0GCWCGSAFlAwQCAQUAoIIBEjAYBgkqhkiG
# 9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xNzAyMjAyMDM5Mjla
# MC8GCSqGSIb3DQEJBDEiBCAhPIxAYR1njCDKRJKx3ZIwNm3y+Tznlv5/J3pUiTdL
# JzCBpgYLKoZIhvcNAQkQAgwxgZYwgZMwgZAwgY0EFDfAQYyoSAu6zgLgAOyIRq09
# tpHsMHUwX6RdMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
# LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIFRpbWVzdGFtcGluZyBDQSAtIFNIQTI1
# NiAtIEcyAhIRIe2QGMqpJ7dibFJrkG2T9WcwDQYJKoZIhvcNAQEBBQAEggEAvUhn
# QkDLfqAsYFJU7AFRHRVH73brAf3nmTrwxVGzHbudkCRKdWqGZtQS8m5+Q3+kQmW1
# SUojTIMKIF8iWGxIXTwNnD+zOi1aV/6nr2twJZVTakjmXvk4weUxB/PH87z5YwWI
# pNR1Xgih/HY9qqY7VnFSkE2AZl3K8IuwmtQR3Sc0v1Kvc2gO9OHzePlTm7QKlQlO
# 7A07aW11YBBSS8WZVn8Y8pdk/sj3QWMnVY5tK/znkdx/vudZKIFjQ7vqaYQndXHY
# +UDDD1Ev9Ds5yRP674UNe07zKgu7tuxCY/lpxVkSExCwvaVeHNJzaxDGpDkQw4/F
# TNyhndtSrtQmMHwsUA==
# SIG # End signature block
