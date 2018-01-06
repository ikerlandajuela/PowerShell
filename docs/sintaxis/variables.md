# Introducción

Una de las grandezas de **PowerShell** es que guarda la información en su tipo nativo: Los **objetos**. PowerShell emplea los _object_ del framework .NET. 

Un objeto basicamente representa una entidad con datos (también llamados atributos o propiedades) y unos métodos (firmas o funciones) que expone para operar con estos datos. Es una forma de encapsular información. Por ahora es suficiente con saber esto, más adelante se explorará más en profundidad los objetos de PS (un objeto es el resultado de la instanciación de una clase).

Los nombres de variables en PS siempre van precedidad del carácter '$', por ejemplo una variable que contendra una cadena de texto con el nombre de un usuario podriamos definirla como `$UserName`.  

**Fuente:** [BasicVarsTypes.ps1](/src/sintaxis/function/BasicVarsTypes.ps1)

Los valores se asignan a una variable usando el operador '=', siguiendo el ejemplo anterior:

```powershell
# Variables de tipo string (cadena de texto) y int (entero)
$UserName = "Bob"
$UserAge = 43
```

Si queremos establecer el mismo valor a varias variables

```powershell
$a = $b = $c = 1
```

Si queremos hacerlo con diferentes valores en una línea

```powershell
$a, $b, $c = 1, 2, 3
```

PS soporta infinidad de tipos de datos: cadenas de texto (string), carácteres individuales (char), bytes, números enteros (int), booleanos (bool $True/$False)...

Para determinar el tipo de una variable podemos usar 

```powershell
$b.GetType().Name
```

Lista de los tipos más comunes:

Tipo dato         | Descripción
------------------|------------------
[Array]           | Colección de elementos
[Bool]            | Verdadero ($true) o falso ($false)
[DateTime]        | Fecha - hora
[Guid]	          | Identificador único global de 32-bytes
[HashTable]       | Colección de pares clave - valores
[Int32], [Int]    | Entero de 32 bits
[PsObject]        | PowerShell object
[Regex]           | Expresión regular
[ScriptBlock]     |
[Single], [Float] | Número flotante con decimales
[String]          | Cadena de texto
[Switch]          | PowerShell switch parameter
[TimeSpan]        | Intervalo de tiempo
[XmlDocument]     | Documento XML

Los booleanos se evaluan como una condición binaria de verdadero ($true) o falso ($false).

```powershell
# PS define las variables $true y $false para los booleanos
$isChecked = $false
if (!$isChecked) { "No" }
```

# Como comprobar variables 

https://mcpmag.com/articles/2015/12/14/test-variables-in-powershell.aspx

# Enteros

**Fuente:** [IntVars.ps1](/src/sintaxis/function/IntVars.ps1)

Con las variables de tipo numéricas podemos realizar las operaciones matemáticas estándar como: +, -, *, /. 

```powershell
$segundosPorDia = 24 * 60 * 60
$semanasPorAnio = 365 / 7
```

También existen operadores ++ y -- que incrementan o decrementan en una unidad

```powershell
$myNum = 1
$myNum = $myNum + 1
# es equivalente a 
$myNum++
```

Si queremos operar sobre el mismo número podemos sintetizar la expresión:

```powershell
# Equivalente a  $myNum = $myNum*2 
$myNum*=2 

$myNum+=2 
```
# DateTime

```powershell
[DateTime]$Date = "February 28, 2015" 
$Today = Get-Date 
$Days = ($Today - $Date).Days 
Write-Host "The hacker encrypted all your servers $Days day(s) ago."
```

# Enlaces externos

* [Clase Object (System) - MSDN - Microsoft](https://msdn.microsoft.com/es-es/library/system.object(v=vs.110).aspx).
* [PowerShell Basics: Introduction to Objects - Windows IT Pro](http://www.itprotoday.com/management-mobility/powershell-basics-introduction-objects).
* [PowerShell Basics: Custom Objects | IT Pro](http://www.itprotoday.com/management-mobility/powershell-basics-custom-objects).
* [PowerShell objects: A tutorial | Computerworld](https://www.computerworld.com/article/2954261/data-center/understanding-and-using-objects-in-powershell.html).
* [http://www.tomsitpro.com/articles/powershell-variables,2-797.html](http://www.tomsitpro.com/articles/powershell-variables,2-797.html).
* [Powershell Data Types - PowerShell - SS64.com](https://ss64.com/ps/syntax-datatypes.html).
* [The PowerShell variable – Naming, value, data type – 4sysops](https://4sysops.com/archives/the-powershell-variable-naming-value-data-type/).
* [Display and search all variables of a PowerShell script with Get-Variable](https://4sysops.com/archives/display-and-search-all-variables-of-a-powershell-script-with-get-variable/).
* [PowerShell variable properties: Description, Visibility, Options, Attributes](https://4sysops.com/archives/powershell-variable-properties-description-visibility-options-attributes/).