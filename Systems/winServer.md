# Windows Server

## 1. Active Directory
### 1.1. Estructura🌲
```java	
/FOREST  -- -- -- -- -- -- -- -- -- -- -- -- --  // Nivel más alto de la estructura de AD.
|
└─ /TREE -- -- -- -- -- -- -- -- -- -- -- -- --  // Colección de uno o más dominios.
    |
    └─ /DOMAIN -- -- -- -- -- -- -- -- -- -- --  // Grupo administrativo de recursos.
        |
        └─ /OU (Organizational Unit)   -- -- --  // Unidad organizativa dentro del dominio.
            |
            └─ /OBJECTS -- -- -- -- -- -- -- --  // Objetos dentro de una OU.
                |
                └─ /User   -- -- -- -- -- -- --  // Cuenta de usuario.
                └─ /Group  -- -- -- -- -- -- --  // Grupo de usuarios.
                └─ /Computer  -- -- -- -- -- --  // Cuenta de computadora.
                └─ /Printer   -- -- -- -- -- --  // Objeto de impresora.
                └─ /Shared Folder   -- -- -- --  // Carpeta compartida.
```
<br>

### 1.2. Install 🛠️
- Dashboard -> Add roles and features 
    -> Instlalation type (Role-based or feature-based installation)
    -> Server selection (Select a server from the server pool)
    -> Server roles (Active Directory Domain Services and DNS Server)
    -> Features (Default)
    -> Active Directory Domain Services (Add features)
    -> Install

- Promote this server to a domain controller
    -> Add a new forest
    -> Root domain name
    -> Set the DSRM password
    -> Install
<br><br>

### 1.3. Create Users, Groups and Organizational Units 👫👬👭
- OU: Tools -> Active Directory Users and Computers
        -> Select Domain -> Right click -> New -> Organizational Unit

- Group: Tools -> Active Directory Users and Computers
        -> Select Domain -> Select OU -> Right click -> New -> Group

- User: Tools -> Active Directory Users and Computers
        -> Select Domain -> Select Group/OU -> Right click -> New -> User

***Una PLANTILLA DE USUARIO es un objeto de usuario que se utiliza para crear nuevos usuarios con una configuración predeterminada.
Se crea un usuario con la configuración deseada y se convierte en plantilla.*
<br><br>

### 1.4. Profiles 👤
**Directorio de perfiles:** `C:\Profiles$`
- 1. Crear el directorio .
- 2. Compartir la carpeta con permisos de lectura y escritura para los usuarios.
- 3. Añadir el signo $ al final del nombre de la carpeta si queremos ocultarla.

**Perfiles móviles:**
- Esta opción permite a los usuarios acceder a su perfil en cualquier equipo de la red:   
```
Tools -> Active Directory Users and Computers
      -> Select User -> Right click -> Properties -> Profile -> Profile path -> `\\server\Profiles$\%username%`
```
**Perfiles obligatorios:**
Esta opción se utiliza para que todos los usuarios tengan el mismo perfil (Si el usuario modifica el perfil, los cambios se perderán al cerrar la sesión).
- 1. Crear el archivo `obligatorio.V2` en el directorio de perfiles.
- 2. Compartir la carpeta con permisos de lectura y escritura para los usuarios.
- 3. Añadir el signo $ al final del nombre de la carpeta si queremos ocultarla.
- 4. Copiar perfil por defecto en en perfil obligatorio:  
```
My Computer -> Right click -> Properties -> Advanced system settings
            -> User Profiles -> Settings -> Select Default profile -> Copy to -> `\\server\Profiles$\obligatorio.V2` 
```
- 5. Eliminamos los permisos de lectura y modificación para que los usuarios no puedan modificarlo:
```
Select obligatorio.V2 -> Right click -> Properties -> Security -> Edit -> Remove read and modify permissions
```
- 6. Asignamos el perfil obligatorio al usuario:
```
Tools -> Active Directory Users and Computers
      -> Select User -> Right click -> Properties -> Profile -> Profile path -> `\\server\Profiles$\obligatorio.V2`  
```
- 7. Modificamos la extension del archivo `netuser`
```
netuser.dat -> netuser.man

# Si no vemos las extensiones de los archivos dentro del perfil obligatorio:
View -> Uncheck "Hide extensions for known file types"
```
<br>

### 1.5. GPO (Group Policy Object) 📜
#### 1.5.1. Crear una GPO:
```
Tools -> Group Policy Management
      -> Forest -> Domains -> Select Domain -> Group Policy Objects -> Right click -> New

# Crear la GPO para un grupo de usuarios (evitamos tener que asignar la GPO a posteriori):
Tools -> Active Directory Users and Computers
      -> Select OU -> Right click -> Create a GPO in this domain, and Link it here
```

#### 1.5.2. Asignar una GPO:
```
Tools -> Active Directory Users and Computers
      -> Select OU -> Right click -> Link an existing GPO
```

#### 1.5.3. Editar una GPO:
```
Tools -> Group Policy Management
      -> Forest -> Domains -> Select Domain -> Group Policy Objects -> Select GPO -> Edit
```

#### 1.5.4. GPO Examples:
- 1. Crear una carpeta compartida en el servidor.
- 2. Compartir la carpeta con permisos de lectura y escritura para los usuarios.
- 3. Crear la GPO, asignar la GPO a un grupo de usuarios y editar la GPO.

##### - Crear una unidad de red 🌐
```
User Configuration -> Preferences -> Windows Settings -> Drive Maps -> New -> Mapped Drive:
- Location: `\\server\shared_folder`
- Drive letter: `Z:`
```
##### - Contraseña (History, Age, Length, Complexity) 🔒
```
Computer Configuration -> Policies -> Windows Settings -> Security Settings
                       -> Account Policies -> Password Policy
```
##### - Bloquear cuentas de usuario (Duración, Umbral, Reset) 🚫
```
 Account Lockout Policy -> Account lockout duration: 30
                        -> Account lockout threshold: 3
                        -> Reset account lockout counter after: 30
```
<br>

### 1.6. Añadir un cliente al dominio 🖥️
- 1. Configurar la IP y DNS del cliente (debe apuntar al servidor).
- 2. Añadir el cliente al dominio:
```
My Computer -> Right click -> Properties -> Advanced system settings
            -> Computer Name -> Change -> Domain
```
<br><br><br>

## *[volver al índice](../README.md)*