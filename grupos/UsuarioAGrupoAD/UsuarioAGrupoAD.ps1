# Script UsuarioAGrupoAD.ps1
<# .SYNOPSIS
    Añadir un usuario a grupo seguridad   
.DESCRIPTION
	Script que añade una cuenta introducida por el usuario (usuario de login de la cuenta o sAMAccountName) 
	a un grupo de seguridad de AD (Active Directory).
.NOTES
     Author     : Iker Landajuela - i.landajuela@koopera.org
.LINK
	https://ikerlandajuela.wordpress.com/2017/12/07/powershell-incluir-usuario-en-una-cuenta-de-seguridad/
.EXAMPLE	
	.\UsuarioAGrupoAD.ps1
#>

# Continue = muestra mensaje, SilentlyContinue = No muestra mensaje
# Stop = muestra y para, Inquire = pregunta al usuario 
$DebugPreference = "Continue"
# SilentlyContinue, Continue, Stop, and Inquire.
$ErrorActionPreference = "SilentlyContinue"

# Modulos AD
import-module ActiveDirectory

#-----------------------------------------------------------------------------------------

<#
.SYNOPSIS
	Función que recibe nombre cuenta AD, si existe y está activada retorna true, en caso contrario retorna false.
#>
function CheckExisteUsuario([string] $SamAccountName="")
{
	Write-Debug "Comprobando si existe nombre cuenta '$SamAccountName' y está habilitada"	
	
	$count = @(Get-AdUser -filter {sAMAccountName -Like $SamAccountName -and enabled -eq $true} ).count
	
    Write-Debug "Número de objetos encontrados : $count"
	
    If($count -eq 0) 
    { 
		Write-Host "Error nombre cuenta no existe o no está habilitado"
        $return = $false
		#break
    } 	
	else
	{
		Write-Debug "Nombre cuenta encontrado"
		$return = $true
	}
	return $return
} # FIN CheckExisteUsuario

#-----------------------------------------------------------------------------------------

<#
.SYNOPSIS
	Función que recibe nombre cuenta AD, si existe y está activada retorna true, en caso contrario retorna false.
#>
function MainUsuarioAGrupoAD()
{
	$ADGroupName = "Escritorio Remoto"
	$SamAccountName = Read-Host "Deme nombre de cuenta (Ejemplo: i.landajuela)"
	$exists = CheckExisteUsuario($SamAccountName)
	if ( $exists -eq $true )
	{
		Write-Debug "Llamando función UsuarioAGrupoAD($SamAccountName,$ADGroupName)"
		UsuarioAGrupoAD $SamAccountName $ADGroupName
	}
	else
	{
		Write-Debug "Saliendo sin hacer nada"
	}
} # FIN MainUsuarioAGrupoAD

#-----------------------------------------------------------------------------------------

<#
.SYNOPSIS
	Función que recibe nombre cuenta AD, si existe y está activada retorna true, en caso contrario retorna false.
#>
function UsuarioAGrupoAD([string] $SamAccountName="",[string] $GroupId="")
{	
	Write-Debug "Añadiendo '$SamAccountName' a grupo seguridad '$GroupId'."
	try
	{
		Add-ADGroupMember -Identity $GroupId -Member $SamAccountName
	}
	catch 
	{
		Write-Host "Se ha producido un error ejecutando el comando Add-ADGroupMember -Identity 'Escritorio Remoto' -Member $SamAccountName"
		Write-Host "Compruebe que el usuario no este ya en el grupo 'Escritorio Remoto'"
		# Finaliza el script 
		#break
	}
} # FIN UsuarioAGrupoAD

#-----------------------------------------------------------------------------------------

MainUsuarioAGrupoAD

Write-Debug "Saliendo del script."
