$manufacturer="Acer"
$processorspeed="4Ghz"
$memory="4GB"
$propertiesArray = @{Host="PC_Iker";Manufacturer=$manufacturer;ProcessorSpeed=$processorspeed;Memory=$memory}
$myObj = New-Object PSObject -Property $propertiesArray

$myArray = @()
$myArray+= $myObj
$myArray
