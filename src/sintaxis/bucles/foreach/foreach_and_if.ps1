$Proc = Get-Process

ForEach ($IndProc in $Proc)
{
	$IndProc.ProcessName
}