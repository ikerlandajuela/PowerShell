![SQLite_Logo_4.png](./img/SQLite_Logo_4.png)

**[SQLite](https://www.sqlite.org/)** es una base de datos empotrada, no sigue el clásico esquema de cliente servidor sino que el motor de la base de datos se incluye en nuestras aplicaciones, esto lo convierte en altamente portable y ideal para entornos embebidos con limitaciones y características reducidas (podemos copiar y pegar nuestra aplicación sin necesidad de instalaciones adicionales como el sistema de gestión de bases de datos). Además el código fuente es de dominio público y esta apadrinado por [SQLite Consortium](https://www.sqlite.org/consortium.html) entre cuyos miembros se incluyen: Mozilla, Bloomberg y otros. Esto ya es garantía de solidez y de futuro desarrollo.

**SQLite almacena toda la BD (Base de Datos) en un sólo fichero de disco** (junto con los índices, triggers, etc,.).

La librería SQLite es muy liviana, en total ocupa menos de 500KiB, como decía más arriba ideal para entornos reducidos como Smartphones Android o una PDA.

# System.Data.SQLite ADO.NET

**System.Data.SQLite** es un proveedor ADO.NET para [SQLite](https://www.sqlite.org/). ADO.NET es un conjunto de clases que exponen servicios de acceso a datos para programadores de .NET Framework.

Para instalar el componente SQLite vamos a descargar previamente [Nuget](https://www.nuget.org/downloads) CLI (Command Line Interface) para usarlo desde línea de comandos sin necesidad de usarlo desde el IDE Visual Studio ([nuget.exe Windows x86 Commandline v4.4.1](https://dist.nuget.org/win-x86-commandline/latest/nuget.exe)).

**Fuente:** [Get-NuGet-Latest-Cli.ps1](/src/bases_de_datos/sqlite/Get-NuGet-Latest-Cli.ps1)

```powershell
$url = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$output = "nuget.exe"
$start_time = Get-Date

Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $output
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
```

Ahora usando NuGet buscamos paquete:

```powershell
PS> .\nuget.exe list System.Data.SQLite
```

E instalamos 

```powershell
PS> .\nuget.exe install System.Data.SQLite -Version 1.0.106  
```

**Nota: Hasta el momento siguiendo este método no he conseguido cargara la libreria DLL usando `[System.Reflection.Assembly]::LoadFrom($SQLiteDLLPath)`** 

Runtime [x64](http://www.microsoft.com/en-gb/download/details.aspx?id=13523) y 
[x86](http://www.microsoft.com/en-us/download/details.aspx?id=8328).

# PSSQLite PowerShell Module

PSSQLite ([GitHub](https://github.com/RamblingCookieMonster/PSSQLite)) es un módulo de PS para trabajar con bases de datos **SQLite**. Está disponible de forma libre en GitHub para su descarga.

Yo lo he descargado e integrado en mis fuentes con el resto de scripts, también lo he descargado comprimido como [PSSQLite-master.zip](/src/bases_de_datos/sqlite/PSSQLite-master.zip) para mantener intactos los fuentes originales (Usar sino [Install-PSSQLite.ps1](/src/bases_de_datos/sqlite/Install-PSSQLite.ps1) para hacerlo todo con un script).

```powershell
PS> git clone https://github.com/RamblingCookieMonster/PSSQLite.git
PS> Import-Module PSSQLite.psm1
# Get commands in the module
PS> Get-Command -Module PSSQLite
```

## PSSQLite: Creando la BD y una tabla

**Fuente:** [PSSQLite_Ex1.ps1](/src/bases_de_datos/sqlite/PSSQLite_Ex1.ps1) 

A continuación vamos a crear la base de datos en el fichero _"Names.SQLite"_ y una tabla de ejemplo.

Para importar el módulo **PSSQLite** he usado prestadas unas líneas de código que no vienen al caso pero que se puede consultar en el script de ejemplo. 

Para evitar errores primero compruebo si ya existe la BD con `Test-Path`, en ese caso borro el fichero 

```powershell
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
```

# PSSQLite: Insertar un registro

**Fuente:** [PSSQLite_Ex2.ps1](/src/bases_de_datos/sqlite/PSSQLite_Ex2.ps1) 
 
```powershell
$Database = ".\Names.SQLite"
$query = "INSERT INTO NAMES (Fullname, Surname, Givenname, Birthdate)
	VALUES ('Iker', 'Landajuela', 'Popu',19790510)"

Invoke-SqliteQuery -DataSource $Database -Query $query

# Leemos el contenido de la tabla
Invoke-SqliteQuery -DataSource $Database -Query "SELECT * FROM NAMES"
```
Podemos consultar más ejemplos y toda la documentación en este [enlace](http://ramblingcookiemonster.github.io/SQLite-and-PowerShell/).

# CodePlex: SQLite PowerShell Provider Module

Sitio [SQLite PowerShell Provider](https://psqlite.codeplex.com/).

Ahora vamos a probar un poco el módulo de CodePlex.

```

# Referencias externas

* [ADO.NET - MSDN - Microsoft](https://msdn.microsoft.com/es-es/library/e80y5yhx(v=vs.110).aspx).
* [SQLite](https://www.sqlite.org/): Portal oficial.
* [NuGet Command-Line Interface (CLI) Reference | Microsoft Docs](https://docs.microsoft.com/es-es/nuget/tools/nuget-exe-cli-reference)
* [https://www.nuget.org/packages/System.Data.SQLite](https://www.nuget.org/packages/System.Data.SQLite)
* [3 ways to download files with PowerShell](https://blog.jourdant.me/post/3-ways-to-download-files-with-powershell).
* [Using Windows PowerShell to Create BITS Transfer Jobs (Windows)](https://msdn.microsoft.com/en-us/library/windows/desktop/ee663885(v=vs.85).aspx).
* En mi blog:
	* [SQLite Base de datos embebida para C](https://ikerlandajuela.wordpress.com/2015/11/30/sqlite-base-de-datos-embebida-para-c/).
	* [C# SQLiteBook: Catalogo de libros con SQLite (I)](https://ikerlandajuela.wordpress.com/2016/08/28/c-sqlitebook-catalogo-de-libros-con-sqlite-i/).
	* [C# SQLiteBook: Catalogo de libros con SQLite (II)](https://ikerlandajuela.wordpress.com/2016/08/29/c-sqlitebook-catalogo-de-libros-con-sqlite-ii/).
	* [Import-Module - Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/import-module).
* [Test-Path - Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/test-path).

https://psqlite.codeplex.com/