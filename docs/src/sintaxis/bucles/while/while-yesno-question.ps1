$validResponses = "Yes","No"
$response = ""
do
{
	$response = read-host "Yes or No?"
} while($validResponses -notcontains $response)
"Got it."	
