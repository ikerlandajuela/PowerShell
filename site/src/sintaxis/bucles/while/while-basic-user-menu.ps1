Clear-Host

Write-Host "Menu:"
Write-Host "d - borrar fichero."
Write-Host "v - mostrar contenido de fichero"
Write-Host "q - salir / quit"

while(($inp = Read-Host -Prompt "Select a command") -ne "q")
{
	switch($inp)
	{
		'd' 
		{
			Write-Host "Borrado fichero"
		}
		'v' 
		{
			Write-Host "Mostrar contenido de fichero"
			
		}				
		default 
		{
			Write-Host  "Invalid entry"
		}
	} #End switch
} #End While