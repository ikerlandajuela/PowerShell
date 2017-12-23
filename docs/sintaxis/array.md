Un array contiene una lista de elementos de datos. Una diferencia frente a otros lenguajes de programación es que los elementos del array no tienen porque ser del mismo tipo a no ser que se defina el tipo de datos que alberga de forma explicita (_strongly typed_).

# Creando un array

**Fuente:** [array.ps1](/src/sintaxis/variables/arrays/array.ps1)

Para crear un array definimos cada elemento separado por `,`.

```powershell
$myArray = 1,"Hola",3.5,"Mundo"
$myArray	
```
O usando la sintaxis explicita:

```powershell
$myArray = @(1,"Hola",3.5,"Mundo")
```

Podemos el valor de un elemento determinado por su posición `$myArray[1]` contiene la cadena "Hola" (**la primera posición de un array es la 0**).

Para distribuir los elementos en variables individuales:

```powershell
$var1,$var2,$var3 = $myArray
```
Con un array de enteros (int) podemos usar el operador de rango para crear una secuencia de números ordenada

```powershell
$myArray = 1,2,3,4,5,6,7
$myArray = (1..7)
```

Para obtener el número de elementos usamos el miembro del objeto array length: `$myArray.length`. 

También podemos crear arrays multidimensionales, por ejemplo un array de 2x3:

```powershell
$myMultiArray = @(
	(1,2,3),
	(40,50,60)
)
```

# Añadir valores a un array 

Para añadir nuevos valores al array** usamos el operador `+=`.

```powershell
$myArray += 12
$countries += 'Hola'
```

# Obtener elementos de un array

`$myArray`: Retorna todos los elementos del array, arriba ya hemos visto como acceder a elementos individuales por su posición.

Para obtener un rango de elementos usamos por ejemplo `$myArray[4..6]` para obtener los valores comprendidos entre la posición 4 y la 6.

Para 

# Arrays Asociativos o Hashtable 	

```powershell
$myHashtable = @{ Key1 = "Value1"; "Key 2" = 1,2,3 }
```

# Arrays de objetos

**Fuente:** [array_objects.ps1](/src/sintaxis/variables/arrays/array_objects.ps1)

Cuando se crea un array sin especificar el tipo de datos que alberga PS crea el array como un array de objetos. Nosotros también podemos crear un array de objetos usando el cmdlet `New-Object`.

```powershell
# Creamos un array de objetos de tipo string
$myArray = New-Object string[] 10
$myArray[5] = "Hola" 
# Permite hacer esto
$myArray[1] = 12

$myArray

$myArray.gettype()
```

**Fuente:** [array_obj_strong_typed.ps1](/src/sintaxis/variables/arrays/array_obj_strong_typed.ps1)

Si queremos crear un array cuyo tipo de dato base sea inmutable podemos usar la siguiente sintaxis:

```powershell
$myList = New-Object Collections.Generic.List[Int]
$myList.Add(10)
# Esto produce error
$myList.Add("Hola")
```

**Fuente:** [array_get_process.ps1](/src/sintaxis/variables/arrays/array_get_process.ps1)

Para almacenar la salida de un comando que genera una lista ([Get-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-process?view=powershell-5.1)) usamos la una asignación a una varible, el siguiente ejemplo muestra todos los procesos corriendo un nuestro ordenador.

```powershell
$myArray = Get-Process
$myArray
```

# Array de objetos creados a medida

**Fuente:** [array_custom_obj.ps1](/src/sintaxis/variables/arrays/array_custom_obj.ps1)

PowerShell a pesar de ser un lenguaje interpretado demuestra ser muy avanzando ya que permite crear objetos a medida y jugar con ellos en un array.

```powershell
# Creamos un objeto propio
$myObject = New-Object System.Object

# Añadimos nuestras propiedades al objeto
$myObject | Add-Member -type NoteProperty -name Name -Value "Iker_PC"
$myObject | Add-Member -type NoteProperty -name Manufacturer -Value "Dell"
$myObject | Add-Member -type NoteProperty -name ProcessorSpeed -Value "3 Ghz"
$myObject | Add-Member -type NoteProperty -name Memory -Value "6 GB"

$myObject

"Memory is: "+$myObject.Memory

if ( (Test-Connection $myObject.Name -quiet) -eq $false)
{
	$myObject.Name + " ICMP echo request error"
}
else 
{
	$myObject.Name + " ICMP echo request ok"
}

# Modificamos una propiedad de un objeto
$myObject.Manufacturer = "HP"
$myObject
```

Ahora creamos un nuevo objeto y añadimos ambos a un array:

```powershell
# Creamos un array vacio
$myArray = @()
$myArray += $myObject

#Definimos un nuevo objeto
$myObject2 = New-Object System.Object
$myObject2 | Add-Member -type NoteProperty -name Name -Value "Asier_PC"
$myObject2 | Add-Member -type NoteProperty -name Manufacturer -Value "Acer"
$myObject2 | Add-Member -type NoteProperty -name ProcessorSpeed -Value "3 Ghz"
$myObject2 | Add-Member -type NoteProperty -name Memory -Value "4 GB"

$myArray += $myObject2

$myArray | Select-Object name
```


# Recursos arrays

* [https://ss64.com/ps/syntax-arrays.html](https://ss64.com/ps/syntax-arrays.html)
* Get-Blog : Ryan’s PowerShell Blog [Creating an Array of Custom Objects in Powershell](http://www.get-blog.com/?p=82).
* [New-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/new-object?view=powershell-5.1).
* [Windows PowerShell Cookbook by Lee Holmes](https://www.safaribooksonline.com/library/view/windows-powershell-cookbook/9780596528492/ch11s02.html).
* [Using the Get-Process Cmdlet](https://technet.microsoft.com/es-es/library/ee176855.aspx).
* [Get-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-process?view=powershell-5.1).
* [Test-Connection](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/test-connection?view=powershell-5.1): Sends ICMP echo request packets ("pings") to one or more computers.