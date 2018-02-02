Sintaxis:

Cuando se ejecuta una instrucción `While`, PS evalúa la sección <condition> de la instrucción antes de entrar en la sección <statement list>. La parte de la condición de la instrucción se resuelve como `$True` o `$False`. Mientras la condición siga siendo `$True`, PS vuelve a ejecutar la sección <statement list>.

La <statement list> de la instrucción contiene uno o varios comandos que se ejecutan cada vez que se entra en el bucle o se repite.

```
while (<condition>){<statement list>}
```

El siguiente ejemplo muestra por consola los números del 1 al 3 ambos incluidos (`$val` se inicializa a 0). Usamos el operador de comparación y mientras la variable no sea 3 (podiamos usar menor o igual [`-le`](https://ss64.com/ps/syntax-compare.html) tal vez mejor) se incrementa una unidad a si misma con el operador de incremento y muestra su valor por pantalla.

```powershell
While($val -ne 3)
{
	$val++
	Write-Host $val
}
```

# Ejercicio: Adivinar la clave

Script que solicita al usuario que introduzca una contraseña y la compara con una contraseña interna definida en una variable, utilizamos el bucle `While` y las condicionales `If`.

**Fuente:** [while-guess-pwd.ps1](/src/sintaxis/bucles/while/while-guess-pwd.ps1)

```powershell
Clear-Host
$ClaveScreta ="miclave"
$Acabar = "Prueba de nuevo"
while ($Acabar -ne "n") 
{
	$ClaveUsuario = Read-Host "Adivina la clave"
	if($ClaveUsuario -eq $ClaveScreta) 
	{
		Write-Host "Correcto! Saliendo..."
		$Acabar ="n"
	}
	else
	{
		$Acabar = Read-Host "Nuevo intento? (s/n)"
	}
} # Fin While

Write-Host "Fin"
```

# Menú de usuario básico con do { ... } While

**Fuente:** [while-basic-user-menu.ps1](/src/sintaxis/bucles/while/while-basic-user-menu.ps1)

Ahora vamos a implementar el clásico menú de usuario que nos será de utilidad en muchas ocasiones, el cmdlet antes de mostrar las opciones de menú comprueba si existe un fichero ([Test-Path](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/test-path?view=powershell-5.1)) y en caso contrario lo crea y escribe una línea de contenido ([New-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-item?view=powershell-5.1)), más adelante veremos para que usamos el fichero. 

```powershell
if (!(Test-Path "test.txt"))
{
   New-Item -name test.txt -type "file" -value "my new text"
   Write-Host "Created new file and text content added"
}
```

A continuación comenzamos la estructura `do { ... } While` y mostramos las opciones de menú:

* "d - borra fichero".
* "v - mostrar contenido de fichero".
* "q - salir / quit"

Leemos la opción introducida por el usuario y la depositamos en una variable que evaluamos en un `switch`. Si la opción introducida es 'd' borramos el fichero de test creado al principio con [Remove-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-5.1). Para mostrar el contenido del fichero si el usuario introduce 'v' usamos [Get-Content](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-content?view=powershell-5.1) del fichero. Cuando selecciona 'q' simplemente mostramos un mensaje de despedida (será la condición de salida del bucle). El resto de casos cuando el usuario no introduce ninguna de las opciones previas se contemplan como `default` y indicaremos al usuario que la opción introducida no es valida. Al final evaluamos la condición de salida del bucle, mientras la opción introducida no sea 'q' (operador comparación `-ne` se traduciria como 'not equal') volvemos a ejecutar otra iteración volviendo a mostrar el menú de usuario.

```powershell
do {
	Write-Host "============== MENU =========================="
	Write-Host "d - borrar fichero."
	Write-Host "v - mostrar contenido de fichero"
	Write-Host "q - salir / quit"
	
	$OpcionUser = Read-Host "Selecciona opción de menú"

	switch($OpcionUser)
	{
		'd'
		{
			Write-Host "Borrado fichero"
			Remove-Item test.txt
		}
		
		'v' 
		{
			Write-Host "Mostrar contenido de fichero"
			Get-Content test.txt
			
		}
		
		'q'
		{
			"Saliendo"
		}
		
		default 
		{
			Write-Host  "Invalid entry"
		}
	} #End switch
} while($OpcionUser -ne "q") # End while
```

# Ejercicio : Introducir comando de usuario

**Fuente:** [while-enter-user-cmd.ps1](/src/sintaxis/bucles/while/while-enter-user-cmd.ps1)

```powershell
$command = "";
while($command -notmatch "quit")
{
	$command = Read-Host "Enter your command"
}
```

# Ejercicio : Yes / No Questión

**Fuente:** [while-yesno-question.ps1](/src/sintaxis/bucles/while/while-yesno-question.ps1)

```powershell
$validResponses = "Yes","No"
$response = ""
do
{
	$response = read-host "Yes or No?"
} while($validResponses -notcontains $response)
"Got it."	
```

# Enlaces externos

* [While statement - PowerShell - SS64.com](https://ss64.com/ps/while.html).
* [Windows PowerShell Do While.. Until Loops - Computer Performance](http://www.computerperformance.co.uk/powershell/powershell_loops_do_while.htm)
* [Test-Path - Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/test-path?view=powershell-5.1).
* [New-Item - Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-item?view=powershell-5.1).
* [New-Item - PowerShell - SS64.com](https://ss64.com/ps/new-item.html).
* [Remove-Item - Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-5.1).