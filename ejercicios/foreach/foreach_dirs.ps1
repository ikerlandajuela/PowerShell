# initialize the items variable with the
# contents of a directory
$items = Get-ChildItem -Path "c:\Users"
 
# enumerate the items array
foreach ($item in $items)
{
      # if the item is NOT a directory, then process it.
      if ($item.Attributes -ne "Directory")
      {
            Write-Host $item.Name
      }
}