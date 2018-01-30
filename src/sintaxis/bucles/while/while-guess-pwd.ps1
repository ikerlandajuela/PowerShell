Clear-Host
$ClaveScreta ="miclave"
$Acabar = "Prueba de nuevo"
while ($Acabar -ne "n") 
{
	$ClaveUsuario = Read-Host "Adivina la clave"
	if($ClaveUsuario -eq $ClaveScreta) 
	{
		Write-Host "Correcto! Saliendo..."
		$Acabar ="n"
	}
	else
	{
		$Acabar = Read-Host "Nuevo intento? (s/n)"
	}
} # Fin While

Write-Host "Fin"