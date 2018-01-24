Write-Host "Cree una contraseña segura usando un servicio como https://passwordsgenerator.net/"
$UserId = Read-Host "Deme Identidad del usuario (ejemplo: 'b.sinclair')"

$Newpwd = Read-Host "Deme nueva clave (compleja)" 

Set-ADAccountPassword $UserId -NewPassword (ConvertTo-SecureString -AsPlainText -String "$Newpwd" -force)
Set-ADUser -Identity $UserId -ChangePasswordAtLogon $true
