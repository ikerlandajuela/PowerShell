Write-Host "Cree una contraseña segura usando un servicio como https://passwordsgenerator.net/"
Write-Host "la nueva contraseña deberia cumplir unos criterios de complejidad. No deber igual que la anterior, más de 8 carácteres con simbolos y números intercalados, ejemplo: Z7LFST89Xwmz"

$UserId = Read-Host "Deme Identidad del usuario (ejemplo: 'b.sinclair')"

$Newpwd = Read-Host "Deme nueva clave (compleja)" 

Set-ADAccountPassword $UserId -NewPassword (ConvertTo-SecureString -AsPlainText -String "$Newpwd" -force)
Set-ADUser -Identity $UserId -ChangePasswordAtLogon $true
