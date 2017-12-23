Un array contiene una lista de elementos de datos. Una diferencia frente a otros lenguajes de programación es que los elementos del array no tienen porque ser del mismo tipo a no ser que se defina el tipo de datos que alberga de forma explicita (_strongly typed_).

## Creando un array

**Fuente:** [array.ps1](/src/sintaxis/variables/arrays/array.ps1)

Para crear un array definimos cada elemento separado por `,`.

```powershell
$myArray = 1,"Hola",3.5,"Mundo"
$myArray	
```
O usando la sintaxis explicita:

```powershell
$myArray = @(1,"Hola",3.5,"Mundo")
```

Podemos el valor de un elemento determinado por su posición `$myArray[1]` contiene la cadena "Hola" (**la primera posición de un array es la 0**).

Para distribuir los elementos en variables individuales:

```powershell
$var1,$var2,$var3 = $myArray
```
Con un array de enteros (int) podemos usar el operador de rango para crear una secuencia de números ordenada

```powershell
$myArray = 1,2,3,4,5,6,7
$myArray = (1..7)
```

Para obtener el número de elementos usamos el miembro del objeto array length: `$myArray.length`. 

También podemos crear arrays multidimensionales, por ejemplo un array de 2x3:

```powershell
$myMultiArray = @(
	(1,2,3),
	(40,50,60)
)
```

## Añadir valores a un array 

Para añadir nuevos valores al array** usamos el operador `+=`.

```powershell
$myArray += 12
$countries += 'Hola'
```

## Obtener elementos de un array

`$myArray`: Retorna todos los elementos del array, arriba ya hemos visto como acceder a elementos individuales por su posición.

Para obtener un rango de elementos  



## Arrays Asociativos o Hashtable 	

```powershell
$myHashtable = @{ Key1 = "Value1"; "Key 2" = 1,2,3 }
```

## Recursos arrays

* [https://ss64.com/ps/syntax-arrays.html](https://ss64.com/ps/syntax-arrays.html)
