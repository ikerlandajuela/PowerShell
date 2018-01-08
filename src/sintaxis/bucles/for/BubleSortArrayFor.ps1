$myArray = @(5,1,4,2,8)

for ($i=0; $i -lt $myArray.length; $i++) 
{
	for($j=0; $j -lt ($myArray.length - $i -1); $j++)
	{		
		if ( $myarray[$j] -gt $myarray[$j+1] )
		{
			# swap array elements		
			$myarray[$j],$myarray[$j+1] = $myarray[$j+1],$myarray[$j]
		}		
	}
}

$myArray 