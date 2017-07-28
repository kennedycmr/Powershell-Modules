
### Display disk space information for local and remote Windows systems. 

function Get-DiskSpace {
  param (
    [string]$ComputerName = "localhost"
  )

  get-wmiobject win32_logicaldisk -computername $ComputerName |select-object @{Name="Partition"; Expression={$_.DeviceID}}, @{
    Name="Size_GB"; Expression={
      [math]::round($_.Size / 1GB)
    }
  }, @{
    Name="FreeSpace_GB"; Expression={
      [math]::round(($_.Size-$_.Freespace) / 1GB)
    }
  }
}


