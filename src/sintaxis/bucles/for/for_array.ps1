$myarray = @("test1", "test2", "test3")
for ($i=0; $i -lt $myarray.length; $i++) 
{
	$myarray[$i]
}

$myarray |foreach { $_ }