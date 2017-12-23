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

# Recursos

* [https://ss64.com/ps/for.html](https://ss64.com/ps/for.html).
* [comparison operators](https://ss64.com/ps/syntax-compare.html.