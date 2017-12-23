$propertiesArray = @{Host=$host;Manufacturer=$manufacturer;ProcessorSpeed=$processorspeed;Memory=$memory}
$myObj = New-Object PSObject -Property $propertiesArray

$myArray = @()
$myArray+= $myObj
$myArray
