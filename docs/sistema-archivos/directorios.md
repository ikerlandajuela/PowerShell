# Obtener los ficheros de un directorio

Para obtener una lista de los archivos de un directorio empleamos el cmdlet [Get-ChildItem](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-5.1). Para obtener un item especifico usamos [Get-Item]().

**Fuente:** [get_files_dir.ps1](/src/sistema-archivos/directorios/get_files_dir.ps1)

Para obtener todos los elementos del directorio actual:
```powershell
Get-ChildItem
```

Podemos buscar aquellos elementos que cumplan un patrón:
```powershell
Get-ChildItem *.ps1
```

Si queremos buscar de forma recursiva dentro de las subcarpetas también
```powershell
Get-ChildItem *.txt -Recurse
```

Especificamos la ruta donde queremos buscar y excluimos ciertos elementos
```powershell
Get-ChildItem -Path C:\Windows -Exclude *.png
```

Si solo queremos listar los directorios.
```powershell
Get-ChildItem "C:\Windows" | where {$_.Attributes -match'Directory'}
```

# Buscar los ficheros modificados antes de una determinada fecha



# Recursos externos

* [Get-ChildItem](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-5.1): Gets the items and child items in one or more specified locations.
* [Trabajar con archivos y carpetas](https://docs.microsoft.com/es-es/powershell/scripting/getting-started/cookbooks/working-with-files-and-folders?view=powershell-5.1): Navegar a través de unidades de Windows PowerShell y manipular los elementos son procesos similares al de manipulación de archivos y carpetas en unidades de disco físico de Windows. Explicaremos cómo tratar con tareas específicas de manipulación de archivos y carpetas en esta sección.