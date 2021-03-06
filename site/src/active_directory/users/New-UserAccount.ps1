# Deben estar cargados Modulos Mailbox y AD
# http://www.kouti.com/tables/userattributes.htm

import-module activedirectory


$debugPreference = "Continue"
$mailBoxDatabase = "Mailbox Database 12"

Write-Debug "Comprobando si existe buzon de correo con identidad b.sinclair"

# Borramos previamente datos
# OJO!! Al quitar el buzon tambien se quita objeto de AD
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
# TODO: Obtener nuevas claves complejas de forma autom�tica en lugar de usar https://passwordsgenerator.net/
$PlainPassword = "ClaveInicial"
$SecurePassword = $PlainPassword | ConvertTo-SecureString -AsPlainText -Force

# Name - String - cn (Relative Distinguished Name)
$MyName = "Bob"
# 
$MySurname = "Sinclair"
#In the AD attribute sAMAccountName, the account logon name or the user object is stored 
# - in fact the legacy NetBIOS form as used in the naming notation "Domain\LogonName".
# The attribute samAccountName is a mandatory attribute (a MUST attribute) for user objects.
# For the purpose of clarity the sAMAccountName should always be conform to the user principal name (UPN), 
# the modern logon name of a AD User. Hereby the sAMAccountName has to be equal to the 
# prefix part of the attribute "userPrincipalName"
$MySamAccountName = "b.sinclair"
# Ruta dentro del arbol AD
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
		UserPrincipalName = $MySamAccountName + '@koopera.local'
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
		Country = "ES"
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
Write-Debug "LLamando a cmdlet Enable-Mailbox se habilita el archivo para el buz�n"
Enable-Mailbox -Identity $MyEmailAddress -Archive



