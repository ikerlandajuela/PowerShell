$myArray = 1,"Hola",3.5,"Mundo"
# Obtenemos la cadena "Hola".
$myArray[1]

$myArray = @(1,"Hola",3.5,"Mundo")

# Obtenemos los elementos del array en variables
$var1,$var2,$var3 = $myArray

$myArray = 1,2,3,4,5,6,7
$myArray = (1..7)

# Longitud del array o número de elementos
$myArray.length

# Sumamos el valor 12 como nuevo elemento al final del array
$myArray += 12

$myArray.length

$myMultiArray = @(
	(1,2,3),
	(40,50,60)
)

# Accedemos por su posición fila x columna
$myMultiArray[0][1]


