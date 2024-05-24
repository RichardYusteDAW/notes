# AWS

## 1. Instancia EC2
- Panel de administración de AWS -> Servicios -> Informátca -> EC2
- Selecionar la región

### 1.1. Crear una instancia
- Click en "Launch Instance"
  - **Nombre y etiquetas:** Asignar un nombre a la instancia.
  - **Imagen de máquina:** Seleccionar una imagen de máquina (Amazon Linux, macOS, Ubuntu, Windows, Red Hat, SUSE, etc.)
  - **Arquitectura:** Seleccionar la arquitectura de la máquina (32 o 64 bits).
  - **Tipo de instancia:** Seleccionar el tipo de instancia (tamaño de la máquina).
    - **t2.nano:** 1 vCPU, 0.5 GB de RAM.
    - **t2.micro:** 1 vCPU, 1 GB de RAM.
    - **t2.small:** 1 vCPU, 2 GB de RAM.
    - **t2.medium:** 2 vCPU, 4 GB de RAM.
    - **t2.large:** 2 vCPU, 8 GB de RAM.
    - **t2.xlarge:** 4 vCPU, 16 GB de RAM.
    - **t2.2xlarge:** 8 vCPU, 32 GB de RAM.
  - **Par de claves:** Crear un par de claves o seleccionar uno existente.
  - **Configuración de la red:** Seleccionar una red y una subred.
  - **Crear grupo de seguridad:** Crear un grupo de seguridad o seleccionar uno existente (permisos de entrada y salida de conexiones).
  - **Configurar almacenamiento:** Seleccionar el tamaño del disco duro.
  - **Detalles avanzados:** Configurar detalles avanzados.
    - **Protección de terminación:** Proteger la terminación accidental de la instancia para evitar que se elimine accidentalmente.
    - **Datos de usuario:** Ingresar un script de inicio.
```bash
#!/bin/bash
instalación dnf -y httpd
systemctl habilitar httpd
systemctl iniciar httpd
echo  '<html><h1>¡Hola desde tu servidor web!</h1></html>' > /var/www/html/index.html
```

### 1.2. Monitorear la instancia
- Acciones -> Monitorear y solucionar problemas -> Obtener registro del sistema.
- Acciones -> Monitorear y solucionar problemas -> Obtener captura de pantalla de la instancia.
<br>

### 1.3. Cambiar el tipo de la instancia
- Detener la instancia
- Acciones -> Configuracón de la instancia -> Cambiar el tipo de instancia.
<br>

### 1.4.Habilitar y deshabilitar la protección de terminación
- Acciones -> Configuración de la instancia -> Cambiar protección de terminación.
<br>

### 1.5. Cambiar el tamaño del volumen EBS
- Detener la instancia
- Acciones -> Configuración de la instancia -> Cambiar el tamaño del volumen.

## 2. Quotas
- Panel de administración de AWS -> Servicie Quotas

## 3. Conexión por escritorio remoto
- Laboratorio -> AWS Details -> Download PEM file
- Instancia -> Estado de la instancia -> Seguridad -> Obtener la constraseña de Windows -> Cargar el archivo PEM
<br><br><br>

## *[volver al índice](../index.md)*