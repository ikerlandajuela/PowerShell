# Obtiene lista de verbos usados por PS
# Get-Command -CommandType cmdlet | Group-Object -Property Verb | Sort-Object -Property count -Descending

Function Write-HolaMundo
{
	"Hola"
	"Mundo"
}

Write-HolaMundo
# Podemos invocar la funci�n por su nombre tantas veces queramos.
Write-HolaMundo
