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
