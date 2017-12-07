######################################################
#
#	UsuarioAGrupoAD.ps1
#	Autor: Iker Landajuela <i.landajuela@koopera.org>
#	Versión: 0.1
#	Fecha: 20171207
#
#	Ejemplo: .\UsuarioAGrupoAD.ps1
#   Objetivo: Añadir un usuario a grupo seguridad 
######################################################
# Continue = muestra mensaje, SilentlyContinue = No muestra mensaje
# Stop = muestra y para, Inquire = pregunta al usuario 
$DebugPreference = "Continue"
# SilentlyContinue, Continue, Stop, and Inquire.
$ErrorActionPreference = "SilentlyContinue"

# Modulos AD
import-module ActiveDirectory

#-----------------------------------------------------------------------------------------

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

function MainUsuarioAGrupoAD()
{
	$ADGroupName = "Escritorio Remoto"
	$SamAccountName = Read-Host "Deme nombre de cuenta (Ejemplo: i.landajuela)"
	$exists = CheckExisteUsuario($SamAccountName)
	if ( $exists -eq $true )
	{
		UsuarioAGrupoAD($SamAccountName,$ADGroupName)	
	}
	else
	{
		Write-Debug "Saliendo sin hacer nada"
	}
} # FIN MainUsuarioAGrupoAD

#-----------------------------------------------------------------------------------------

function UsuarioAGrupoAD([string] $SamAccountName="",[string] $GroupId="")
{	
	Write-Debug "Añadiendo $SamAccountName a grupo seguridad $GroupId."
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
