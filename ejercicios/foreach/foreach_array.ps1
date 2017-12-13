# Definición de 3 variables
Write-Host "Definición de variables"
$a = 5 
$b = 6
$c = 7

# Mostramos contenido variables por consola
Write-Host "Contenido variable a:"
$a
Write-Host "Contenido variable b:"
$b
Write-Host "Contenido variable c:"
$c

# Creamos un array de 3 elementos con las variables
Write-Host "Creamos un array de 3 elementos con las variables"
$d = $a,$b,$c

# Imprimimos contenido d
Write-Host "Imprimimos contenido array d"
$d

Write-Host "Imprimimos contenido d[0]"
# Acceso a posición array
$d[0]
# Es lo mismo que $d + 1
Write-Host "Imprimimos contenido d[1]"
$d[1]
Write-Host "Imprimimos contenido d[2]"
$d[2]

Write-Host "Bucle foreach sumando 5 a cada elemento"
Foreach ($i in $d)
{
	$i + 5
}


