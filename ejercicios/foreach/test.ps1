$Proc = Get-Process
#$Proc.length
#$Proc[0]

#Para conocer los atributos de cada objeto
Get-Process | Get-Member

ForEach ($IndProc in $Proc)
{
	#$IndProc.ProcessName
}