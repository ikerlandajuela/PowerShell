# Introducción

Si queremos evaluar una condición bajo la cual se ejecute una porción de código usamos las sentencias condicionales `if`, `elseif`, y `else`.

En este primer ejemplo vamos evaluando condiciones de forma encadenada comprobando si la variable `$temperature` se ajusta a un determinado límite. Empleamos el operador de comparación `-le` ([Comparison operators - PowerShell - SS64.com](https://ss64.com/ps/syntax-compare.html)) que comprueba si la variable es menor o igual que un entero. 

**Fuente:** [IfTemperature.ps1](/src/sintaxis/if/IfTemperature.ps1)

```powershell
$temperature = 90
if($temperature -le 0)
{
	"Balmy Canadian Summer"
}
elseif($temperature -le 32)
{
	"Freezing"
}
elseif($temperature -le 50)
{
	"Cold"
}
elseif($temperature -le 70)
{
	"Warm"
}
else
{
	"Hot"
}
```

# Asignación de variables con If

**Fuente:** [IfVarAssignment.ps1](/src/sintaxis/if/IfVarAssignment.ps1)

Adicionalmente podemos usar las expresiones condicionales para asignar el valor a una variable.

```powershell
$result = if(Get-Process -Name notepad) { "Running" } else { "Not running" }
```

# Operadores de comparación

**Fuente:** [ComparisonOperatorsExamples.ps1](/src/sintaxis/if/ComparisonOperatorsExamples.ps1)

|Operador    | Descripción
-------------|-------------
|-eq         | Equal
|-ne         | Not equal
|-ge         | Greater than or equal
|-gt         | Greater than
|-lt         | Less than
|-le         | Less than or equal
|-like       | Wildcard comparison
|-notlike    | Wildcard comparison
|-match      | Regular expression comparison
|-notmatch   | Regular expression comparison
|-replace    | Replace operator
|-contains   | Containment operator
|-notcontains| Containment operator
|-in         | Like –contains, but with the operands reversed.(PowerShell 3.0)
|-notin      | Like –notcontains, but with the operands reversed.(PowerShell 3.0)



# Operadores lógicos

|Operador    | Descripción
-------------|-------------
|-and        | Logical And
|-or         | Logical Or
|-xor        | Logical exclusive Or
|-not        | logical not
|!           | logical not

```powershell
$demo = $null
if (-Not ($demo)) { write "Zero, null or Empty"}
if (!($demo)) { write "Zero, null or Empty"}
```

# Operadores ternarios


```powershell
#$CarColor = 'Red'
$CarColor = 'Blue' 
$MatchColor = @{$true = 'The car color is blue'; $false = 'The car color is not blue'}[$CarColor -eq 'Blue']
$MatchColor
```

# Enlaces externos

* [An Introduction to Error Handling in PowerShell – Keith Babinec's ...](https://blogs.msdn.microsoft.com/kebab/2013/06/09/an-introduction-to-error-handling-in-powershell/).
* [PowerShell Hacks: Ternarys and Null-coalescing operators](http://fearthecowboy.com/powershell/2015/12/11/PowerShell-A-Better-Ternary/).
* [A Simpler If/Then Conditional Logic in PowerShell](https://www.adamtheautomator.com/a-simpler-ifthen-conditional-logic-in-powershell/).

