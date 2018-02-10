Una sentencia `switch` permite evaluar una variable contra una lista de valores. Cada valor comparado se llama un `case`. Permite elegir entre una serie de opciones pero sin la necesidad de escribir una larga concatenación de `If..Else`.

# Switch simple

**Fuente:** [switch-basic.ps1](/src/sintaxis/switch/switch-basic.ps1)

Sintaxis básica:

```powershell
$myvalue = 'Segunda condición'
switch ($myvalue)
{
	'Primera condición' { 'Primera acción' }
	'Segunda condición' { 'Segunda acción' }
}
```

En el ejemplo básico de arriba cuando `$myvalue` contenga 'Primera condición'  se mostrará por la salida 'Primera acción', lo mismo para la segunda condición.

**No se mostrará nada por la salida si `$myvalue` no cumple ninguna de las condiciones.


# Switch -CaseSensitive

**Fuente:** [switch-CaseSensitive.ps1](/src/sintaxis/switch/switch-CaseSensitive.ps1)

El parámetro `-CaseSensitive` fuerza a que la condición se cumpla distinguiendo entre mayúsculas y minúsculas. El siguiente ejemplo no cumpliria ninguna condición 	

```powershell
$myvalue = 'segunda condición'
switch  -CaseSensitive ($myvalue)
{
	'Primera condición' { 'Primera acción' }
	'Segunda condición' { 'Segunda acción' }
}
```



# Enlaces externos

* [Switch - PowerShell - SS64.com](https://ss64.com/ps/switch.html).
* [Windows PowerShell - Switch Statement Examples](http://www.computerperformance.co.uk/powershell/powershell_switch.htm).
