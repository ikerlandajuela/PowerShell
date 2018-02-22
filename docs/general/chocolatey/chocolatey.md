# Introducción

![](/general/chocolatey/01.png)

[Chocolatey](https://chocolatey.org/) es una aplicación para la consola de MS Win que recuerda al gestor de paquetes de Linux, permite de forma automatizada instalar o actualizar de forma desatendida aplicaciones de Windows como [paquetes](https://chocolatey.org/packages) (actualmente ya cuenta con 5517 paquetes).

# Instalando Chocolatey

**Abrimos PowerShell como administrador** y ejecutamos el siguiente comando ([ver](https://chocolatey.org/install) en la Web oficial)

```powershell
PS> Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

# Instalar aplicaciones

Instalar aplicaciones es super sencillo, por ejemplo para instalar [mRemoteNG](https://mremoteng.org/) (gestor de conexiones SSH, RDP, VNC y otros) ejecutamos:

```powershell
PS> choco install mremoteng
```
Cholatey descarga el instalador [MSI v1.75.7012 mRemoteNG de GitHub](https://github.com/mRemoteNG/mRemoteNG/releases/download/v1.75.7012/mRemoteNG-Installer-1.75.7012.16814.msi) y comienza su instalación de forma automática.

En un par de minutos ya está instalado y podemos ejecutar la aplicación.

![](/general/chocolatey/02.png)

# Actualizar una aplicación

Choco también sirve para actualizar las aplicaciones. Digamos que quieres actualizar Skype. Abre la terminal y escribe:

```powershell
PS> choco install skype
```

# Buscando una aplicación

Para husmear entre los 5517 y ver todo lo que ofrece usamos el comando `search`:

```powershell
PS> choco search 
```

# Cuando algo falla en Chocolatey

Podemos consultar el fichero de logs, en mi computadora ubicado en `C:\ProgramData\chocolatey\logs\chocolatey.log`.

# Instalando un servidor SSH

![](https://www.openssh.com/images/openssh.gif)

Vamos a instalador un servidor SSH para poder ejecutar comandos remotos en una máquina, usamos el instalador universal de [OpenSSH](https://www.openssh.com/) para MS Win. 

Usamos la opción `-y` (o `--yes` para confirmar todos los pasos de  la instalación) del comando [install](https://github.com/chocolatey/choco/wiki/CommandsInstall) y pasamos dos parametros al propio OpenSSH.

* /SSHServerFeature: Instala como servicio en el puerto 22.
* /SSHAgentFeature: Instala como agente del servicio.

```powershell
PS> choco install -y openssh -params '"/SSHServerFeature /SSHAgentFeature"'
```

# Chocolatey GUI: Sistema gráfico

Si queremos aunque no sea necesario podemos instalar el gestor gráfico de paquetes Chocolatey para escritorio:

```powershell
PS> choco install chocolateygui
```

# Aplicaciones interesantes

[Telegram](https://chocolatey.org/packages/telegram/): Mi sistema de mensajería preferido.

[ConEmu](https://conemu.github.io/): Emulador de la consola de Windows con pestañas.  

![](https://conemu.github.io/img/ConEmu-Maximus5.png)

[Git](https://git-scm.com/) Cliente para el popular servicio de alojamiento de código GitHub.

```powershell
PS> choco install git.install
``` 	
[Node.js](https://nodejs.org/es/): Node.js® es un entorno de ejecución para JavaScript construido con el motor de JavaScript V8 de Chrome. Node.js usa un modelo de operaciones E/S sin bloqueo y orientado a eventos, que lo hace liviano y eficiente. El ecosistema de paquetes de Node.js, npm, es el ecosistema mas grande de librerías de código abierto en el mundo.

```powershell
PS> choco install nodejs.install 
```

# PsGet: Busca e instala paquetes PsGet

Indispensable para programar en PS [PsGet](http://psget.net/) también se puede instalar sin Chocolatey con un cmdlet:

```powershell
PS> (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
```
Si lo queremos instalar con Chocolatey:

```powershell
PS> choco install PsGet 
```


# Enlaces externos
 
* [Wiki de Chocolatey en GitHub](https://github.com/chocolatey/choco/wiki): Recursos, enlaces y guia básica de uso, mención especial a los [comandos disponibles](https://github.com/chocolatey/choco/wiki/CommandsReference).


