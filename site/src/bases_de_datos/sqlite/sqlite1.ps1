$SQLiteDLLPath = "$pwd\System.Data.SQLite.x64.1.0.106.0\lib\net45\System.Data.SQLite.dll"
#$SQLiteDLLPath
[System.Reflection.Assembly]::LoadFrom($SQLiteDLLPath)

<#
try
{
	#Add-Type -Path "C:\Users\i.landajuela\Documents\GitHub\PowerShell\docs\src\bases_de_datos\sqlite\System.Data.SQLite.Core.1.0.106.0\lib\net46\System.Data.SQLite.dll"
	
	[void][System.Reflection.Assembly]::LoadFrom("C:\Users\i.landajuela\Documents\GitHub\PowerShell\docs\src\bases_de_datos\sqlite\System.Data.SQLite.Core.1.0.106.0\lib\net46\System.Data.SQLite.dll")
}
Catch
{
  write-warning 'You''ll need the System.Data.SQLite provider to get any further';
  exit;
}
#>