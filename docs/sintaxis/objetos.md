Una de las grandezas de **PowerShell** es que guarda la información en su tipo nativo: Los objetos. 

```powershell
$myVar = 2
$myVar

$myVar++
# NO funciona
#$myVar**
$myVar

$myVar+=2
#$myVar = $myVar + 2
$myVar

$myVar*=2
#$myVar = $myVar * 2
$myVar
```