function Get-Greeting {
param([string] $subject="World")
	Write-Host 	"Hello $subject"
} #end Get-Greeting

Get-Greeting 
Get-Greeting "Mundo"