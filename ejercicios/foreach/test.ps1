
Get-Service | Foreach {$_.name + " Status:-" + $_.status}

#Foreach ($item in Get-Service)
#{
#	$_.name
#}