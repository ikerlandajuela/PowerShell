$temperature = 90
if($temperature -le 0)
{
	"Balmy Canadian Summer"
}
elseif($temperature -le 32)
{
	"Freezing"
}
elseif($temperature -le 50)
{
	"Cold"
}
elseif($temperature -le 70)
{
	"Warm"
}
else
{
	"Hot"
}