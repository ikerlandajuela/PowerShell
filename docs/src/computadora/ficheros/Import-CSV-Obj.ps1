dir C:\ | Select-Object -Property Name,Length | Export-Csv .\FileList.csv

$MyFileList = Import-CSV C:\temp\FileList.csv

$MyFileList | ForEach-Object {
	#Cast properties
	$_Name = [string]$_.Name	
	$_Lenght = [int]$_.Length
	# Escribir objeto
	$_
}
