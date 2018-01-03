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

