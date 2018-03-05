$myvalue = 'segunda condición'
switch  -CaseSensitive ($myvalue)
{
	'Primera condición' { 'Primera acción' }
	'Segunda condición' { 'Segunda acción' }
}