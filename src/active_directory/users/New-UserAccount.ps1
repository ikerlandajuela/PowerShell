# Deben estar cargados Modulos Mailbox y AD

$debugPreference = "Continue"
$mailBoxDatabase = "Mailbox Database 12"

Write-Debug "Comprobando si existe buzon de correo con identidad b.sinclair"

# Borramos previamente datos
# Al quitar el buzon tambien se quita objeto de AD???
$Mailboxes = Get-Mailbox -Identity 'b.sinclair' | measure-object
if ( $Mailboxes.Count -gt 0 ) 
{
		Write-Debug "Procediendo a borrar buzon"
		Remove-Mailbox -Identity 'b.sinclair'
}
else
{
	Write-Debug "Buzon de usuario no existe"
	
	Write-Debug "Comprobando si existe usuario en AD"
	$Users =  Get-ADUser -Identity 'b.sinclair' | measure-object
	if ( $Users.Count -gt 0 ) 
	{		
		Write-Debug "Borrando usuario de AD"
		Remove-ADUser -Identity 'b.sinclair'
	}
	else
	{
		Write-Debug "Usuario no existe en AD"
	}
}

# ------------------------------------------------------------------------
# Crear nuevo usuario en AD
# ------------------------------------------------------------------------
$PlainPassword = "ClaveInicial"
$SecurePassword = $PlainPassword | ConvertTo-SecureString -AsPlainText -Force

$MyName = "Bob"
$MySurname = "Sinclair"
$MySamAccountName = "b.sinclair"
$MyPath = "Pruebas"
$MyDepartament = "Informatica"
$MyDescription = "Tecnico de Sistemas"
$MyTitle = "Sistema Teknikaria"
$MyhomePhone = "946155585"
$Mycity = "Bilbao"
$MypostalCode = "48005"
$Mystate = "Bizkaia"
$MyStreetAddress = "Artekale kalea 20"
$MyMobilePhone = "688624333"
$MyCompany = "Koopera, KPR"
$MyOffice = "Bilbao"
$global:MyEmailAddress = "b.sinclair@koopera.org"
$MyInitials = "SB"
$MyHomePage = "https://ikerlandajuela.wordpress.com/"

$parms = @{ 
		Name = $MyName + " " + $MySurname
		GivenName = $MyName
		Surname = $MySurname
		SamAccountName = $MySamAccountName
		UserPrincipalName = $MySamAccountName + '@koopera.org'
		Enabled = $True
		AccountPassword = $SecurePassword
		Path = 'OU=' + $MyPath + ',OU=Usuarios,OU=Koopera,DC=koopera,DC=local'
		Department = $MyDepartament
		Description = $MyDescription
		DisplayName = $MyName + " " + $MySurname
		homePhone = $MyhomePhone
		city = $Mycity
		postalCode = $MypostalCode
		state = $Mystate
		StreetAddress = $MyStreetAddress
		MobilePhone = $MyMobilePhone
		OfficePhone = $MyMobilePhone
		Title = $MyTitle
		Company = $MyCompany
		Office = $MyOffice
		EmailAddress = $MyEmailAddress
		Initials = $MyInitials
		HomePage = $MyHomePage
          }

#Write-Debug $parms.Get_Item("Name")

Write-Debug "LLamando a cmdlet New-ADUser"
New-ADUser @parms
Write-Debug "LLamando a cmdlet Set-ADUser"
Set-ADUser -Identity $MySamAccountName -ChangePasswordAtLogon $False
Write-Debug "LLamando a cmdlet Add-ADGroupMember"
Add-ADGroupMember -Identity "Escritorio Remoto" -Member $MySamAccountName

# ---------------------------------------------------------------------------------
# Funcion para crear un Mailbox a un usuario
# ---------------------------------------------------------------------------------
Write-Debug "LLamando a cmdlet Enable-Mailbox para crear buzon"
Enable-Mailbox -Identity $MyEmailAddress -Database $mailBoxDatabase
Write-Debug "LLamando a cmdlet Enable-Mailbox se habilita el archivo para el buzón"
Enable-Mailbox -Identity $MyEmailAddress -Archive



