# Por ejemplo para listar los buzones y tama�os en una BD concreta.
Get-Mailbox -Database MB-HO-01 | Get-MailboxStatistics | ft displayname,totaldeleteditemsize,totalitemsize