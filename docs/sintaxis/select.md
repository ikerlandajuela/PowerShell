PowerShell destaca por el uso de los objetos de datos y como se pueden transmitir estos incluso usando tuberías (pipe) de un comando a otro. El cmdlet Select-Object como su nombre indica selecciona objetos. 

# Seleccionando el número de objetos

Usamos el parámetro `-First` para seleccionar X objetos desde el principio o `-Last` para hacerlo desde el final.

Por ejemplo 

```powershell
Get-EventLog -List | Select -First 1 | Get-Member
```

# Enlaces externos

* [PowerShell Basics: Select-Object | IT Pro](http://www.itprotoday.com/management-mobility/powershell-basics-select-object).