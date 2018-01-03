Get-Mailbox -Identity 'b.sinclair'

Get-Mailbox -Identity 'b.sinclair' | Select-Object *
# También puede usar el cmdlet Select-Object para especificar un conjunto de valores de propiedad que se van a mostrar.
Get-Mailbox -Identity 'b.sinclair' | Select-Object DisplayName, LitigationHoldEnabled, LitigationHoldDate, LitigationHoldOwner, LitigationHoldDuration

Get-Mailbox | Select-Object DisplayName,IsMailBoxEnabled,SamAccountName
Get-Mailbox | Select-Object DisplayName,lastlogontime