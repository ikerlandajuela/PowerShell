$url = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
#$url = https://dist.nuget.org/win-x86-commandline/v4.3.0/nuget.exe

$output = "nuget.exe"
$start_time = Get-Date

Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $output
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"