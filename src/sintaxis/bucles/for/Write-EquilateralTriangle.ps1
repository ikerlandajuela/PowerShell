$rowNumber = 4

for ($i=1;$i -le $rowNumber; $i++)
{
	for ($j=1; $j -le ($rowNumber-$i); $j++)
	{
			$cad+=" "
	}
	
	for ($k=1; $k -le ($i*2); $k++)
	{
			$cad+="*"
	}
	$cad+="`r`n"
}

$cad

# https://blogs.technet.microsoft.com/heyscriptingguy/2011/05/17/writing-output-with-powershell/
# http://www.studystreet.com/c-program-print-equilateral-triangle/
# https://www.w3resource.com/c-programming-exercises/for-loop/index.php