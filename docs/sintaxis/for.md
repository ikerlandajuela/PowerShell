Los bucles `for` ejecutan un bloque de comandos n veces basándose en una condición de parada.

Sintaxis:

```
for (init; condition; repeat) 
{
	# command_block
	# ...
}
```

_init_ se usa normalmente para inicializar una variable a un valor para usarla dentro del bucle como contador de iteraciones, _condition_ suele tener la condición de parada del bucle y _repeat_ contiene comandos, normalmente cuando se usa como contador contendrá como se incrementa la variable inicializada en _init_ como en este primer ejemplo. 

# For básico

**Fuente:** [array.ps1](/src/sintaxis/bucles/for/for_basico.ps1)

La variable `$i` se inicializa con el valor 1, mientrás `$i` sea menor o igual que 10 (ver [comparison operators](https://ss64.com/ps/syntax-compare.html) su valor se incrementará y ejecutará el bloque de comandos entre llaves. 
	
```powershell
PS> for($i=1; $i -le 10; $i++){$i} 
1
2
3
4
5
6
7
8
9
10
```

# Bucle For con Arrays

**Fuente:** [for_array.ps1](/src/sintaxis/bucles/for/for_array.ps1.ps1)

Probablemente tiene más sentido recorrer un array usando [ForEach](#sintaxis/foreach.md) pero es muy común hacerlo también con contador para recorrer cada elemento del array conociendo su longitud:

```powershell
$myarray = @("test1", "test2", "test3")
for ($i=0; $i -lt $myarray.length; $i++) 
{
	$myarray[$i]
}
```

Algo más avanzando es hacerlo con una tubería (_pipe_).

```powershell
$myarray |foreach { $_ }
```

# Ejercicios

**Fuente:** [SumFirst10Int.ps1](/src/sintaxis/bucles/for/SumFirst10Int.ps1)

Programa que sume los 10 primeros números enteros naturales:

```powershell
#$sum=0
for ($i=1; $i -le 10 ; $i++)  { $sum+=$i }
$sum
```

- - -

Programa que muestre el cubo de los primeros 5 números enteros (1...5), la salida del programa debería ser algo como:

**Fuente:** [IntCube.ps1](/src/sintaxis/bucles/for/IntCube.ps1)

```powershell
Cubo 1 es: 1
Cubo 2 es: 8
Cubo 3 es: 27
Cubo 4 es: 64
Cubo 5 es: 125
```

```powershell
for ($i=1; $i -le 5 ; $i++)  { "Cubo $i es: " + ($i*$i*$i) }
```

- - -

**Fuente:** [TablaMultiplicar.ps1](/src/sintaxis/bucles/for/TablaMultiplicar.ps1)

Tabla multiplicar del 15 por ejemplo, la salida debería ser algo como

```powershell
15 X 1 = 15 
...
... 
15 X 10 = 150
```

```powershell
for ($i=1;$i -le 10;$i++) { "15x$i="+(15*$i) }
```

- - -

Programa que escriba las tablas de multiplicar del 1 al 10.

Salida:

**Fuente:** [TablaMultiplicar2.ps1](/src/sintaxis/bucles/for/TablaMultiplicar2.ps1)

```powershell
1x1 = 1, 2x1 = 2, 3x1 = 3, 4x1 = 4, 5x1 = 5, 6x1 = 6, 7x1 = 7, 8x1 = 8 
... 
1x10 = 10, 2x10 = 20, 3x10 = 30, 4x10 = 40, 5x10 = 50, 6x10 = 60, 7x10 = 70, 8x10 = 80 
```

```powershell
for ($i=1;$i -le 10;$i++) 
{ 
	$cadena=""
	for ($j=1;$j -le 10;$j++) 
	{
		$cadena+= "$i*$j="+ ($i*$j)+", "
	}
	$cadena
}
```

- - -

**Fuente:** [Write-EquilateralTriangle.ps1](/src/sintaxis/bucles/for/Write-EquilateralTriangle.ps1)

Programa que "pinte" en consola un triangulo equilatero relleno de asteriscos de 10 filas.



- - -

**Fuente:** [BubleSortArrayFor.ps1](/src/sintaxis/bucles/for/BubleSortArrayFor.ps1)

**Ordenamiento Bubble Sort** en orden ascendente: El algoritmo de [ordenación de burbuja](https://es.wikipedia.org/wiki/Ordenamiento_de_burbuja) que permita ordenar un array de enteros de menor a mayor.

_"Funciona revisando cada elemento de la lista que va a ser ordenada con el siguiente, intercambiándolos de posición si están en el orden equivocado. Es necesario revisar varias veces toda la lista hasta que no se necesiten más intercambios, lo cual significa que la lista está ordenada. Este algoritmo obtiene su nombre de la forma con la que suben por la lista los elementos durante los intercambios, como si fueran pequeñas "burbujas". También es conocido como el método del intercambio directo. Dado que solo usa comparaciones para operar elementos, se lo considera un algoritmo de comparación, siendo uno de los más sencillo de implementar."_

- - -

```powershell
$myArray = @(5,1,4,2,8)

for ($i=0; $i -lt $myArray.length; $i++) 
{
	for($j=0; $j -lt ($myArray.length - $i -1); $j++)
	{		
		if ( $myarray[$j] -gt $myarray[$j+1] )
		{
			# swap array elements		
			$myarray[$j],$myarray[$j+1] = $myarray[$j+1],$myarray[$j]
		}		
	}
}

$myArray 
```


# Recursos

* [https://ss64.com/ps/for.html](https://ss64.com/ps/for.html).
* [comparison operators](https://ss64.com/ps/syntax-compare.html.