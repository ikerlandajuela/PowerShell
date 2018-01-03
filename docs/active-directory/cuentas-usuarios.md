# Visualizar las propiedades de una cuenta

**Fuente:** [Get-ADUser-basics.ps1](/src/active_directory/users/Get-ADUser-basics.ps1)

El cmdlet [Get-ADUser](https://technet.microsoft.com/en-us/library/ee617241.aspx) permite obtener los datos de uno o mas usuarios de AD (Active-Directory).

Este es el ejemplo más sencillo, **la siguiente consulta obtiene sólo algunas de la propiedades de la cuenta**, buscamos una cuenta de un empleado ficticio llamado Bob Sinclair:

```powershell
Get-ADUser -Identity 'b.sinclair'
# Podemos hacer lo mismo filtrando por la propiedad Name
Get-ADUser -Filter 'Name -like "Bob Sinclair"'
```

Para ver que propiedades podemos consultar de un objeto usuario es siempre útil tener enlaces como estos a mano:

* [Active Directory: Get-ADUser Default and Extended Properties ...](https://social.technet.microsoft.com/wiki/contents/articles/12037.active-directory-get-aduser-default-and-extended-properties.aspx).
* [User Object Attributes (Windows) - MSDN - Microsoft](https://msdn.microsoft.com/en-us/library/ms677979(v=vs.85).aspx).

# Propiedades adicionales

Si queremos visualizar propiedades que no se muestran por defecto, por ejemplo la oficina de trabajo y la descripción de la cuenta:

```powershell
Get-ADUser -Identity 'b.sinclair' -Properties Description,Office
# Para ver TODAS las propiedades de forma paginada
Get-ADUser -Identity 'b.sinclair' -Properties * | more 
Get-ADUser -Identity 'b.sinclair' -Properties msDS-UserPasswordExpiryTimeComputed, PasswordLastSet, CannotChangePassword, PasswordExpired
```

# Modificar las propiedades de un usuarios

Set-ADUser permite modificar un usuario AD (advertencia: La cuenta de Manager debe existir en AD)

```powershell
Set-ADUser -Identity 'b.sinclair' -Office 'London'
Get-ADUser -Identity 'b.sinclair' -Properties Office

Set-ADUser -Identity 'b.sinclair' -Manager 'i.landajuela'
# Otra forma de hacerlo usando un pipe
# Get-ADUser -Identity 'b.sinclair' | Set-ADUser -Manager 'i.landajuela'
Get-ADUser -Identity 'b.sinclair' -Properties Manager

# Para comprobar si la clave a expirado
Get-ADUser -Identity 'b.sinclair' -Properties PasswordExpired
```

# Ejemplos avanzados

**Fuente:** [Filter-Users.ps1](/src/active_directory/users/Filter-Users.ps1)

Las fecha de caducidad de la clave y la fecha cuando se estableció la clave por última vez siempre son valores interesantes para los admins. Si queremos realizar varias operaciones sobre una lista de usuarios primero lo almacenamos en una lista de objetos.

El siguiente comando filtra las cuentas de usuarios habilitadas y que sus claves expiren.  

```powershell
$Users = Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $False} -Properties msDS-UserPasswordExpiryTimeComputed, PasswordLastSet, CannotChangePassword
```

Si solo queremos mostrar una lista de usuarios junto a fecha de expiración de la clave y la última vez que se modifico la clave:

```powershell
$Users | select Name, @{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}, PasswordLastSet
```

Como el atributo `UserPasswordExpiryTimeComputed` no se almacena de forma legible para humanos usamos la función `FromFileTime`. 

# Seguridad de cuentas de usuarios

**Fuente:** [Users-SecOp.ps1](/src/active_directory/users/Users-SecOp.ps1).

Algunas operaciones básicas de seguridad para administrar usuarios:

```powershell
# Deshabilitar una cuenta 
Disable-ADAccount -Identity 'b.sinclair' 

# Habilitar una cuenta 
Enable-ADAccount -Identity 'b.sinclair' 

# Desbloquear una cuenta de usuario
Unlock-ADAccount -Identity 'b.sinclair' 

# Cambiar la clave 
Set-ADAccountPassword -Identity b.sinclair -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -Force)
```

# Recursos externos

* [Get-ADUser - TechNet - Microsoft](https://technet.microsoft.com/en-us/library/ee617241.aspx).
* [Set-ADUser - TechNet - Microsoft](https://technet.microsoft.com/en-us/library/ee617215.aspx).
* [PowerShell: Get-ADUser to retrieve password last set and expiry information](https://www.oxfordsbsguy.com/2013/11/25/powershell-get-aduser-to-retrieve-password-last-set-and-expiry-information/).
* [Obtaining the password expiry date with PowerShell – 4sysops](https://4sysops.com/archives/obtaining-the-password-expiry-date-with-powershell/).
* [Select-Object - PowerShell - SS64.com](https://ss64.com/ps/select-object.html).
* [Active Directory: Get-ADUser Default and Extended Properties ...](https://social.technet.microsoft.com/wiki/contents/articles/12037.active-directory-get-aduser-default-and-extended-properties.aspx).