Write-Host "Declaración variable array con valores"
#$NumArray = (1,2,3,4,5,6,7,8,9,10,11,12)
$NumArray = (1..12)

Foreach ($Item in $NumArray) 
{
	$Item * 13
}

