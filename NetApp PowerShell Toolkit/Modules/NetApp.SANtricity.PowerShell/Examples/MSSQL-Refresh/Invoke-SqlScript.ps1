<#
.SYNOPSIS
    A script that will run commands in an sql file.  
.DESCRIPTION
    The name of the sql file must correspond to the 
    type of operation.  The type of operation must be "Mount" or "Unmount".  Therefore, mount.sql
    or unmount.sql will be executed with the Invoke-SqlCmd cmdlet.
.PARAMETER Operation
    Choose the kind of operation you wish to run.  Valid values are "Mount" and "Unmount" and
    are enforced by the script.
.NOTES
    Be aware this is script can be a security liability in the hands of someone who wishes
    to do harm.  The script executes with permission of the user who executes the script
    so it is not run with elevated privilege.
.LINK
    Invoke-Sqlcmd
.EXAMPLE
    ./Invoke-SqlScript -Operation Mount
    Run the script and invoke mount.sql in the present directory.
.EXAMPLE
    ./Invoke-SqlScript -Operation Unmount
    Run the script and invoke unmount.sql in the present directory.
#>
Param([ValidateSet("Mount","Unmount")] [string]$Operation="Mount" )
$SQLFile = Get-Item -Path $($Operation + ".sql")
if ($SQLFile.Exists) {
    Invoke-Sqlcmd -InputFile $SQLFile.FullName # todo - catch an error about db's already being detached.
} else {
    Write-Error "* * * ERROR - File [$($SQLFile.FullName)] does not exist."
}