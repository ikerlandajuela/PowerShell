# Gets the processes that are running on the local computer or a remote computer.
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-process?view=powershell-5.1
$Proc = Get-Process

ForEach ($IndProc in $Proc)
{
	$IndProc.ProcessName
}