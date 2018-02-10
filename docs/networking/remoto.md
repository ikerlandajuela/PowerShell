# Comandos PS en computadoras remotas

Las capacidades de PS permiten acceder a sesiones de PS en computadoras remotas, es similar a SSH muy usado en Linux por ejemplo.

En el ordenador que queramos controlar remotamente, abrimos PowerShell como Administrador. 

Una vez abierto el PS en la computadora destino, ejecutamos este comando WinRM, que instala el control remoto:

```powershell
PS> Enable-PSRemoting -Force
```

El siguiente paso será decirle los Equipos que tendrán un control Administrador del WinRM, si ejecutamos el siguiente comando todos los equipos tendrán control de Administrador, pero eso no es lo que queremos. 

```powershell
PS> Set-Item wsman:\localhost\client\trustedhosts *
```

Para restringir los equìpos que se puedan conectar como Administradores automáticamente sustituimos el * por nombre o nombres de equipos.

Ahora reseteamos el servicio WinRM:

```powershell
PS> Restart-Service WinRM
```

Podemos testear si el servicio WinRM para ver si esta todo bien instalado (donde computadora será el equipo remoto).

```powershell
PS> Test-WsMan COMPUTADORA
```

# Iniciar una sesión remota 

```PowerShell
PS> Enter-PSSession -ComputerName COMPUTER -Credential USER
```







# Enlaces externos

* [Enable-PSRemoting - Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/enable-psremoting?view=powershell-5.1).
* [How to Run PowerShell Commands on Remote Computers](https://www.howtogeek.com/117192/how-to-run-powershell-commands-on-remote-computers/).