# Obtener información servidores buzones de correo

El cmdlet `Get-MailboxServer` permite obtener información sobre los servidores de correo.

**Fuente:** [Show-MailBox-Server.ps1](/src/exchange/basico/Show-MailBox-Server.ps1)

```powershell
Get-MailboxServer
```

# Obtener información de un buzon

**Fuente:** [Show-MailBox-User.ps1](/src/exchange/basico/Show-MailBox-User.ps1)

Podemos ver si tiene establecida una cuota de correo en la tercera columna.

```powershell
Get-Mailbox -Identity 'b.sinclair'
```

Pero un buzón de Exchange Online tiene asociada más información, además de las cuatro propiedades devueltas por el cmdlet Get-Mailbox.

```powershell
Get-Mailbox -Identity 'b.sinclair' | Select-Object *
# También puede usar el cmdlet Select-Object para especificar un conjunto de valores de propiedad que se van a mostrar.
Get-Mailbox -Identity 'b.sinclair' | Select-Object DisplayName, LitigationHoldEnabled, LitigationHoldDate, LitigationHoldOwner, LitigationHoldDuration
```

# Bases de datos Mailbox

Para obtener los nombres de la bases de datos usadas como Mailbox:

```powershell
Get-MailboxDatabase
# Si queremos obtener los buzones de una base de datos concreta
Get-MailboxDatabase "Mailbox Database 1"  | Get-Mailbox 
```

También podemos obtener estadísticas e incluso obtener el tamañop total de cada buzones en una BD.

```powershell
Get-MailboxDatabase "Mailbox Database 1" | Get-MailboxStatistics | Sort totalitemsize -desc | ft displayname, totalitemsize, itemcount
```

Alernativamente podemos podemos obtener los datos de un buzón de correo específico:

```powershell
Get-MailboxStatistics -identity b.sinclair| fl
```

# Enlaces externos

* [Get-MailboxServer - TechNet - Microsoft](https://technet.microsoft.com/es-es/library/bb123539(v=exchg.160).aspx).
* [List of active mailboxes (PowerShell) - CodeTwo](https://www.codetwo.com/admins-blog/list-of-active-mailboxes-powershell/).
* [cunninghamp/Get-MailboxReport.ps1](https://github.com/cunninghamp/Get-MailboxReport.ps1).
* [Browsing Mailbox Databases in Exchange 2007 and 2010](https://practical365.com/exchange-server/browsing-mailbox-databases-in-exchange-2007-and-2010/).
* [Get-MailboxReport.ps1 – PowerShell Script to Generate Mailbox Reports](https://practical365.com/exchange-server/powershell-script-create-mailbox-size-report-exchange-server-2010/).
* [How to Calculate Exchange 2010 Mailbox Sizes with PowerShell](https://practical365.com/exchange-server/calculate-exchange-2010-mailbox-sizes-powershell/).
* [The essential guide to PowerShell in Exchange](http://searchexchange.techtarget.com/essentialguide/The-essential-guide-to-PowerShell-in-Exchange).