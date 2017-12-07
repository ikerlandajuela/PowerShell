######################################################
#
#	AddAccountEscritorioRemoto_group.ps1
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

function CheckExisteUser([string] $SamAccountName="")
{
	Write-Debug "Checking if account name '$SamAccountName' exists and is enabled"	
	
	$count = @(Get-AdUser -filter {sAMAccountName -Like $SamAccountName -and enabled -eq $true} ).count
	
    Write-Debug "Number object result found : $count"
	
    If($count -eq 0) 
    { 
		Write-Host "Error account name not found or not enabled"
        $return = $false
		#break
    } 	
	else
	{
		Write-Debug "Account name found ok"
		$return = $true
	}
	return $return
} # FIN UserExists

#-----------------------------------------------------------------------------------------

function MainUsuarioAGrupoAD()
{
	$SamAccountName = Read-Host "Deme nombre de cuenta (Ejemplo: i.landajuela)"
	$exists = CheckExisteUser($SamAccountName)
	if ( $exists -eq $true )
	{
		UsuarioAGrupoAD($SamAccountName,"Escritorio Remoto")	
	}
	else
	{
		Write-Debug "Exiting nothing done"
	}
} # FIN MainUsuarioAGrupoAD

#-----------------------------------------------------------------------------------------

function UsuarioAGrupoAD([string] $SamAccountName="",[string] $GroupId="")
{	
	Write-Debug "Adding $SamAccountName to $GroupId security group."
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

Write-Debug "Exiting script."
