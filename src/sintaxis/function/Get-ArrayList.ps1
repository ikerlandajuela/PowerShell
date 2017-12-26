function Write-Objects
{
	$arrayList = New-Object System.Collections.ArrayList
	[void] $arrayList.Add("Hola")
	[void] $arrayList.Add("Mundo")
	$arrayList	
} #end Write-Objects

Function Write-ArrayList
{
	$arrayList = New-Object System.Collections.ArrayList
	[void] $arrayList.Add("Hola")
	[void] $arrayList.Add("Mundo")
	,$arrayList	
}

$objectOutput = Write-Objects
# El siguiente comando produce error
$objectOutput.Add("Extra")

$arrayListOutput = Write-ArrayList
$arrayListOutput.Add("Extra")
