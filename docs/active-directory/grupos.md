# Usuarios y grupos

Obtener los nombres de los grupos a los que pertenece un usuario:

```powershell
Get-ADPrincipalGroupMembership 'b.sinclair' | Select name
```

Algo similar pero ahora queremos obtener las cuentas que pertecenen a un grupo:

```powershell
Get-ADGroupMember -identity 'Nombre del grupo' -recursive | select name
```

```powershell
Remove-ADGroupMember -Identity 'Nombre del grupo' -Member 'b.sinclair'
```


# Buscar un grupo por nombres

El siguiente cmlet usa [Get-ADGroup](https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-adgroup?view=win10-ps) para obtener los grupos de AD y los filtra por la propiedad del objeto `name` que comienzen por la cadena especificada y muestra el nombre y descripción de cada grupo:

```powershell
PS> Get-ADGroup -Filter {name -like "gsDir*"} -Properties Description | Select Name,Description
```

# Referencias externas

* [Get-ADGroup - Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-adgroup?view=win10-ps).
