# Deshabilitar una cuenta 
Disable-ADAccount -Identity 'b.sinclair' 

# Habilitar una cuenta 
Enable-ADAccount -Identity 'b.sinclair' 

# Desbloquear una cuenta de usuario
Unlock-ADAccount -Identity 'b.sinclair' 

# Cambiar la clave 
Set-ADAccountPassword -Identity b.sinclair -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -Force)
