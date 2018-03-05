for ($i=1;$i -le 10;$i++) 
{ 
	$cadena=""
	for ($j=1;$j -le 10;$j++) 
	{
		$cadena+= "$i*$j="+ ($i*$j)+", "
	}
	$cadena
}