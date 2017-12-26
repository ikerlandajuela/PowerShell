Las funciones permiten agrupar comandos con un propósito y ejecutarlo desde cualquier parte de nuestro programa invocándola por su nombre, evitamos repetir los mismos comandos una y otra vez cuando queremos repetir una operación. Encapsulando la lógica de la aplicación en una función además fomenta la reutilización del código en otros scripts y la legibilidad para entender su funcionamiento.

Para crear una función comenzamos con la palabra clave `Function` para declararla seguida del nombre de la función que queramos darle, como **buena práctica** los manuales recomiendan usar una combinación de verbo-nombre, podemos incluso obtener una lista estándar de verbos que usa PS.  

```powershell
Get-Command -CommandType cmdlet | Group-Object -Property Verb | Sort-Object -Property count -Descending
```

# Función básica

**Fuente:** [basic_function.ps1](/src/sintaxis/function/basic_function.ps1)

El siguiente ejemplo ilustra una función super sencilla, cada vez que invocamos a la función por su nombre (una función debe "llamarse" para que ejecute sus comandos) ejecuta las líneas de comandos encerradas entre las llaves `{ }`.   

```powershell
Function Write-Hola
{
	"Hola"
	"Mundo"
}

Write-Hola
# Podemos invocar la función por su nombre tantas veces queramos.
Write-Hola
```
# Función para obtener la versión del sistema operativo

**Fuente:** [Get-OperatingSystemVersion.ps1](/src/sintaxis/function/Get-OperatingSystemVersion.ps1)

La siguiente función muestra como usar la salida que genera la función con la versión del sistema operativo para imprimir una cadena de texto. Usamos el cmdlet [Get-WmiObject](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-wmiobject?view=powershell-5.1) para obtener una instancia de la clase _Win32_OperatingSystem_ y acceder a su propiedad _Version_.

```powershell
Function Get-OperatingSystemVersion
{
	(Get-WmiObject -Class Win32_OperatingSystem).Version
} #end Get-OperatingSystemVersion

"This OS is version $(Get-OperatingSystemVersion)"
```

# Función con parámetros: Crear un directorio

**Fuente:** [New-Directory.ps1](/src/sintaxis/function/New-Directory.ps1)

La siguiente función crea un directorio llamado "MyNewDir": 

```powershell
function New-Directory
{
	New-Item -ItemType Directory -Name "MyNewDir"
} #end New-Directory

New-Directory
```

Si realmente quisieramos que su funcionalidad fuese más genérica cobra sentido poder pasarle el nombre del directorio que queremos crear para crear directorios diferentes, los parámetros permiten definir variables que alteran el comportamiento de la función pasandole valores desde su llamada.

```powershell
function New-Directory-Ext($dirName)
{
	New-Item -ItemType Directory -Name $dirName
} #end New-Directory-Ext

New-Directory-Ext "MyDir1"
New-Directory-Ext "MyDir2"
```

# 




# Recursos externos

* ikerlandajuela.wordpress.com [PowerShell: Ejemplos básicos](https://ikerlandajuela.wordpress.com/2017/09/15/powershell-ejemplos-basicos/).
* [Get-WmiObject](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-wmiobject?view=powershell-5.1)