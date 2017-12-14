# Loop through a collection of the numbers, echo each number unless the number is 2:
foreach ($num in 1,2,3,4,5) 
{
  if ($num -eq 2) { continue } ; $num
}