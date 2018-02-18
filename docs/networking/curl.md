![](https://curl.haxx.se/logo/curl-logo.svg)

[cURL](https://es.wikipedia.org/wiki/CURL) es un software orientado a la transferencia de archivos sobre protocolos de red HTTP y FTP entre otros. cURL suele venir de forma nativa en las distribuciones basadas en GNU/Linux y es Open Source. En PS cURL es un alias de [Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-6), podemos comprobarlo con el comando [Get-Alias](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-alias?view=powershell-6).

```powershell
PS> Get-Alias curl

CommandType     Name                                               ModuleName
-----------     ----                                               ----------
Alias           curl -> Invoke-WebRequest
```

El siguiente ejemplo básico 	

```powershell
PS> curl http://services.groupkt.com/country/get/all | ConvertFrom-Json | Select name 
```



# Enlaces externos

* [Get-Alias - Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-alias?view=powershell-6).
* [Invoke-WebRequest - Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-6).
* [Cómo usar comando cURL con PowerShell y descargar archivos](https://www.solvetic.com/tutoriales/article/4925-como-usar-comando-curl-con-powershell-descargar-archivos).
* [RESTful web-services to get and search Countries](http://www.groupkt.com/post/c9b0ccb9/country-and-other-related-rest-webservices.htm).