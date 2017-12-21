$a = 5 
$b = 6
$c = 7

$a
$b
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


