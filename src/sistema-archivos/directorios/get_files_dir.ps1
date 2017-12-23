# Obtiene todos los elementos del directorio actual
Get-ChildItem

Get-ChildItem *.ps1

# Si queremos buscar de forma recursiva dentro de las subcarpetas también
Get-ChildItem *.txt -Recurse	

# Especificamos la ruta donde queremos buscar y excluimos ciertos elementos
Get-ChildItem -Path C:\Windows -Exclude *.png

# Si solo queremos listar los directorios
Get-ChildItem "C:\Windows" | where {$_.Attributes -match'Directory'}