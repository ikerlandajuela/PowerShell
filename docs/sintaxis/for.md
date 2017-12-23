# Bucle For con Arrays

```powershell
$array = @("test1", "test2", "test3")
for ($i=0; $i -lt $array.length; $i++) {
	$array[$i]
}
```

```powershell
$array = ("test1", "test2", "test3")
$array |foreach {
	$_
}
```