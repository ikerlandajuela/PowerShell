$ErrorActionPreference = "Stop"

"Iniciando"

try
{
	$result = if(Get-Process -Name notepad) { "Running" } else { "Not running" }
}
catch
{	
	$strerror = $error[0].ToString()
	Write-Host "ERROR: '$strerror'."	
}
finally
{
	# Este bloque siempre se ejecuta 
	"Saliendo"
}


