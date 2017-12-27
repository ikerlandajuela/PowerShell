#git clone https://github.com/RamblingCookieMonster/PSSQLite.git

if ( -Not (Test-Path ".\7z.exe")) 
{
	Write-Host "No se encuentra 7z.exe, descargando 7z1701.exe de 7-zip.org"
	$7zipUrl= "http://www.7-zip.org/a/7z1701.exe"
	$7zipOut= "7z1701.exe"
	Start-BitsTransfer -Source $7zipUrl -Destination $7zipOut	
	Write-Host "Descarga realizada, descomprimiendo"
	.\7z1701.exe
}

if (Test-Path ".\PSSQLite-master.zip") 
{
	Write-Warning "Ya existe PSSQLite-master.zip, borralo para seguir adelante."
	exit
}

#Descarga la última versión de GitHub
Write-Host "Descargando la última versión comprimida de PSSQLite de GitHub"
$pssqliteUrl = "https://github.com/RamblingCookieMonster/PSSQLite/archive/master.zip"
$pssqliteOutput = "PSSQLite-master.zip"
$start_time = Get-Date

Import-Module BitsTransfer
Start-BitsTransfer -Source $pssqliteUrl -Destination $pssqliteOutput
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

if (Test-Path ".\PSSQLite-master") 
{
	Write-Warning "Existe ya una carpeta llamada PSSQLite-master, borrala para seguir"
}
else
{
	.\7z.exe x PSSQLite-master.zip
}
