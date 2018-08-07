Set-Alias Get-ImcMo Get-ImcManagedObject
Set-Alias Remove-ImcMo Remove-ImcManagedObject
Set-Alias Add-ImcMo Add-ImcManagedObject
Set-Alias Set-ImcMo Set-ImcManagedObject
##############################################################################
#.SYNOPSIS
# Starts IMC Server
#
#.DESCRIPTION
# Starts IMC Server
#
##############################################################################
function FnStartImcServer([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcServer -AdminPower up -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcServer -AdminPower up -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcServer -AdminPower up -Force
	}
	else
	{
		$input | Set-ImcServer -AdminPower up 
	}
}
Set-Alias Start-ImcServer FnStartImcServer
##############################################################################
#.SYNOPSIS
# Stops IMC Server
#
#.DESCRIPTION
# Stops IMC Server
#
##############################################################################
function FnStopImcServer([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcServer -AdminPower soft-shut-down -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcServer -AdminPower soft-shut-down -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcServer -AdminPower soft-shut-down -Force
	}
	else
	{
		$input | Set-ImcServer -AdminPower soft-shut-down 
	}
}
Set-Alias Stop-ImcServer FnStopImcServer
##############################################################################
#.SYNOPSIS
# Restarts IMC Server
#
#.DESCRIPTION
# Restarts IMC Server
#
##############################################################################
function FnRestartImcServer([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcServer -AdminPower cycle-immediate -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcServer -AdminPower cycle-immediate -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcServer -AdminPower cycle-immediate -Force
	}
	else
	{
		$input | Set-ImcServer -AdminPower cycle-immediate 
	}
}
Set-Alias Restart-ImcServer FnRestartImcServer
##############################################################################
#.SYNOPSIS
# Resets IMC Server
#
#.DESCRIPTION
# Resets IMC Server
#
##############################################################################
function FnResetImcServer([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcServer -AdminPower hard-reset-immediate -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcServer -AdminPower hard-reset-immediate -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcServer -AdminPower hard-reset-immediate -Force
	}
	else
	{
		$input | Set-ImcServer -AdminPower hard-reset-immediate 
	}
}
Set-Alias Reset-ImcServer FnResetImcServer
##############################################################################
#.SYNOPSIS
# Turn on locator LED of rack
#
#.DESCRIPTION
# Turns on the locator LEDs on the front and back of the physical server. You can use the locator LEDs to find this physical server in the rack
#
##############################################################################
function FnEnableImcLocatorLed([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcLocatorLed -AdminState on -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcLocatorLed -AdminState on -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcLocatorLed -AdminState on -Force
	}
	else
	{
		$input | Set-ImcLocatorLed -AdminState on 
	}
}
Set-Alias Enable-ImcLocatorLed FnEnableImcLocatorLed
##############################################################################
#.SYNOPSIS
# Turn off locator LED of rack
#
#.DESCRIPTION
# Turns off the locator LEDs on the front and back of the physical server. You can use the locator LEDs to find this physical server in the rack
#
##############################################################################
function FnDisableImcLocatorLed([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcLocatorLed -AdminState off -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcLocatorLed -AdminState off -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcLocatorLed -AdminState off -Force
	}
	else
	{
		$input | Set-ImcLocatorLed -AdminState off 
	}
}
Set-Alias Disable-ImcLocatorLed FnDisableImcLocatorLed
##############################################################################
#.SYNOPSIS
# Runs power characterization
#
#.DESCRIPTION
# Runs a platform characterization stress on the system instantaneously
#
##############################################################################
function FnInvokeImcPowerCharacterization([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcPowerBudget -AdminAction start-power-char -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcPowerBudget -AdminAction start-power-char -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcPowerBudget -AdminAction start-power-char -Force
	}
	else
	{
		$input | Set-ImcPowerBudget -AdminAction start-power-char 
	}
}
Set-Alias Invoke-ImcPowerCharacterization FnInvokeImcPowerCharacterization
##############################################################################
#.SYNOPSIS
# Resets power profile to defaults
#
#.DESCRIPTION
# Resets the power profile configuration to factory default values
#
##############################################################################
function FnResetImcPowerProfile([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcPowerBudget -AdminAction reset-power-profile-default -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcPowerBudget -AdminAction reset-power-profile-default -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcPowerBudget -AdminAction reset-power-profile-default -Force
	}
	else
	{
		$input | Set-ImcPowerBudget -AdminAction reset-power-profile-default 
	}
}
Set-Alias Reset-ImcPowerProfile FnResetImcPowerProfile
##############################################################################
#.SYNOPSIS
# Delete all virtual drives and reset the physical drives
#
#.DESCRIPTION
# Delete all virtual drives and reset the physical drives
#
##############################################################################
function FnResetImcStorageController([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction delete-all-vds-reset-pds -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction delete-all-vds-reset-pds -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction delete-all-vds-reset-pds -Force
	}
	else
	{
		$input | Set-ImcStorageController -AdminAction delete-all-vds-reset-pds 
	}
}
Set-Alias Reset-ImcStorageController FnResetImcStorageController
##############################################################################
#.SYNOPSIS
# Allows you to clear the controller's boot drive
#
#.DESCRIPTION
# Allows you to clear the controller's boot drive
#
##############################################################################
function FnClearImcBootDrive([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction clear-boot-drive -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction clear-boot-drive -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction clear-boot-drive -Force
	}
	else
	{
		$input | Set-ImcStorageController -AdminAction clear-boot-drive 
	}
}
Set-Alias Clear-ImcBootDrive FnClearImcBootDrive
##############################################################################
#.SYNOPSIS
# Allows you to clear the foreign configuration of any physical drives
#
#.DESCRIPTION
# Allows you to clear the foreign configuration of any physical drives
#
##############################################################################
function FnClearImcForeignConfig([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction clear-foreign-config -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction clear-foreign-config -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction clear-foreign-config -Force
	}
	else
	{
		$input | Set-ImcStorageController -AdminAction clear-foreign-config 
	}
}
Set-Alias Clear-ImcForeignConfig FnClearImcForeignConfig
##############################################################################
#.SYNOPSIS
# Allows you to disable JBOD
#
#.DESCRIPTION
# Allows you to disable JBOD
#
##############################################################################
function FnDisableImcJbod([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction disable-jbod -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction disable-jbod -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction disable-jbod -Force
	}
	else
	{
		$input | Set-ImcStorageController -AdminAction disable-jbod 
	}
}
Set-Alias Disable-ImcJbod FnDisableImcJbod
##############################################################################
#.SYNOPSIS
# Exposes both the virtual drives and also the physical drives that are not associated with a virtual drive
#
#.DESCRIPTION
# Exposes both the virtual drives and also the physical drives that are not associated with a virtual drive
#
##############################################################################
function FnEnableImcJbod([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction enable-jbod -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction enable-jbod -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction enable-jbod -Force
	}
	else
	{
		$input | Set-ImcStorageController -AdminAction enable-jbod 
	}
}
Set-Alias Enable-ImcJbod FnEnableImcJbod
##############################################################################
#.SYNOPSIS
# Allows you to retrieve LSI TTY log to Cisco IMC
#
#.DESCRIPTION
# Allows you to retrieve LSI TTY log to Cisco IMC
#
##############################################################################
function FnGetImcTtyLog([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction get-tty-log -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction get-tty-log -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction get-tty-log -Force
	}
	else
	{
		$input | Set-ImcStorageController -AdminAction get-tty-log 
	}
}
Set-Alias Get-ImcTtyLog FnGetImcTtyLog
##############################################################################
#.SYNOPSIS
# Allows you to import the foreign configuration available on the physical drives
#
#.DESCRIPTION
# Allows you to import the foreign configuration available on the physical drives
#
##############################################################################
function FnImportImcForeignConfig([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction import-foreign-config -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction import-foreign-config -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcStorageController -AdminAction import-foreign-config -Force
	}
	else
	{
		$input | Set-ImcStorageController -AdminAction import-foreign-config 
	}
}
Set-Alias Import-ImcForeignConfig FnImportImcForeignConfig
##############################################################################
#.SYNOPSIS
# Reboot CMC of Cisco UCS C3X60 server
#
#.DESCRIPTION
# Reboot CMC of Cisco UCS C3X60 server
#
##############################################################################
function FnResetImcEquipmentSystemIOController([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcequipmentSystemIOController -AdminPower cmc-reboot -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcequipmentSystemIOController -AdminPower cmc-reboot -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcequipmentSystemIOController -AdminPower cmc-reboot -Force
	}
	else
	{
		$input | Set-ImcequipmentSystemIOController -AdminPower cmc-reboot 
	}
}
Set-Alias Reset-ImcEquipmentSystemIOController FnResetImcEquipmentSystemIOController
##############################################################################
#.SYNOPSIS
# Turn on front locator LED of Cisco UCS C3X60 server
#
#.DESCRIPTION
# Turns on the front locator LED of Cisco UCS C3X60 server. You can use the locator LEDs to find this physical server in the rack
#
##############################################################################
function FnEnableImcChassisLocatorLed([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcChassisLocatorLed -AdminState on -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcChassisLocatorLed -AdminState on -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcChassisLocatorLed -AdminState on -Force
	}
	else
	{
		$input | Set-ImcChassisLocatorLed -AdminState on 
	}
}
Set-Alias Enable-ImcChassisLocatorLed FnEnableImcChassisLocatorLed
##############################################################################
#.SYNOPSIS
# Turn off front locator LED of Cisco UCS C3X60 server
#
#.DESCRIPTION
# Turns off the front locator LED of Cisco UCS C3X60 server. You can use the locator LEDs to find this physical server in the rack
#
##############################################################################
function FnDisableImcChassisLocatorLed([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcChassisLocatorLed -AdminState off -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcChassisLocatorLed -AdminState off -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcChassisLocatorLed -AdminState off -Force
	}
	else
	{
		$input | Set-ImcChassisLocatorLed -AdminState off 
	}
}
Set-Alias Disable-ImcChassisLocatorLed FnDisableImcChassisLocatorLed
##############################################################################
#.SYNOPSIS
# Reset the platform event filters to default
#
#.DESCRIPTION
# Reset the platform event filters to default
#
##############################################################################
function FnResetImcEventFilters([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcEventManagement -AdminAction reset-event-filters -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcEventManagement -AdminAction reset-event-filters -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcEventManagement -AdminAction reset-event-filters -Force
	}
	else
	{
		$input | Set-ImcEventManagement -AdminAction reset-event-filters 
	}
}
Set-Alias Reset-ImcEventFilters FnResetImcEventFilters
##############################################################################
#.SYNOPSIS
# Delete the LDAP CA certificate present on the Cisco IMC
#
#.DESCRIPTION
# Delete the LDAP CA certificate present on the Cisco IMC
#
##############################################################################
function FnRemoveImcLdapCACertificate([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcLdapCACertificate -AdminAction delete-ca-certificate -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcLdapCACertificate -AdminAction delete-ca-certificate -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcLdapCACertificate -AdminAction delete-ca-certificate -Force
	}
	else
	{
		$input | Set-ImcLdapCACertificate -AdminAction delete-ca-certificate 
	}
}
Set-Alias Remove-ImcLdapCACertificate FnRemoveImcLdapCACertificate
##############################################################################
#.SYNOPSIS
# Allows you to test the LDAP binding through a generic authentication failure and pam-debug.log file. This file contains the output where the binding steps are described in detail. You must enable the 'debug' mode in the Pluggable Authentication Module (PAM) to generate and view the pam-debug.log file.
#
#.DESCRIPTION
# Allows you to test the LDAP binding through a generic authentication failure and pam-debug.log file. This file contains the output where the binding steps are described in detail. You must enable the 'debug' mode in the Pluggable Authentication Module (PAM) to generate and view the pam-debug.log file.
#
##############################################################################
function FnTestImcLdapBinding([string]$User, [string]$Pwd, [switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcLdapCACertificate -AdminAction test-ldap-binding -User $User -Pwd $Pwd -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcLdapCACertificate -AdminAction test-ldap-binding -User $User -Pwd $Pwd -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcLdapCACertificate -AdminAction test-ldap-binding -User $User -Pwd $Pwd -Force
	}
	else
	{
		$input | Set-ImcLdapCACertificate -AdminAction test-ldap-binding 
	}
}
Set-Alias Test-ImcLdapBinding FnTestImcLdapBinding
##############################################################################
#.SYNOPSIS
# Activates the specified PID catalog in Cisco IMC.
#
#.DESCRIPTION
# Activates the specified PID catalog in Cisco IMC.
#
##############################################################################
function FnEnableImcPidCatalog([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcActivatePIDCatalog -AdminState trigger -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcActivatePIDCatalog -AdminState trigger -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcActivatePIDCatalog -AdminState trigger -Force
	}
	else
	{
		$input | Set-ImcActivatePIDCatalog -AdminState trigger 
	}
}
Set-Alias Enable-ImcPidCatalog FnEnableImcPidCatalog
##############################################################################
#.SYNOPSIS
# Activates the specified BIOS profile.
#
#.DESCRIPTION
# Activates the specified BIOS profile.
#
##############################################################################
function FnEnableImcBiosProfile([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcBiosProfile -AdminAction activate -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcBiosProfile -AdminAction activate -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcBiosProfile -AdminAction activate -Force
	}
	else
	{
		$input | Set-ImcBiosProfile -AdminAction activate 
	}
}
Set-Alias Enable-ImcBiosProfile FnEnableImcBiosProfile
##############################################################################
#.SYNOPSIS
# Deletes the specified BIOS profile.
#
#.DESCRIPTION
# Deletes the specified PID catalog in Cisco IMC.
#
##############################################################################
function FnRemoveImcBiosProfile([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcBiosProfile -AdminAction delete -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcBiosProfile -AdminAction delete -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcBiosProfile -AdminAction delete -Force
	}
	else
	{
		$input | Set-ImcBiosProfile -AdminAction delete 
	}
}
Set-Alias Remove-ImcBiosProfile FnRemoveImcBiosProfile
##############################################################################
#.SYNOPSIS
# Allows you to take a backup of the BIOS configuration by deleting the existing BIOS profile and creating a new one if backup exists, else creates a new backup file.
#
#.DESCRIPTION
# Allows you to take a backup of the BIOS configuration by deleting the existing BIOS profile and creating a new one if backup exists, else creates a new backup file. You can activate the backed up BIOS profile any time to go back to the previous configuration.
#
##############################################################################
function FnBackupImcBiosProfile([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcBiosProfileManagement -AdminAction backup -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcBiosProfileManagement -AdminAction backup -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcBiosProfileManagement -AdminAction backup -Force
	}
	else
	{
		$input | Set-ImcBiosProfileManagement -AdminAction backup 
	}
}
Set-Alias Backup-ImcBiosProfile FnBackupImcBiosProfile
##############################################################################
#.SYNOPSIS
# Clears the one time precision boot device in Cisco IMC.
#
#.DESCRIPTION
# Clears the one time precision boot device in Cisco IMC.
#
##############################################################################
function FnClearImcOneTimePrecisionBootDevice([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcOneTimePrecisionBootDevice -AdminAction clear-one-time-boot-device -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcOneTimePrecisionBootDevice -AdminAction clear-one-time-boot-device -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcOneTimePrecisionBootDevice -AdminAction clear-one-time-boot-device -Force
	}
	else
	{
		$input | Set-ImcOneTimePrecisionBootDevice -AdminAction clear-one-time-boot-device 
	}
}
Set-Alias Clear-ImcOneTimePrecisionBootDevice FnClearImcOneTimePrecisionBootDevice
##############################################################################
#.SYNOPSIS
# This allows you to delete the root CA certificate.
#
#.DESCRIPTION
# This allows you to delete the root CA certificate in Cisco IMC.
#
##############################################################################
function FnRemoveImcRootCACertificate([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcKmipManagement -AdminAction delete-root-ca-certificate -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcKmipManagement -AdminAction delete-root-ca-certificate -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcKmipManagement -AdminAction delete-root-ca-certificate -Force
	}
	else
	{
		$input | Set-ImcKmipManagement -AdminAction delete-root-ca-certificate 
	}
}
Set-Alias Remove-ImcRootCACertificate FnRemoveImcRootCACertificate
##############################################################################
#.SYNOPSIS
# This allows you to delete the client certificate.
#
#.DESCRIPTION
# This allows you to delete the client certificate in Cisco IMC.
#
##############################################################################
function FnRemoveImcClientCertificate([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcKmipManagement -AdminAction delete-client-certificate -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcKmipManagement -AdminAction delete-client-certificate -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcKmipManagement -AdminAction delete-client-certificate -Force
	}
	else
	{
		$input | Set-ImcKmipManagement -AdminAction delete-client-certificate 
	}
}
Set-Alias Remove-ImcClientCertificate FnRemoveImcClientCertificate
##############################################################################
#.SYNOPSIS
# This allows you to delete the client private key
#
#.DESCRIPTION
# This allows you to delete the client private key in Cisco IMC.
#
##############################################################################
function FnRemoveImcClientPrivateKey([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcKmipManagement -AdminAction delete-client-private-key -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcKmipManagement -AdminAction delete-client-private-key -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcKmipManagement -AdminAction delete-client-private-key -Force
	}
	else
	{
		$input | Set-ImcKmipManagement -AdminAction delete-client-private-key 
	}
}
Set-Alias Remove-ImcClientPrivateKey FnRemoveImcClientPrivateKey
##############################################################################
#.SYNOPSIS
# This allows you to delete the KMIP login details.
#
#.DESCRIPTION
# This allows you to delete the KMIP login details.
#
##############################################################################
function FnClearImcKmipLogin([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcKmipServerLogin -AdminAction clear -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcKmipServerLogin -AdminAction clear -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcKmipServerLogin -AdminAction clear -Force
	}
	else
	{
		$input | Set-ImcKmipServerLogin -AdminAction clear 
	}
}
Set-Alias Clear-ImcKmipLogin FnClearImcKmipLogin
##############################################################################
#.SYNOPSIS
# This allows you to clear the KMIP server details.
#
#.DESCRIPTION
# This allows you to clear the KMIP server details.
#
##############################################################################
function FnClearImcKmipServer([switch]$Xml, [switch]$Force)
{
	if($Xml.IsPresent -and $Force.IsPresent)
	{
		$input | Set-ImcKmipServer   -AdminAction delete -Xml -Force
	}
	elseif($Xml.IsPresent)
	{
		$input | Set-ImcKmipServer   -AdminAction delete -Xml
	}
	elseif($Force.IsPresent)
	{
		$input | Set-ImcKmipServer   -AdminAction delete -Force
	}
	else
	{
		$input | Set-ImcKmipServer   -AdminAction delete 
	}
}
Set-Alias Clear-ImcKmipServer FnClearImcKmipServer
Set-Alias Acknowledge-ImcFault Confirm-ImcFault
Export-ModuleMember -Function * -Alias *

# SIG # Begin signature block
# MIIYyQYJKoZIhvcNAQcCoIIYujCCGLYCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCd7zX9Ce4DF7s9
# rPMLJ0ugBGkwe60yVk6iVUmioDzxYqCCExAwggQVMIIC/aADAgECAgsEAAAAAAEx
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
# IFCvft8T/LByORQmANxT+xep5js6oBAHSt503Nk1clq1MA0GCSqGSIb3DQEBAQUA
# BIIBAKwphPJPnePGx1baSaJ6Ru3k/XPBdaSRJtZjykItXv2lXdp4JG27pxEl+gHx
# GAITTPKXN0lvDLSAck/AENAe0JgK/pHf5fe8VCeTiCyAzwbCzGuc8TGKzr/AG6Tc
# v3lvcZ6tlcZTpUmgF6glcY3Ipzzo9De6owwYhmrNkG/9yAWgTVKsd5aQtMhiVBZd
# mmn519yqq3Z5PhV1HfnvWf01FGwhQ3XUtijxXN/siHQGllWafY8QN3wpDwvUmxaq
# AO8mFsujKt/e7TvQTAzEWEaaUMXyw5x9g6oYlOROuqVNCll6djC+ZfBfcnoxgcKl
# Uyho4qpJdfdOW3u6dltAegg+pVKhggLFMIICwQYJKoZIhvcNAQkGMYICsjCCAq4C
# AQEwcTBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEx
# MC8GA1UEAxMoR2xvYmFsU2lnbiBUaW1lc3RhbXBpbmcgQ0EgLSBTSEEyNTYgLSBH
# MgISESHtkBjKqSe3YmxSa5Btk/VnMA0GCWCGSAFlAwQCAQUAoIIBEjAYBgkqhkiG
# 9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xNzAyMjAyMDQxMjla
# MC8GCSqGSIb3DQEJBDEiBCAuIbkiZCGSr786lQA7v8BBQTL4sAWvtH9TbAbj9qAh
# djCBpgYLKoZIhvcNAQkQAgwxgZYwgZMwgZAwgY0EFDfAQYyoSAu6zgLgAOyIRq09
# tpHsMHUwX6RdMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
# LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIFRpbWVzdGFtcGluZyBDQSAtIFNIQTI1
# NiAtIEcyAhIRIe2QGMqpJ7dibFJrkG2T9WcwDQYJKoZIhvcNAQEBBQAEggEACcgc
# lqbKSj1wO5Jb1RGKXgAyS8Q9ezvyblNzy9aiOlg65dlJa1NQXo2uzn3M3qINYWwq
# LtSFmIr52o7+DSN+ReddNCsPmPDfmuRzmoQx1s/OmSTHiyzI1DPUQqeNQQgEKo8s
# 0KdXPIevX5gpT1qCyn2sWyX4Lm6vttIf6WbYHZlIPFV804Hiqsb18Ye4XTjm3EXM
# cGGMtezGUdPYVEo1HLF4kjzDfxQwGLWxhoztnQckK61Qhq/TIQ9oowjeRYLyqy81
# uXHpLYNL+BfXVHmyOgZfbqOel/DH/JLvJDY/eD3KPc+28DFPouTrVXwJReMhV6HX
# wjsoET7Qj/pfvZ2amA==
# SIG # End signature block
