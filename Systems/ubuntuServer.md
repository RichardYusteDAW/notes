# Ubuntu Server

## 1. Instalación interfaz gráfica 🖥️
- Desde Putty:
  - Host Name: ssh address
  - Connection -> SSH -> Auth -> Credentials -> PPK file -> Browse -> Select PPK file
- SSH address: EC2 -> Instances -> Connect -> SSH client -> Copy ssh address: ubuntu@ec2-100-25-24-119.compute-1.amazonaws.com
- PPK file: Descargar el archivo PPK desde la página del laboratorio de AWS

```bash	
sudo apt-get update                  # Actualizar repositorios
sudo apt-get install ubuntu-desktop  # Instalar interfaz gráfica
sudo reboot                          # Reiniciar
```
---
<br>

## 2. Instalación de TightVNC 💻

1. Actualizar paquetes del sistema:
```bash
sudo apt-get update && sudo apt-get upgrade
```

2. Abrir puerto 5901 en el firewall (Si se necesitan más conexiones se pueden abrir los puertos 5902, 5903, etc.)
```bash
sudo ufw allow 5901/tcp
```

3. Instalar shell gráfico más ligero que Ubuntu Desktop (Gnome):
- `xfce4` es un entorno de escritorio ligero
- `xfce4-goodies` es un conjunto de plugins y aplicaciones adicionales para el entorno de escritorio Xfce
```bash
sudo apt-get install xfce4 xfce4-goodies
```

4. Instalar TightVNC:
```bash
sudo apt-get install tightvncserver
```

5. Iniciar y detener TightVNC:
- Al iniciar TightVNC por primera vez creará el archivo de configuración `~/.vnc/xstartup` y el directorio `~/.vnc/` donde se guardará el archivo de configuración y el archivo de PID.
- Es posible que la primera vez que se inicia haya que hacerlo como superusuario, ya que necesita crear el archivo de configuración y el directorio por defecto, que está en `/root/.vnc/`.
```bash
vncserver             # Iniciar TightVNC (Si hubiera más de un puerto, se especifica con vncserver :2, vncserver :3, etc.)
vncserver -kill :1    # Detener TightVNC (Si hubiera más de un puerto, se especifica con vncserver -kill :2, vncserver -kill :3, etc.)
```
6. Password de TightVNC:
- Al iniciar TightVNC por primera vez, se pedirá que se cree una contraseña para acceder al servidor VNC.
- La contraseña se guardará en el archivo `~/.vnc/passwd`.
- Si deseamos cambiar la contraseña, podemos hacerlo con el comando `vncpasswd`.

7. Configurar TightVNC para que inicie el entorno de escritorio Xfce automáticamente:
```bash
nano ~/.vnc/xstartup

# Añadir las siguientes líneas al archivo:
startxfce4
```

8. Configurar TightVNC para que inicie automáticamente al arrancar el sistema:
```bash
sudo nano /etc/systemd/system/vncserver.service

# Añadir las siguientes líneas al archivo:
[Unit]
  Description=TightVNC server
  After=syslog.target network.target
[Service]
  Type=forking
  User=root
  PAMName=login
  PIDFile=/root/.vnc/%H:1.pid
  ExecStartPre=-/usr/bin/vncserver -kill :1 > /dev/null 2>&1
  ExecStart=/usr/bin/vncserver
  ExecStop=/usr/bin/vncserver -kill :1
[Install]
  WantedBy=multi-user.target
```
- Recargar systemd y habilitar el servicio:
```bash
sudo systemctl daemon-reload
sudo systemctl enable --now vncserver
```
<br><br><br>

## *[volver al índice](../README.md)*