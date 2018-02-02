$command = "";
while($command -notmatch "quit")
{
	$command = Read-Host "Enter your command"
}