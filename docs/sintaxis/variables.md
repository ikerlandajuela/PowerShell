# Orientación a objeto

Una de las grandezas de **PowerShell** es que guarda la información en su tipo nativo: Los **objetos**. PowerShell emplea los _object_ del framework .NET. 

Un objeto basicamente representa una entidad con datos (también llamados atributos o propiedades) y unos métodos (firmas o funciones) que expone para operar con estos datos. Es una forma de encapsular información. Por ahora es suficiente con saber esto, más adelante se explorará más en profundidad los objetos de PS (un objeto es el resultado de la instanciación de una clase).

Los nombres de variables en PS siempre van precedidad del carácter '$', por ejemplo una variable que contendra una cadena de texto con el nombre de un usuario podriamos definirla como `$UserName`.  

Los valores se asignan a una variable usando el operador '=', siguiendo el ejemplo anterior:

```powershell
$UserName = "Bob"
$UserAge = 43
```

PS 


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

# Enlaces externos

* [Clase Object (System) - MSDN - Microsoft](https://msdn.microsoft.com/es-es/library/system.object(v=vs.110).aspx).
* [PowerShell Basics: Introduction to Objects - Windows IT Pro](http://www.itprotoday.com/management-mobility/powershell-basics-introduction-objects).
* [PowerShell Basics: Custom Objects | IT Pro](http://www.itprotoday.com/management-mobility/powershell-basics-custom-objects).
* [PowerShell objects: A tutorial | Computerworld](https://www.computerworld.com/article/2954261/data-center/understanding-and-using-objects-in-powershell.html).
* [http://www.tomsitpro.com/articles/powershell-variables,2-797.html](http://www.tomsitpro.com/articles/powershell-variables,2-797.html).

	