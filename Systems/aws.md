# AWS

## 1. Instancia EC2 ☁️
- Panel de administración de AWS -> Servicios -> Informátca -> EC2
- Selecionar la región

### 1.1. Crear una instancia 🖥️
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

### 1.2. Monitorear la instancia 📡
```	
- Acciones -> Monitorear y solucionar problemas -> Obtener registro del sistema.
- Acciones -> Monitorear y solucionar problemas -> Obtener captura de pantalla de la instancia.
```
<br>

### 1.3. Cambiar el tipo de la instancia
```
- Detener la instancia
- Acciones -> Configuracón de la instancia -> Cambiar el tipo de instancia.
```
<br>

### 1.4.Habilitar y deshabilitar la protección de terminación
```
- Acciones -> Configuración de la instancia -> Cambiar protección de terminación.
```
<br>

### 1.5. Cambiar el tamaño del volumen EBS 💾
```
- Detener la instancia
- Acciones -> Configuración de la instancia -> Cambiar el tamaño del volumen.
```
---
<br>

## 2. Quotas 📊
```
- Panel de administración de AWS -> Servicie Quotas
```
---
<br>

## 3. Conexión por escritorio remoto 💻
```
- Laboratorio -> AWS Details -> Download PEM file
- Instancia -> Estado de la instancia -> Seguridad -> Obtener la constraseña de Windows -> Cargar el archivo PEM
```
---
<br>

## 4. Desplegar una aplicación web 
### 4.1. VPC (Virtual Private Cloud) 🌐
VPC (Virtual Private Cloud) es un servicio que permite a los usuarios crear una red virtual en la nube de AWS.
```
- Servicios -> VPC -> Crear VPC
    -> Recuros -> VPC y más                # Los recursos de VPC incluyen subredes, tablas de rutas, grupos de seguridad, ACL de red, etc.
    -> Nombre: ProyectoDAW-VPC
    -> Dirección IPv4: 10.0.0.0/16         # Rango de direcciones IPv4 para la VPC
    -> Sin bloque de IPv6
    -> Tenencia: Predeterminado            # Especifica si el hardware es dedicado o compartido.
    -> Número de zonas de disponibilidad: 2
    -> Cantidad de subredes públicas: 2
    -> Cantidad de subredes privadas: 2
    -> Gateway NAT: Crear Ninguno          # Dispositivo que permite a las instancias en una subred privada conectarse a Internet.
    -> Puntos de enlace: Gateway de S3     # Dispositivo que permite a las instancias en una subred privada conectarse a un servicio de AWS.
    -> Habilitar nombres de host DNS
    -> Habilitar DNS resolución de DNS
```

### 4.2. Crear base de datos 🗃️
RDS (Relational Database Service) es un servicio de base de datos relacional que facilita la configuración, operación y escalabilidad de las bases de datos relacionales en la nube de AWS.
```
- Servicios -> RDS -> Crear base de datos
    -> Creación estándar                                  # Puede ser estándar o sencilla.
    -> Motor de base de datos: MySQL
    -> Versión de MySQL: 8.0.35
    -> Plantilla de uso: Capa gratuita                    # Puede ser de producción o de desarrollo.
    -> Nombre de la base de datos: FilmarketDB
    -> Nombre del usuario maestro: root
    -> Administración de credenciales: Autoadministrado   # Puede ser autoadministrado o AWS Secrets Manager.
    -> Contraseña: 12345678
    -> Configuración de la instancia: T3.micro
    -> Tipo de almacenamiento: GP2
    -> Capacidad de almacenamiento: 20 GB
    -> Habilitar el almacenamiento automático
    -> Umbral de almacenamiento máximo: 1000 GB
    -> Recurso de computación: No se conecte a un recurso EC2
    -> VPC: ProyectoDAW-VPC
    -> Acceso público: Sí                                 # Sí, si necesita acceder a la base de datos desde el exterior.
    -> Grupo de seguridad: Elegir existente
    -> Zona de disponibilidad: Sin preferencia
    -> Entidad de certificación: Predeterminado
    -> Puerto de la base de datos: 3306
    -> Autenticación de contraseña: Sí
    -> Crear
```	

### 4.3. Elastic Beanstalk
#### 4.3.1. Crear API
Elastic Beanstalk es un servicio que permite a los desarrolladores implementar y administrar aplicaciones web y servicios en la nube.  
<a href="http://filmarket-env.eba-prz7xmbv.us-east-1.elasticbeanstalk.com/" target="_blank">www.filmarket.com</a>

```
- Servicios -> Elastic Beanstalk -> Crear aplicación
    -> CONFIGURACIÓN DEL ENTORNO
      -> Nivel de entorno: Web
      -> Nombre de la aplicación: Filmarket
      -> Nombre del entorno: Filmarket-env
      -> Plataforma administrada: Java
      -> Ramificación de la plataforma: Corretto 17 running on 64bit Amazon 2023
      -> Versión de la plataforma: 4.2.4
      -> Cargar el código de la aplicación
      -> Etiqueta de la versión: v1.0
      -> SIGUIENTE

    -> CONFIGURACIÓN DEL ACCESO AL SERVICIO
      -> Rol de servicio: Usar un rol de servicio existente
        -> Rol: LabRole
        -> Par de claves: vockey
        -> Perfil de la instancia: LabInstanceProfile
      -> SIGUIENTE
    
    -> CONFIGURACIÓN DE REDES, BASE DE DATOS Y ETIQUETAS
      -> Nube virtual privada (VPC): ProyectoDAW-VPC
      -> Dirección IP pública: Activado
      -> Subredes de instancia: 10.0.0.0/20 y 10.0.16.0/20
      -> Subredes de base de datos: 10.0.0.0/20 y 10.0.16.0/20
      -> SIGUIENTE
    
    -> CONFIGURACIÓN DEL ESCALADO Y DEL TRÁFICO DE LAS INSTANCIAS
      -> SIGUIENTE

    -> CONFIGURACIÓN DE ACTUALIZACIONES, MONITOREO Y REGISTROS
      -> Propiedades del entorno
        -> Agregar propiedad al entorno: SERVER_PORT=5000
        -> URL de la aplicación: http://filmarket-env.eba-prz7xmbv.us-east-1.elasticbeanstalk.com/
      -> SIGUIENTE
    
    -> REVISIÓN
      -> ENVIAR
```

#### 4.3.2. Modificar API
```
- Servicios -> Elastic Beanstalk 
  -> Entorno (en el panel de la izquierda) -> Configuración
    -> Acceso al servicio
    -> Redes y bases de datos
    -> Escalado y tráfico de instancias
    -> Actualizaciones, monitoreo y registro
```
---
<br>

## 5. Subir archivos a nuestra instancia EC2
**SSH address:** EC2 -> Instances -> Connect -> SSH client -> Copy ssh address (ec2-user): ec2-user@ec2-44-218-160-205.compute-1.amazonaws.com  
**PPK file:** Descargar el archivo PPK desde la página del laboratorio de AWS

- Desde Putty:
  - Host Name: ssh address
  - Connection -> SSH -> Auth -> Credentials -> PPK file -> Browse -> Select PPK file
  - Escalamos privilegios: `sudo su`
  - Creamos un directorio fuera de /var/app/current: `mkdir /var/app/uploads/`
  - Modificamos los permisos de la carpeta: `chmod 777 /var/app/uploads/`

- Desde WinSCP:
  - Nombre o IP del servidor: ssh address
  - Avanzado... -> Avanzado -> Autenticación -> SSH -> Autenticación -> Seleccionar archivo PPK -> Aceptar
  - Conectar
  - Arrastrar y soltar los archivos en la carpeta `/var/app/uploads/`
---

<br><br><br>

## *[volver al índice](../README.md)*