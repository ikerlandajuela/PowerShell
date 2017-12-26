# Obtiene lista de verbos usados por PS
# Get-Command -CommandType cmdlet | Group-Object -Property Verb | Sort-Object -Property count -Descending

Function Write-Hola
{
	"Hola"
	"Mundo"
}

Write-Hola
# Podemos invocar la función por su nombre tantas veces queramos.
Write-Hola
