* [ForEach](#foreach)

# ForEach

**ForEach** permite crear bucles que ejecutan una serie de rutinas de forma iterativa.

Sintaxis:

```powershell
ForEach (item In collection) {ScriptBlock}
```

Recorre una colección de elementos y en cada iteración nos proporciona el siguiente elemento (item) de la colección (collection).

[foreach](../foreach.md)

## ForEach: Ejemplo básico con arrays

[foreach_array.ps1](/src/sintaxis/bucles/foreach/foreach_array.ps1)

Declaramos tres variables que contienen números enteros:

```powershell
$a = 5 
$b = 6
$c = 7

$a
$b
$c
```





	



