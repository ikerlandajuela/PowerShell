* [ForEach con arrays](#foreach-con-arrays)

**ForEach** permite crear bucles que ejecutan una serie de rutinas de forma iterativa.

Sintaxis:

```powershell
ForEach (item In collection) {ScriptBlock}
```

Recorre una colección de elementos y en cada iteración nos proporciona el siguiente elemento (item) de la colección (collection).

# ForEach con arrays

[foreach_array.ps1](/src/sintaxis/bucles/foreach/foreach_array.ps1)

Declaramos tres variables que contienen números enteros:

```powershell
$a = 1 
$b = 2
$c = 3
```

Con las tres variables componemos un array:

```powershell
$d = $a,$b,$c
```

En el caso de arrays de enteros podemos usar el operador de rango para crear una secuencia ordenada de números, para el ejemplo superior hubiese sido equivalente crearlo así:

```powershell
$d = 1..3
```

Podemos acceder a cada elemento del array 

## Enlaces




	



