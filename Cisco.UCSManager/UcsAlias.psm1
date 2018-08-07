Set-Alias Compare-UcsMo Compare-UcsManagedObject
Set-Alias Get-UcsMo Get-UcsManagedObject
Set-Alias Remove-UcsMo Remove-UcsManagedObject
Set-Alias Add-UcsMo Add-UcsManagedObject
Set-Alias Set-UcsMo Set-UcsManagedObject
Set-Alias Sync-UcsMo Sync-UcsManagedObject
Set-Alias Unregister-UcsCentral Remove-UcsPolicyControlEp
Set-Alias Get-UcsCentral Get-UcsPolicyControlEp
Set-Alias Associate-UcsServiceProfile Connect-UcsServiceProfile
Set-Alias Disassociate-UcsServiceProfile Disconnect-UcsServiceProfile
Set-Alias Acknowledge-UcsFault Confirm-UcsFault
##############################################################################
#.SYNOPSIS
# Remove a Blade
#
#.DESCRIPTION
# Remove a Blade
#
##############################################################################
function FnRemoveUcsBlade([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsBlade -Lc remove -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsBlade -Lc remove -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsBlade -Lc remove -Force
	}
	else
	{
		$input | Set-UcsBlade -Lc remove 
	}
}
Set-Alias Remove-UcsBlade FnRemoveUcsBlade
##############################################################################
#.SYNOPSIS
# Decommission a Blade
#
#.DESCRIPTION
# Decommission a Blade
#
##############################################################################
function FnDecommissionUcsBlade([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsBlade -Lc decommission -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsBlade -Lc decommission -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsBlade -Lc decommission -Force
	}
	else
	{
		$input | Set-UcsBlade -Lc decommission 
	}
}
Set-Alias Decommission-UcsBlade FnDecommissionUcsBlade
##############################################################################
#.SYNOPSIS
# Recommission a Blade
#
#.DESCRIPTION
# Recommission a Blade
#
##############################################################################
function FnRecommissionUcsBlade([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsFabricComputePhEp -AdminState enabled -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsFabricComputePhEp -AdminState enabled -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsFabricComputePhEp -AdminState enabled -Force
	}
	else
	{
		$input | Set-UcsFabricComputePhEp -AdminState enabled 
	}
}
Set-Alias Recommission-UcsBlade FnRecommissionUcsBlade
##############################################################################
#.SYNOPSIS
# Acknowledge a Blade
#
#.DESCRIPTION
# Acknowledge a Blade
#
##############################################################################
function FnAcknowledgeUcsBlade([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsBlade -Lc rediscover -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsBlade -Lc rediscover -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsBlade -Lc rediscover -Force
	}
	else
	{
		$input | Set-UcsBlade -Lc rediscover 
	}
}
Set-Alias Acknowledge-UcsBlade FnAcknowledgeUcsBlade
##############################################################################
#.SYNOPSIS
# Remove a Chassis
#
#.DESCRIPTION
# Remove a Chassis
#
##############################################################################
function FnRemoveUcsChassis([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsChassis -AdminState remove -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsChassis -AdminState remove -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsChassis -AdminState remove -Force
	}
	else
	{
		$input | Set-UcsChassis -AdminState remove 
	}
}
Set-Alias Remove-UcsChassis FnRemoveUcsChassis
##############################################################################
#.SYNOPSIS
# Decommission a Chassis
#
#.DESCRIPTION
# Decommission a Chassis
#
##############################################################################
function FnDecommissionUcsChassis([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsChassis -AdminState decommission -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsChassis -AdminState decommission -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsChassis -AdminState decommission -Force
	}
	else
	{
		$input | Set-UcsChassis -AdminState decommission 
	}
}
Set-Alias Decommission-UcsChassis FnDecommissionUcsChassis
##############################################################################
#.SYNOPSIS
# Recommission a Chassis
#
#.DESCRIPTION
# Recommission a Chassis
#
##############################################################################
function FnRecommissionUcsChassis([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsFabricSwChPhEp -AdminState enabled -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsFabricSwChPhEp -AdminState enabled -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsFabricSwChPhEp -AdminState enabled -Force
	}
	else
	{
		$input | Set-UcsFabricSwChPhEp -AdminState enabled 
	}
}
Set-Alias Recommission-UcsChassis FnRecommissionUcsChassis
##############################################################################
#.SYNOPSIS
# Acknowledge a Chassis
#
#.DESCRIPTION
# Acknowledge a Chassis
#
##############################################################################
function FnAcknowledgeUcsChassis([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsChassis -AdminState re-acknowledge -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsChassis -AdminState re-acknowledge -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsChassis -AdminState re-acknowledge -Force
	}
	else
	{
		$input | Set-UcsChassis -AdminState re-acknowledge 
	}
}
Set-Alias Acknowledge-UcsChassis FnAcknowledgeUcsChassis
##############################################################################
#.SYNOPSIS
# Remove a Fex
#
#.DESCRIPTION
# Remove a Fex
#
##############################################################################
function FnRemoveUcsFex([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsFex -AdminState remove -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsFex -AdminState remove -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsFex -AdminState remove -Force
	}
	else
	{
		$input | Set-UcsFex -AdminState remove 
	}
}
Set-Alias Remove-UcsFex FnRemoveUcsFex
##############################################################################
#.SYNOPSIS
# Decommission a Fex
#
#.DESCRIPTION
# Decommission a Fex
#
##############################################################################
function FnDecommissionUcsFex([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsFex -AdminState decommission -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsFex -AdminState decommission -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsFex -AdminState decommission -Force
	}
	else
	{
		$input | Set-UcsFex -AdminState decommission 
	}
}
Set-Alias Decommission-UcsFex FnDecommissionUcsFex
##############################################################################
#.SYNOPSIS
# Recommission a Fex
#
#.DESCRIPTION
# Recommission a Fex
#
##############################################################################
function FnRecommissionUcsFex([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsFabricSwChPhEp -AdminState enabled -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsFabricSwChPhEp -AdminState enabled -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsFabricSwChPhEp -AdminState enabled -Force
	}
	else
	{
		$input | Set-UcsFabricSwChPhEp -AdminState enabled 
	}
}
Set-Alias Recommission-UcsFex FnRecommissionUcsFex
##############################################################################
#.SYNOPSIS
# Acknowledge a Fex
#
#.DESCRIPTION
# Acknowledge a Fex
#
##############################################################################
function FnAcknowledgeUcsFex([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsFex -AdminState re-acknowledge -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsFex -AdminState re-acknowledge -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsFex -AdminState re-acknowledge -Force
	}
	else
	{
		$input | Set-UcsFex -AdminState re-acknowledge 
	}
}
Set-Alias Acknowledge-UcsFex FnAcknowledgeUcsFex
##############################################################################
#.SYNOPSIS
# Acknowledge a Slot
#
#.DESCRIPTION
# Acknowledge a Slot
#
##############################################################################
function FnAcknowledgeUcsSlot([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsFabricComputeSlotEp -AdminState reacknowledge -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsFabricComputeSlotEp -AdminState reacknowledge -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsFabricComputeSlotEp -AdminState reacknowledge -Force
	}
	else
	{
		$input | Set-UcsFabricComputeSlotEp -AdminState reacknowledge 
	}
}
Set-Alias Acknowledge-UcsSlot FnAcknowledgeUcsSlot
##############################################################################
#.SYNOPSIS
# Remove a RackUnit
#
#.DESCRIPTION
# Remove a RackUnit
#
##############################################################################
function FnRemoveUcsRackUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsRackUnit -Lc remove -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsRackUnit -Lc remove -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsRackUnit -Lc remove -Force
	}
	else
	{
		$input | Set-UcsRackUnit -Lc remove 
	}
}
Set-Alias Remove-UcsRackUnit FnRemoveUcsRackUnit
##############################################################################
#.SYNOPSIS
# Decommission a RackUnit
#
#.DESCRIPTION
# Decommission a RackUnit
#
##############################################################################
function FnDecommissionUcsRackUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsRackUnit -Lc decommission -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsRackUnit -Lc decommission -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsRackUnit -Lc decommission -Force
	}
	else
	{
		$input | Set-UcsRackUnit -Lc decommission 
	}
}
Set-Alias Decommission-UcsRackUnit FnDecommissionUcsRackUnit
##############################################################################
#.SYNOPSIS
# Recommission a RackUnit
#
#.DESCRIPTION
# Recommission a RackUnit
#
##############################################################################
function FnRecommissionUcsRackUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsFabricComputePhEp -AdminState enabled -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsFabricComputePhEp -AdminState enabled -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsFabricComputePhEp -AdminState enabled -Force
	}
	else
	{
		$input | Set-UcsFabricComputePhEp -AdminState enabled 
	}
}
Set-Alias Recommission-UcsRackUnit FnRecommissionUcsRackUnit
##############################################################################
#.SYNOPSIS
# Acknowledge a RackUnit
#
#.DESCRIPTION
# Acknowledge a RackUnit
#
##############################################################################
function FnAcknowledgeUcsRackUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsRackUnit -Lc rediscover -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsRackUnit -Lc rediscover -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsRackUnit -Lc rediscover -Force
	}
	else
	{
		$input | Set-UcsRackUnit -Lc rediscover 
	}
}
Set-Alias Acknowledge-UcsRackUnit FnAcknowledgeUcsRackUnit
##############################################################################
#.SYNOPSIS
# Remove a ServerUnit
#
#.DESCRIPTION
# Remove a ServerUnit
#
##############################################################################
function FnRemoveUcsCartridge([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsCartridge -Lc remove -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsCartridge -Lc remove -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsCartridge -Lc remove -Force
	}
	else
	{
		$input | Set-UcsCartridge -Lc remove 
	}
}
Set-Alias Remove-UcsCartridge FnRemoveUcsCartridge
##############################################################################
#.SYNOPSIS
# Decommission a ServerUnit
#
#.DESCRIPTION
# Decommission a ServerUnit
#
##############################################################################
function FnDecommissionUcsServerUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsServerUnit -Lc decommission -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsServerUnit -Lc decommission -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsServerUnit -Lc decommission -Force
	}
	else
	{
		$input | Set-UcsServerUnit -Lc decommission 
	}
}
Set-Alias Decommission-UcsServerUnit FnDecommissionUcsServerUnit
##############################################################################
#.SYNOPSIS
# Recommission a ServerUnit
#
#.DESCRIPTION
# Recommission a ServerUnit
#
##############################################################################
function FnRecommissionUcsServerUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsFabricComputeMSlotEp  -SlotAdminState reacknowledge -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsFabricComputeMSlotEp  -SlotAdminState reacknowledge -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsFabricComputeMSlotEp  -SlotAdminState reacknowledge -Force
	}
	else
	{
		$input | Set-UcsFabricComputeMSlotEp  -SlotAdminState reacknowledge 
	}
}
Set-Alias Recommission-UcsServerUnit FnRecommissionUcsServerUnit
##############################################################################
#.SYNOPSIS
# Acknowledge a ServerUnit
#
#.DESCRIPTION
# Acknowledge a ServerUnit
#
##############################################################################
function FnAcknowledgeUcsServerUnit([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsServerUnit -Lc rediscover -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsServerUnit -Lc rediscover -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsServerUnit -Lc rediscover -Force
	}
	else
	{
		$input | Set-UcsServerUnit -Lc rediscover 
	}
}
Set-Alias Acknowledge-UcsServerUnit FnAcknowledgeUcsServerUnit
##############################################################################
#.SYNOPSIS
# Reset IO Module
#
#.DESCRIPTION
# Reset IO Module
#
##############################################################################
function FnResetUcsIoModule([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsIom -AdminPowerState cycle-immediate -AdminState acknowledged -AdminPeerPowerState policy -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsIom -AdminPowerState cycle-immediate -AdminState acknowledged -AdminPeerPowerState policy -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsIom -AdminPowerState cycle-immediate -AdminState acknowledged -AdminPeerPowerState policy -Force
	}
	else
	{
		$input | Set-UcsIom -AdminPowerState cycle-immediate -AdminState acknowledged -AdminPeerPowerState policy 
	}
}
Set-Alias Reset-UcsIoModule FnResetUcsIoModule
##############################################################################
#.SYNOPSIS
# Reset Peer IO Module
#
#.DESCRIPTION
# Reset Peer IO Module
#
##############################################################################
function FnResetUcsPeerIoModule([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsIom -AdminPowerState policy -AdminState acknowledged -AdminPeerPowerState cycle-immediate -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsIom -AdminPowerState policy -AdminState acknowledged -AdminPeerPowerState cycle-immediate -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsIom -AdminPowerState policy -AdminState acknowledged -AdminPeerPowerState cycle-immediate -Force
	}
	else
	{
		$input | Set-UcsIom -AdminPowerState policy -AdminState acknowledged -AdminPeerPowerState cycle-immediate 
	}
}
Set-Alias Reset-UcsPeerIoModule FnResetUcsPeerIoModule
##############################################################################
#.SYNOPSIS
# Turn On Disk Locator LED
#
#.DESCRIPTION
# Turn On Disk Locator LED
#
##############################################################################
function FnEnableUcsDiskLocatorLed([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsStorageLocalDisk -AdminActionTrigger triggered -AdminAction led-on -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsStorageLocalDisk -AdminActionTrigger triggered -AdminAction led-on -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsStorageLocalDisk -AdminActionTrigger triggered -AdminAction led-on -Force
	}
	else
	{
		$input | Set-UcsStorageLocalDisk -AdminActionTrigger triggered -AdminAction led-on 
	}
}
Set-Alias Enable-UcsDiskLocatorLed FnEnableUcsDiskLocatorLed
##############################################################################
#.SYNOPSIS
# Turn Off Disk Locator LED
#
#.DESCRIPTION
# Turn Off Disk Locator LED
#
##############################################################################
function FnDisableUcsDiskLocatorLed([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-UcsStorageLocalDisk -AdminActionTrigger triggered -AdminAction led-off -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-UcsStorageLocalDisk -AdminActionTrigger triggered -AdminAction led-off -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-UcsStorageLocalDisk -AdminActionTrigger triggered -AdminAction led-off -Force
	}
	else
	{
		$input | Set-UcsStorageLocalDisk -AdminActionTrigger triggered -AdminAction led-off 
	}
}
Set-Alias Disable-UcsDiskLocatorLed FnDisableUcsDiskLocatorLed
Export-ModuleMember -Function * -Alias *

# SIG # Begin signature block
# MIIYyQYJKoZIhvcNAQcCoIIYujCCGLYCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDtdoqOPMCJ8ZRu
# CdKNH0RB2JXNlR4hMjgTc2n7rC4t1KCCExAwggQVMIIC/aADAgECAgsEAAAAAAEx
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
# IIfR46S4+pCtOQrgMGkZIMl+nTrgS1YSuCdWt/df6bsyMA0GCSqGSIb3DQEBAQUA
# BIIBAJWZNxI4dF0NsrnBrvICnrAJ2wZfWkM0cMveO2HQbVWMmS+XubthelFEWltn
# 7LJSV1WXHJHvg31ZnDODwt6oxy5T+/+iH/kk5DuzV3ZW6Xg8mewL3/EarX+c3xoK
# 1R4nxiyypZYOdbQwGQujjtwkdBnYLV+2U3HfvGP495tdsDfTkdzvTVYuhQZyEMYi
# zxKx3SpGgl4uuuei7FACobz4LNPj0IrBIeEO8zrTS+oWAmcZu8I6zndxJv1NrHe3
# K8PhtHA1EojwolPPDGFX9AHXgs+Dw6GmPjwAHVbMpiT+WlTFw0zzg+ndgiy/92X2
# Ti3PxN8SCRjbDMrOyDM7uPZUa3mhggLFMIICwQYJKoZIhvcNAQkGMYICsjCCAq4C
# AQEwcTBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEx
# MC8GA1UEAxMoR2xvYmFsU2lnbiBUaW1lc3RhbXBpbmcgQ0EgLSBTSEEyNTYgLSBH
# MgISESHtkBjKqSe3YmxSa5Btk/VnMA0GCWCGSAFlAwQCAQUAoIIBEjAYBgkqhkiG
# 9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xNzAyMjAyMDQxMDla
# MC8GCSqGSIb3DQEJBDEiBCDrIQUqn5oESex4b1MEqGW+cPWgjcmN2KIO7Y0J3vW0
# 8zCBpgYLKoZIhvcNAQkQAgwxgZYwgZMwgZAwgY0EFDfAQYyoSAu6zgLgAOyIRq09
# tpHsMHUwX6RdMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
# LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIFRpbWVzdGFtcGluZyBDQSAtIFNIQTI1
# NiAtIEcyAhIRIe2QGMqpJ7dibFJrkG2T9WcwDQYJKoZIhvcNAQEBBQAEggEAjapk
# CIiGWW/3cnbGytQcKovWDEVl3JSpBffAJlj/N9/+1MIpeCRHXQwJ7f/vbHuKC/k0
# 0DYHOwKfca8xRBZyvgN9hs+rTX6e8uarge7cWZLyC86Y9t1pbJHH3Ibwa/4Wh9My
# f9Wru2tGYU0uvIgwy5rFluQaRg5tQTaeboTNg3WvA0TJP72SE2xUBgnzkNoV7qrH
# TU6/TiSzKmY0q/HI6btFJiaMwMl3w1XJseM3DNT+UVU/i+uWJzqEwqnFT3GFkfN4
# LLAzN/bRyjJgUKj1wibKbmEYaGmffRX5gqdZt1xB6xuAPZqlXH3hHMlU0EWiNnCf
# 5jg7hDlcDpqKSHjLpA==
# SIG # End signature block
