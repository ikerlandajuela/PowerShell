
```powershell
Write-Host "Definimos variables"
$myVar1=1
$myVar2=2

Write-Host "Comparamos si son iguales"
if ( $myVar1 -lt $myVar2) 
{
	"Var 1 es menor que var2" 
}
elseif ( $myVar1 -gt $myVar2) 
{
	"Var 1 es mayor que var2" 
} 
else
{
	Write-Host "Son iguales!"
}
```

```powershell
$myVar1 = $false
$myVar2 = $false

# $false realmente contiene "False"
$myVar1

if (!$myVar1) { "myVar1 es false" }

if ( $myVar1 -and $myVar2)
{
	"las dos variables son true"
}
else
{
	"alguna de ellas es false"
} 
```


```powershell
$myVar1Numero = 7
$myVar2Numero = 2

if ( ($myVar1Numero -lt 5) -and ($myVar2Numero -gt 1) )
{
	"HOla"
}
else
{
	"Adios"
}
```
