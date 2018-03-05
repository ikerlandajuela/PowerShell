function Get-Average {
param([int] $a, [int] $b)
	return ($a+$b)/2	
} #end Get-Average

"Media de números: $(Get-Average 3 5)"