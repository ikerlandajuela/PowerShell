# Importa el modulo con rutas relativas desde donde ejecutamos script
$selfPath = (Get-Item -Path "." -Verbose).FullName
$dllRelativePath = "PSSQLite\PSSQLite"
$dllAbsolutePath = Join-Path $selfPath $dllRelativePath
Import-Module $dllAbsolutePath

$Database = ".\Names.SQLite"
$query = "INSERT INTO NAMES (Fullname, Surname, Givenname, Birthdate)
	VALUES ('Iker', 'Landajuela', 'Popu',19790510)"

Invoke-SqliteQuery -DataSource $Database -Query $query

# Leemos el contenido de la tabla
Invoke-SqliteQuery -DataSource $Database -Query "SELECT * FROM NAMES"