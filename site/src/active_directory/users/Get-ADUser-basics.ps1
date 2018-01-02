Get-ADUser -Identity 'b.sinclair'

# Podemos hacer lo mismo filtrando por la propiedad Name
Get-ADUser -Filter 'Name -like "Bob Sinclair"'

Get-ADUser -Identity 'b.sinclair' -Properties Description,Office

# Para ver TODAS las propiedades de forma paginada
Get-ADUser -Identity 'b.sinclair' -Properties * | more 


Get-ADUser -Identity 'b.sinclair' -Properties msDS-UserPasswordExpiryTimeComputed, PasswordLastSet, CannotChangePassword, PasswordExpired