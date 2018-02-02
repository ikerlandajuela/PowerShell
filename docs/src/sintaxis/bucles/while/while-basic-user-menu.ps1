if (!(Test-Path "test.txt"))
{
   New-Item -name test.txt -type "file" -value "my new text"
   Write-Host "Created new file and text content added"
}

Clear-Host

do {
	Write-Host "============== MENU =========================="
	Write-Host "d - borrar fichero."
	Write-Host "v - mostrar contenido de fichero"
	Write-Host "q - salir / quit"
	
	$OpcionUser = Read-Host "Selecciona opción de menú"

	switch($OpcionUser)
	{
		'd'
		{
			Write-Host "Borrado fichero"
			Remove-Item test.txt
		}
		
		'v' 
		{
			Write-Host "Mostrar contenido de fichero"
			Get-Content test.txt
			
		}
		
		'q'
		{
			"Saliendo"
		}
		
		default 
		{
			Write-Host  "Invalid entry"
		}
	} #End switch
} while($OpcionUser -ne "q") # End while

