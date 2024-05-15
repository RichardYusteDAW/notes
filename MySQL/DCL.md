# DCL (Data Control Language)

## 1. PERMISOS.
### A. Niveles de seguridad:
#### I. Permisos globales.
```sql
user@'localhost'     --Acceso local.
admin@'localhost'    --Acceso local.
user@'%'             --Acceso remoto desde cualquier IP.
admin@'%'            --Acceso remoto desde cualquier IP.
user@'192.168.0.10'  --Acceso remoto desde una IP específica.
admin@'192.168.0.10' --Acceso remoto desde una IP específica.
```
#### II. Permisos locales (base de datos).
```sql
/* Concesión y revocación de permisos. */
GRANT select, insert, delete, update ON 'database.table' TO 'usuario@localhost' --WITH GRANT OPTION permite que el usuario pueda conceder permisos a otros usuarios.

/* Revocar permisos. */
REVOKE select, insert, delete, update ON 'database.table' FROM 'usuario@localhost'
```
#### III. Permisos de 3º nivel (Tablas y columnas).
```sql	
/* Concesión y revocación de permisos. */
GRANT select (nombre, apellido) ON 'database.table' TO 'usuario@localhost' WITH GRANT OPTION

/* Revocar permisos. */
REVOKE select (nombre, apellido) ON 'database.table' FROM 'usuario@localhost'
```
<br>

### B. Tipos de permisos.
ALTER, CREATE, DELETE, DROP, GRANT OPTION, INDEX, INSERT, REFERENCES, SELECT, SHOW, TRIGGER, y UPDATE.  
<br>

### C. Actualizar permisos.
```sql
FLUSH PRIVILEGES;
```
<br><br>

## 2. USUARIOS.
### A. Crear usuarios.
```sql
CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'contraseña' PASSWORD EXPIRE ACCOUNT LOCK WITH MAX_QUERIES_PER_HOUR 100;
```

Caducidad de contraseña:
- **PASSWORD EXPIRE:** La contraseña caduca.
- **PASSWORD EXPIRE NEVER:** La contraseña no caduca nunca.
- **PASSWORD EXPIRE INTERVAL N DAY:** La contraseña caduca en N días.
- **PASSWORD EXPIRE INTERVAL DEFAULT:** La contraseña caduca en el número de días que indica la variable del sistema **default_password_lifetime** que es de 360 días en las versiones de MYSQL inferiores a la 5.7.11 y no caduca a partir de esta versión.

Bloqueo de cuenta:
- **ACCOUNT LOCK:** Bloquea la cuenta.
- **ACCOUNT UNLOCK:** Desbloquea la cuenta.

Límite de recursos:
- **WITH MAX_QUERIES_PER_HOUR N:** Número máximo de consultas por hora.
- **WITH MAX_UPDATES_PER_HOUR N:** Número máximo de actualizaciones por hora.
- **WITH MAX_CONNECTIONS_PER_HOUR N:** Número máximo de conexiones por hora.
- **WITH MAX_USER_CONNECTIONS N:** Número máximo de conexiones simultáneas.
<br>

### B. Eliminar usuarios.
```sql
DROP USER 'usuario'@'localhost';
```

### C. Modificar usuarios.
```sql
ALTER USER IF EXISTS 'usuario@localhost' ACCOUNT LOCK;                        --Bloquear cuenta.
ALTER USER IF EXISTS 'usuario@localhost' IDENTIFIED BY 'nueva_contraseña';    --Cambiar contraseña.

RENAME USER 'nombre_usuario@localhost' TO 'nuevo_usuario@localhost'; --Cambiar nombre de usuario.
```
<br>

## 3. ROLES.
### A. Crear roles.
```sql
CREATE ROLE 'rol';
```

### B. Gestionar roles.
```sql
GRANT SELECT, INSERT, UPDATE, DELETE ON 'database.table' TO 'rol';
FLUSH PRIVILEGES;
```

### C. Eliminar roles.
```sql
DROP ROLE 'rol';
```

### D. Asignar roles.
```sql
GRANT 'rol' TO 'usuario@localhost';
```

### E. Revocar roles.
```sql
REVOKE 'rol' FROM 'usuario@localhost';
```
<br><br>

## *[volver al índice](../index.md)*