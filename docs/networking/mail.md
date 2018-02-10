

```powershell
$From = “tudirecciondecorreo@gmail.com”
$To = “direcciondedestino@dominio.com”
$Cc = “direccionconcopia@dominio.com”
$Attachment = “C:\users\Username\Documents\nombrearchivo.extension”
$Subject = “Asunto del mensaje”
$Body = “Texto del mensaje”
$SMTPServer = “smtp.gmail.com”
$SMTPPort = “587”
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential (Get-Credential) -Attachments $Attachment –DeliveryNotificationOption OnSuccess
```

# Enlaces externos

* [Cómo enviar un correo electrónico desde la línea de comandos](https://www.adslzone.net/como-enviar-correo-electronico-desde-linea-comandos/).
* [How to Send an Email Using Windows PowerShell](https://www.makeuseof.com/tag/send-email-windows-powershell/).