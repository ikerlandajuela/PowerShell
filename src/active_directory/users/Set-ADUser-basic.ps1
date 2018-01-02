Set-ADUser -Identity 'b.sinclair' -Office 'London'
Get-ADUser -Identity 'b.sinclair' -Properties Office

Set-ADUser -Identity 'b.sinclair' -Manager 'i.landajuela'
# Otra forma de hacerlo usando un pipe
# Get-ADUser -Identity 'b.sinclair' | Set-ADUser -Manager 'i.landajuela'
Get-ADUser -Identity 'b.sinclair' -Properties Manager

# Para comprobar si la clave a expirado
Get-ADUser -Identity 'b.sinclair' -Properties PasswordExpired