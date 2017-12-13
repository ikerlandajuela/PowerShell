# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-service?view=powershell-5.1
# https://technet.microsoft.com/es-es/library/ee176858.aspx
Get-Service | Foreach {$_.name + " Status:-" + $_.status}