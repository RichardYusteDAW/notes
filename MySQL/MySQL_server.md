# MySQL Server

## 1. Archivos de configuración
- En Windows: `C:\ProgramData\MySQL\MySQL Server 8.0\my.ini`
- En Linux: `/etc/mysql/my.cnf`

### A. Secciones
- `[mysqld]`: Configuración del servidor
- `[mysql]`: Configuración del cliente

### B. Directivas mysqld
- `skip-networking`: Deshabilita el acceso remoto.
- `enable-named-pipe`: Habilita el acceso a través de tuberías con nombre.
- `shared-memory`: Habilita el acceso a través de memoria compartida.

- `socket=MYSQL`: Nombre del archivo de socket.
- `port=3306`: Puerto de escucha.

- `basedir`: Directorio de instalación de MySQL.
- `datadir`: Directorio de datos.

- `skip_name_resolve`: Deshabilita la resolución de nombres de host.
- `bind-address`: Dirección IP a la que el servidor MySQL está escuchando.

- `log_error`: Ruta del archivo de registro de errores.

### C. Parámetros generales
Para crear una tabla en Markdown (md) con los comandos y sus descripciones breves, te presento la siguiente tabla que incluye el comando a la izquierda y su descripción breve a la derecha:

Entiendo, realizaré los ajustes necesarios para incluir los valores o rangos usuales recomendados en la última columna, sin modificar los valores específicos que proporcionaste inicialmente. Aquí tienes la tabla corregida:

| Comando                          | Descripción                                                                                                | Valores/Rangos recomendados |
|----------------------------------|------------------------------------------------------------------------------------------------------------|-----------------------------|
| **query_cache_type=0**           | Habilita(0) o deshabilita(1) el caché de consultas. Se puede activar bajo petición(2)                      | 0, 1, 2                     |
| **max_allowed_packet=4M**        | Establece el tamaño máximo de los paquetes de datos que se pueden enviar a través de la red.               | 1M - 64M                    |
| **query_cache_size=64M**         | Asigna memoria para el almacenamiento en caché de los resultados de las consultas.                         | 64M - 1Gb                   |
| **key_buffer_size=32M**          | Reserva memoria para el caché de índices, mejorando el rendimiento de las búsquedas por índice.            | 32M - 1G                    |
| **table_cache=64**               | Define el número de tablas que el sistema puede mantener abiertas al mismo tiempo.                         | 400 - 2000                  |
| **sort_buffer_size=1M**          | Determina el tamaño del buffer utilizado para operaciones de ordenación (`ORDER BY`, `GROUP BY`).          | 1M x cada 1G RAM            |
| **read_buffer_size=1M**          | Establece el tamaño del buffer para lecturas secuenciales de tablas.                                       | 1M x cada 1G RAM            |
| **read_rnd_buffer_size=1M**      | Asigna para el buffer de lecturas aleatorias, utilizado tras una búsqueda u ordenado.                      | 1M x cada 1G RAM            |
| **join_buffer_size=1M**          | Fija el tamaño del buffer utilizado para joins sin índices.                                                | 1M x cada 1G RAM            |
| **thread_cache_size=48**         | Establece el rango del número de subprocesos en caché para clientes desconectados.                         | 32 - 64                     |
| **tmp_table_size=7M**            | Limita el tamaño máximo de las tablas temporales.                                                          | 16M - 32M                   |
| **max_connections=151**          | Permite un máximo de conexiones simultáneas a la base de datos.                                            | 100 - 1000                  |
| **wait_timeout=300**             | Cierra las conexiones inactivas tras un tiempo de espera.                                                  | 28800 segundos (8 horas)    |
| **thread_concurrency=16**        | Recomienda configurar el número de hilos a doble del número de CPUs para sistemas que soporten multihilos. | 2 x nº de CPUs              |
| **query_cache_limit=1M**         | Limita el tamaño máximo de cada resultado de consulta almacenado en el caché.                              | 1M - 4M                     |
| **innodb_buffer_pool_size=1.6G** | Asigna un porcentaje de la memoria disponible al pool de buffer de InnoDB, crucial para el rendimiento.    | 70% - 80% de la RAM         |
<br>


## 2. 2ª instancia de MySQL
### A. Motivos
Porque queremos:
- Usar un servidor para desarrollo y otro para producción.
- Añadir una capa de seguridad adicional utilizando un servidor de respaldo.
- Tener una copia de seguridad.

### B. Creación
- Duplicar el archivo de configuración:
    - **Windows**: `C:\ProgramData\MySQL\MySQL Server 8.0\my.ini` -> `C:\ProgramData\MySQL\MySQL Server 8.0\my_2.ini`
    - **Linux**: `/etc/mysql/my.cnf` -> `/etc/mysql/my_2.cnf`

- Modificar los puertos (en cliente y servidor) y los sockets:
    - **Windows**: `port=3307` y `socket=MYSQL_2`
    - **Linux**: `port=3307` y `socket=/var/run/mysqld/mysqld_2.sock`

- Guardar el archivo en ANSI (Windows) o UTF-8 (Linux).

### C. Instalación
- **Windows**: `mysqld --install MySQL_2 --defaults-file="C:\ProgramData\MySQL\MySQL Server 8.0\my_2.ini"`
- **Linux**: `sudo cp /etc/init.d/mysql /etc/init.d/mysql_2`


### D. Arranque y parada
- **Windows**: `net start MySQL_2` y `net stop MySQL_2`
- **Linux**: `sudo service mysql_2 start` y `sudo service mysql_2 stop`

### E. Eliminación
- **Windows**: `mysqld --remove MySQL_2`
- **Linux**: `sudo rm /etc/init.d/mysql_2`
<br><br><br>

## *[volver al índice](../index.md)*