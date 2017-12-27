# Importa el modulo con rutas relativas desde donde ejecutamos script
$selfPath = (Get-Item -Path "." -Verbose).FullName
$dllRelativePath = "PSSQLite\PSSQLite"
$dllAbsolutePath = Join-Path $selfPath $dllRelativePath
Import-Module $dllAbsolutePath

$Database = ".\Names.SQLite"
# Si ya existe el fichero con la BD previamente lo borramos
if (Test-Path $Database) {Remove-Item $Database}

$Query = "CREATE TABLE NAMES (
	fullname VARCHAR(20) PRIMARY KEY, 
	surname TEXT, 
	givenname TEXT, 
	BirthDate DATETIME)"

# Create a database and a table
Invoke-SqliteQuery -Query $Query -DataSource $Database

# Veamos la información de la tabla recien creada
Invoke-SqliteQuery -DataSource $Database -Query "PRAGMA table_info(NAMES)"