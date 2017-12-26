function Get-Sum([int] $n1,[int] $n2)
{
	$n1+$n2
} #end Get-Sum

"Suma de números: $(Get-Sum 3 5)"

# Esta llamada produciría un error 
# "Suma de números:"+ $(Get-Sum "Tres" 5)