$rowNumber = 10

for ($i=1;$i -le $rowNumber; $i++)
{
	for ($j=1; $j -le ($rowNumber-$i); $j++)
	{
			Write-Host –NoNewLine " "
	}
	
	for ($k=1; $k -le ($i*2); $k++)
	{
			Write-Host –NoNewLine "*"
	}
	Write-Host " "
}

Write-Host –NoNewLine "k"
Write-Host –NoNewLine "k"

# https://blogs.technet.microsoft.com/heyscriptingguy/2011/05/17/writing-output-with-powershell/
# http://www.studystreet.com/c-program-print-equilateral-triangle/