# Variables de tipo string (cadena de texto) y int (entero)
$UserName = "Bob"
$UserAge = 43

# Si queremos establecer el mismo valor a varias variables
$a = $b = $c = 1
"These are the values of the variables: $a, $b, $c."

# Si queremos hacerlo con diferentes valores en una línea
$a, $b, $c = 1, 2, 3

# Obtener tipo de variable 
$b.GetType().Name

# PS define las variables $true y $false para los booleanos
$isChecked = $false
if (!$isChecked) { "No" }

	


