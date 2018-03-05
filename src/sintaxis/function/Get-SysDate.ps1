function Get-SysDate {
	Get-Date
} #end Get-SysDate

$tomorrow = (Get-SysDate).AddDays(1)
$tomorrow