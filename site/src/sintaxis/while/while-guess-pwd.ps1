#Clear-Host
$cadPwd = "clavesecreta"
$cadFin = "n"

while ($cadFin -ne "s") 
{
	$cadPwdUsuario = Read-Host "Adivina la clave:"
	if($cadPwdUsuario -eq $cadPwd)
	{
		Write-Host "Correcto"
		$cadFin = "s"
	}
	else
	{
		$cadFin = Read-Host "incorrecto, nuevo intento? (s/n)"
	}
} # Fin While

Write-Host "Fin"
