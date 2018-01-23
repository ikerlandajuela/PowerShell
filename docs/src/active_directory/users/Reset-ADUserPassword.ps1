Write-Host "Cree una contraseña segura usando un servicio como https://passwordsgenerator.net/"

$UserId = Read-Host "Deme Identidad del usuario (ejemplo: 'b.sinclair')"

# El sistema solicitara la nueva contraseña y confirmación
# https://passwordsgenerator.net/ Ejemplo: 7!c!`2Ecuk
Set-ADAccountPassword $UserId -NewPassword $newpwd -Reset -PassThru	 

# TODO 
# Forzamos cambio contraseña siguiente inicio sesion, por alguna razon no funciona...
# Set-ADuser –Identity $UserId -ChangePasswordAtLogon $True
# Get-ADUser $UserId | Set-AdUser -ChangePasswordAtLogon $true