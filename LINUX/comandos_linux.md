# Comandos de LINUX
## 1. El Shell
Es el intérprete de comandos: actúa como interfaz entre el usuario y el sistema.
- **Permite:**
  - Utilizar abreviaturas de nombres de ficheros.  
  - Expandir y modificar los comandos.  
  - Redireccionar la E/S.  
  - Encadenar varios comandos.

Proporciona un lenguaje de programación: shell scripts.
- **Tipos:**
  - Bourne Shell(sh).  
  - Bourne Again Shell(bash).  
  - Korn Shell(ksh).  
  - C Shell(csh)
<br><br>

## 2. Línea de comandos
Un comando es un archivo ejecutable del sistema.
Se distinguen mayúsculas de minúsculas.
- **Opciones:**
  - Van precedidas de guión.  
  - Pueden agruparse precedidas de un guión simple.  
  - Si no se agrupan deben separarse mediante un espacio o tabulador.  
  - El orden relativo de las opciones no es significativo.
- **Argumentos:**  
  - Van separados por espacio o tabulador
- **Metacaracteres:**
```bash
*       #cualquier número de caracteres o ninguno
?       #uno y solo un carácter
[ ]     #cualquier carácter encerrado en los corchetes
$       #contenido de una variable
#       #comentario
` `     #ejecución de comandos
" "     #permiten la expansión de $ y de ` `
‘ ‘     #no permiten la expansión de $ y de ` `
;       #secuenciamiento de comandos
&&      #Ejecución condicional and
||      #Ejecución condicional or
(.)     #Agrupamiento de comandos
&       #Ejecución en segundo plano
|       #Tubería
>       #Redireccionamiento de salida
>>      #Redireccionamiento de salida
<       #Redireccionamiento de entrada
2>      #Redireccionamiento de salida de error (sobrescribe)
2>>     #Redireccionamiento anexado de salida de error
```
<br>

## 3. Terminal
- **CNTL+ALT+T**: Abrir una terminal.
- **CNTL+ALT+(F1-F7)**: Abrir TTY1 a la TTY7.
- **chvt n**: Donde n equivale al número de tty.
<br><br>

## 4. Comandos básicos

### A. Directorios
`$ cd [directorio]` Cambia el directorio de trabajo. Sin parámetros, establece como directorio de trabajo el home.

`$ ls [opciones] [fichero]` Muestra el contenido de un directorio.
- **Opciones:**
  - `a`: lista todas las entradas.
  - `c`: ordena por fecha der creación.
  - `F`: ejecutable (*), directorio (/).
  - `i`: muestra el i-node.
  - `l`: listado en formato largo.
  - `m`: separados por comas.
  - `r`: lista en orden alfabético inverso.
  - `R`: listado recursivo.
  - `s`: muestra el tamaño (kb) de cada archivo próximo al solicitado.

`$ mkdir [opciones] directorio` Crea un directorio.
- **Opciones:**
  - `p`: permite crear los directorios padres que falten.

`$ rmdir directorio` Borra un directorio, siempre y cuando esté vacío.
<br><br>

### B. Ficheros
`$ touch [opciones] [fichero]` Crea archivos vacíos. Modifica fechas de acceso / modificación.

`$ cat [opciones] [fichero]` Lee un fichero y muestra su contenido por pantalla. Sin parámetros, lee de la entrada estándar.

`$ tac [opciones] [fichero]` Hace lo mismo que cat, solo que al revés, de atrás para adelante.

`$ cp [opciones] fichero1 fichero2` Copia el contenido de fichero1 en fichero2.
- **Opciones:**
  - `a`: conserva todos los atributos de los archivos.
  - `i`: pide confirmación antes de sobrescribir archivos.
  - `p`: conserva los sellos de propiedad, permisos y fecha.
  - `r` (R): copia recursivamente. Para copiar directorios.
  - `s`: crea enlaces en vez de copiar los ficheros.
  - `u`: únicamente procede a la copia si la fecha del archivo origen es posterior a la del destino.

`$ rm [opciones] fichero` Borra ficheros y directorios.
- **Opciones:**
  - `f`: elimina sin preguntar.
  - `i`: pregunta antes de eliminar un archivo.
  - `r`: indica comportamiento recursivo. Para borrar directorios.
  - `v`: muestra el nombre de cada archivo antes de eliminarlo.

`$ mv [opciones] fichero1 fichero2` Mueve ficheros y directorios dentro del sistema de ficheros. Equivale a renombrar un fichero o directorio.

`$ ln [-opciones] fichero enlace` Crea un nombre adicional (enlace) a un fichero. Por defecto crea un enlace duro.
- **Opciones:**
  - `s`: crea un enlace simbólico. Directorios y ficheros de un filesystem distinto.

`$ file [opciones] fichero` Determina el tipo de un fichero.

`$ stat [opciones] fichero` Muestra la info de un fichero (file, size, inode, links, device, uid, gid, Access, modify, change, birth).
- **Opciones:**
  - `f`: muestra info del sistema de archivos (file system).
<br><br>

### C. Filtros
`$ head [opciones] [fichero]` Muestra las 10 primeras líneas de cada fichero en la salida estándar.
- **Opciones:**
  - `c TAMAÑO`: muestra los primeros TAMAÑO bytes.
  - `n N`: muestra las N primeras líneas.

`$ tail [opciones] [fichero]` Muestra las últimas 10 líneas de cada fichero en la salida estándar.
- **Opciones:**
  - `c N`: muestra los últimos N bytes.
  - `f`: muestra la cola a medida que el fichero crece.
  - `n N`: muestra las últimas N líneas en lugar de 10 (Si el primer carácter de N es un `+`, muestra el elemento N-ésimo contando desde el principio de cada fichero).

`$ more/less [opciones] [fichero]` Muestra un fichero de forma paginada.

`$ sort [opciones] [fichero]` Muestra la concatenación ordenada de todos los ficheros en la salida estándar.
- **Opciones de ordenación:**
  - `b`: descarta los espacios en blanco al principio.
  - `f`: no distingue mayúsculas y minúsculas.
  - `g, n`: compara de acuerdo con el valor numérico.
  - `r`: invierte el resultado de las comparaciones.
  - `o FICHERO`: escribe el resultado en FICHERO, en lugar de la salida estándar.
  - `t SEPARADOR`: usa SEPARADOR (, ; / - ... ) en lugar de espacio para separar los campos.
  - `u`: suprime todas las líneas repetidas y muestra solo una ocurrencia.
  - `k POS1[,POS2]`: Ordena utilizando como clave la columna especificada por *POS1* y si se especifica *POS2*, se usa el rango de *POS1* a *POS2* (El conteo de columnas comienza en 1).
    - **Definición de clave de ordenación (POS):**
      - `F` es el número de campo por el cual ordenar, comenzando desde 1.
      - `C`, opcional, especifica la posición del carácter dentro del campo `F` para comenzar la comparación.
      - `OPCIONES`, permite aplicar opciones adicionales de ordenación específicas para la clave.

`$ uniq [opciones] [ENTRADA [SALIDA]]` Elimina líneas repetidas consecutivas en un texto.
- **Opciones:**
  - `c`: precede a las líneas con el número de ocurrencias.
  - `d`: muestra sólo las líneas duplicadas.
  - `u`: muestra sólo las líneas que son únicas.

`$ nl [opciones] fichero` Numera las líneas de un fichero que no estén en blanco.

`$ tr [opciones] conjunto1 [conjunto2]` Traduce, comprime y borra caracteres de la entrada estándar, escribiendo el resultado en la salida estándar.
- **Opciones:**
  - `c`: opera sobre el complemento (sobre cada carácter que no coincida).
  - `d`: borra caracteres de conjunto1, no traduce.
  - `s`: remplaza cada sucesión de entrada de un carácter repetido del conjunto1 por una sola aparición de dicho carácter.
  - `[:alnum:]`: todas las letras y dígitos
  - `[:alpha:]`: todas las letras
  - `[:blank:]`: espacios en blanco o tabuladores
  - `[:cntrl:]`: caracteres de control
  - `[:digit:]`: todos los dígitos
  - `[:graph:]`: todos los caracteres imprimibles
  - `[:lower:]`: minúsculas
  - `[:print:]`: todos los caracteres imprimibles, incluidos los espacios
  - `[:punct:]`: todos los signos de puntuación
  - `[:space:]`: todos los espacios verticales u horizontales
  - `[:upper:]`: todas las letras mayúsculas
  - `[:xdigit:]`: dígito hexadecimal

`$ cmp [opciones] fichero1 fichero2` Compara dos archivos de cualquier tipo y muestra el resultado en la salida estándar.

`$ diff [opcion] fichero1 fichero2` Muestra las diferencias, línea por línea, entre dos ficheros o dos directorios.

`$ cut [opciones] [fichero]` Extrae las partes seleccionadas de cada fichero en la salida estándar.
- **Opciones:**
  - `c`: muestra solamente los caracteres que ocupan la posición indicada.
  - `d DELIM`: Utiliza DELIM en vez del tabulador para delimitar los campos.
  - `f`: muestra solamente los campos que ocupan la posición indicada.
  - `s`: no muestra las líneas que no contienen delimitadores.

`$ paste [opciones] [fichero]` Escribe secuencialmente en la salida estándar cada línea de los ficheros especificados, separadas por tabuladores.
- **Opciones:**
  - `d DELIM`: usa el carácter indicado en DELIM en lugar de tabulador.
  - `s`: usa un fichero cada vez, en lugar de hacerlo en paralelo.

`$ grep [opciones] patron [fichero]` Busca en los ficheros las líneas que coincidan con el patrón especificado.
- **Opciones:**
  - `c`: muestra la cuenta de las líneas que coinciden con el patrón.
  - `e`: especifica el modelo (patrón).
  - `f FICHERO`: obtiene los patrones de un fichero.
  - `i`: ignora mayúsculas y minúsculas.
  - `l`: muestra los nombres de los archivos que contienen coincidencias.
  - `m NUM`: se detiene después de NUM coincidencias.
  - `n`: muestra el número de línea junto con las líneas de salida.
  - `v`: selecciona las líneas que no coinciden.
  - `w`: busca coincidencias que formen palabras completas.
  - `x`: selecciona líneas que coincidan exactamente.
- El patrón pude construirse mediante:
  - Expresión regular
  - Frase (entre comillas)

`$ wc [-cwl] [fichero]` Cuenta los caracteres, palabras y líneas de un fichero.
<br><br>

### D. Búsqueda de ficheros y directorios
`$ find ruta [opciones]` Busca los ficheros que satisfacen la expresión de búsqueda a partir de los directorios señalados.
- Por defecto, cada expresión va unida por `AND`, explícitamente `-a`. También podemos unir las expresiones por `OR` `-o`.
- Se pueden poner paréntesis `\(………\)`.
- Se pueden realizar ejecuciones para los ficheros que cumplan las condiciones:
  - `$ find ruta [opciones] –exec comando {} \;`
  - `$ find ruta [opciones] –ok comando {} \;` (Pide confirmación).
- **Opciones:**
  - `depth`: profundidad (`maxdepth`: máxima profundidad).
  - `group`: grupo.
  - `links`: número de enlaces.
  - `mtime`:
    - `+n`: archivos modificados hace más de n días.
    - `-n`: archivos modificados hace menos de n días.
  - `name`: nombre.
  - `perm`: permisos.
    - en octal.
    - en símbolo (ugo+-rwx;).
    - `*`: delante indica al menos esos permisos, sin el signo menos los permisos exactos.
  - `size`: tamaño.
    - `c`: byte, `k`: kilobyte.
    - `+`: mayor que, `-`: menor que, sin signo igual al tamaño.
  - `type`: f, d, l, etc.
  - `user`: propietario de los ficheros.

`$ whereis [opciones] fichero` Localiza el archivo binario, el código fuente y la página de manual de un determinado comando.
- **Opciones:**
  - `b`: busca solo binarios.
  - `m`: busca solo manuales.
  - `s`: busca solo código fuente.

`$ locate [opciones] fichero` Localiza el archivo por su nombre en una DB que se actualiza con `updatedb`.
- **Opciones:**
  - `b`: busca solo lo que coincida con el nombre del archivo.
  - `i`: ignora la diferencia entre mayúsculas y minúsculas.
  - `w`: busca la ruta completa del archivo (default).
<br><br>

### E. Expresión regular
Formada por caracteres combinados con operadores.
- **Operadores:**
  - `^`: Principio de línea.
  - `$`: Final de línea.
  - `\<`: Principio de palabra.
  - `\>`: Final de palabra.
  - `.`: Cualquier carácter excepto salto de línea.
  - `[]`: Conjunto de caracteres.
  - `[^]`: Cualquier carácter no contenido.
  - `[-]`: Rango.
  - `*`: Cero o más ocurrencias del elemento que lo precede.
  - `+`: Uno o más ocurrencias del elemento que lo precede.
  - `?`: El elemento precedente es opcional.
  - `()`: Agrupación.
  - `|`: O uno u otro.
  - `{n}`: El elemento precedente se repite n veces.
  - `{n,}`: El elemento precedente se repite al menos n veces.
  - `{n, m}`: El elemento precedente se repite al menos n y no más de m veces.
  - `\`: Escape.
<br><br>

### F. Usuarios
`$ useradd [opciones] usuario` Crea un nuevo usuario o actualiza la información de uno existente.
- **Opciones:**
  - `D`: muestra las opciones por defecto.
  - `d homedir`: Indica el directorio home.
  - `g gid`: Grupo principal del usuario.
  - `G group`: Lista de grupos suplementarios.
  - `k skeldir`: Especifica un directorio skel alternativo.
  - `m`: Crea el directorio home.
  - `u uid`: Identificador para el nuevo usuario.
  - `s shell`: Shell del usuario.

`$ adduser usuario` Idéntico a useradd pero más amigable.

`$ userdel [-r] usuario` Elimina un usuario y opcionalmente su directorio home.

`$ usermod usuario` Modifica la información de un usuario.
- **Opciones:**
  - `g`: modifica el grupo principal.
  - `G`: modifica los grupos secundarios (sobrescribe).
  - `a`: añade grupos secundarios (con -G).
  - `L`: bloquea a un usuario.
  - `U`: desbloquea a un usuario.

`$ passwd [opciones] usuario` Actualiza la contraseña de un usuario.
- **Opciones:**
  - `d`: elimina la contraseña.
  - `e`: fuerza caducidad de la contraseña.
  - `l`: bloquea la cuenta.
  - `u`: desbloquea la cuenta.

`$ su [opciones] [usuario]` Cambia el identificador de usuario y grupo.
- Si no se especifica usuario, se cambia a root.
- Con “-l” o “-“, crea un shell de entrada para el nuevo usuario.

`$ sudo su` Abre una sesión como root.

`$ whoami` Muestra el usuario.

`$ id [opciones] [usuario]` Muestra información del usuario especificado (UserId, GroupId, grupos, etc.).
- **Opciones:**
  - `u`: solo muestra el UserId.
  - `g`: solo muestra el GroupId.
  - `n`: solo muestra el nombre.

`$ who [opciones]` Muestra los usuarios conectados.
- **Opciones:**
  - `b`: tiempo del último inicio del sistema
  - `H`: muestra la línea de encabezados de columnas
  - `r`: muestra el runlevel actual
  - `a`: muestra la info de todas las opciones.

`$ w [opciones]` Muestra información sobre los usuarios conectados.

`$ hostname` Nombre de la máquina.
<br><br>

### G. Grupos
`$ groupadd [opciones] grupo` Crea un nuevo grupo.
- **Opciones:**
  - `-g GID`: asigna el identificador de grupo al nuevo grupo.

`$ groupdel grupo` Elimina un grupo existente.

`$ newgrp grupo` Cambia el identificador del grupo del usuario.

`$ chgrp [opciones] grupo fichero` Cambia el grupo de cada fichero indicado.
<br><br>

### H. Permisos
`$ chown [opciones] propietario:[grupo] fichero` Cambia el dueño y/o grupo de cada fichero.

`$ chmod [opciones] modo[,modo] ficheros` Cambia los permisos del fichero o directorio.
- Modo simbólico:
  - `a, u, g, o`: all, user, group, others.
  - `+,-, =`: añade, quita o establece permisos.
  - `r, w, x`: read, write, execute.
- `-R`: Cambia ficheros y directorios recursivamente.

`$ umask [mascara]` Establece la máscara para los permisos de los ficheros nuevos.
<br><br>

### I. Redirección
- El kernel abre para cada comando tres archivos:
  - **stdin:** entrada estándar: teclado.
  - **stdout:** salida estándar: pantalla.
  - **stderr:** salida de error: pantalla.
- Permite cambiar las E/S estándar.
  - **Redirección de salida:**
    - `$ comando > fichero`
    - `$ comando >> fichero`
  - **Redirección de la salida de errores:**
    - `$ comando 2> fichero`
    - `$ comando 2>> fichero`
  - **Redirección de entrada:**
    - `$ comando < fichero`
  - **Redirección de la salida estándar y de errores:**
    - `$ comando &> fichero`
    - `$ comando &>> fichero`
<br><br>

### J. Tuberías (pipes)
- Conecta la salida estándar de un comando con la entrada estándar de otro.
  - `$ comando1 | comando2`
  - **Bifurcación o T (comando tee):**
    - `$ comando | tee fichero` - La salida de un comando se redirige a un fichero y se bifurca a la terminal. Con `-a` añade la salida al fichero.
<br><br>

### K. Sistema
`$ shutdown [opciones] [+TIEMPO] [mensaje]` Apaga el sistema en modo seguro en un tiempo determinado en minutos y envía un mensaje a los usuarios.
- **Opciones:**
  - `h`: Detiene o pausa el sistema (en algunos sistema es similar a halt y no detiene la fuente de alimentación).
  - `p`: Apaga el sistema incluida la alimentación (en algunos sistema es similar a poweroff y detiene la fuente de alimentación).
  - `r`: reinicia después de shutdown (igual que reboot).
  - `c`: Cancela el comando shutdown.
  - `t SECS`: tiempo en segundos para el apagado.

`$ halt` Para el sistema.

`$ poweroff` Apaga el sistema.

`$ reboot` Reinicia el sistema.

`$ login [USUARIO]` Loguea un usuario.

`$ logout` Sale del shell y devuelve a login.

`$ exit` Sale del shell.
<br><br>

### L. Servicios
`$ systemctl [opciones] [servicio]` Controla el sistema de inicio y los servicios del sistema.
- **Opciones:**
  - `start`: inicia un servicio.
  - `stop`: detiene un servicio.
  - `restart`: reinicia un servicio.
  - `status`: muestra el estado de un servicio.
  - `enable`: habilita un servicio.
  - `disable`: deshabilita un servicio.
  - `is-active`: comprueba si un servicio está activo.
  - `is-enabled`: comprueba si un servicio está habilitado.

### M. Compresión y descompresión de ficheros
`$ gzip | bzip2 [-opciones] fichero` Permite comprimir ficheros de manera individual.
- **Opciones:**
  - `d`: Descomprime el fichero.
  - `k`: Mantiene (no borra) el archivo de entrada al comprimir o descomprimir.
  - `v`: Modo verbose, muestra el progreso y la tasa de compresión.

`$ gunzip | bunzip2 [-opciones] fichero` Permite descomprimir ficheros comprimidos con gzip.
- **Opciones:**
  - `c`: muestra el contenido del fichero comprimido.
  - `f`: fuerza la descompresión.
  - `k`: Mantiene (no borra) el archivo comprimido después de descomprimir.
  - `v`: Modo verbose, muestra el nombre y el porcentaje de descompresión.

`$ tar [-opciones] [fichero]` Guarda varios ficheros juntos en un solo archivo.
- **Opciones:**
  - `c`: crea un nuevo fichero.
  - `x`: extrae archivos de un fichero.
  - `t`: lista el contenido del fichero.
  - `v`: verbose.
  - `z`: comprime o descomprime con gzip.
  - `j`: comprime o descomprime con bzip2.
  - `f`: Especifica el nombre del archivo tar.
<br><br>

### N. Procesos
`$ ps [-opciones]` Muestra el estado de los procesos del sistema.
- **Opciones:**
  - Todos los procesos del sistema con la sintaxis BSD → `$ ps aux`.
  - `e`: Muestra todos los procesos (Idéntica a –A).
  - `a`: Todos los procesos excepto los líderes de sesión y los procesos no asociados a terminal.
  - `N`: Todos los procesos menos los especificados.
  - `u, U`: Selecciona los procesos del EUID o UID indicados.
  - `x`: Muestra los procesos que no están asociados a una terminal.
  - `f`: Muestra en formato largo.
  - `o`: Muestra un formato definido por el usuario:
    - `%cpu`: Porcentaje de uso de la CPU.
    - `%mem`: Porcentaje de uso de la memoria.
    - `cmd`: Comando que ejecuta el proceso.
    - `Cputime`: Tiempo de CPU utilizado.
    - `pid`: Identificador del proceso.
    - `ppid`: Identificador del proceso padre.
    - `s`: Estado del proceso.

`$ kill [-señal] pid` Envía una señal a un proceso.
- **Algunas señales:**
  - `SIGINT` (2): Interrumpir un programa.
  - `SIGKILL` (9): "Matar" un proceso.
  - `SIGSEGV` (11): Señal de violación de segmento.
  - `SIGTERM` (15): Terminar un proceso normalmente.
  - `SIGCHLD` (17): Proceso hijo termina.
  - `SIGTSTOP` (20): Parar un proceso.

`$ nice -n num comando [argumentos]` Modifica la prioridad de un proceso.

`$ renice -n valor -p PID` Modifica la prioridad de un proceso en ejecución.

`$ pstree` Muestra el árbol de procesos.

`$ top (htop)` Muestra los procesos en ejecución con actualizaciones periódicas.
<br><br>

### O. Ejecución en segundo plano
`$ comando &`
-  Permite ejecutar programas de forma concurrente, dejando el shell libre.
  - **Comandos relacionados:**
    - `jobs`: muestra los procesos en segundo plano.
    - `fg %`: pasa a primer plano.
    - `bg %`: pasa a segundo plano.
    - `Ctrl+Z`: paraliza un proceso (SIGTSTOP).
    - `Ctrl+C`: finaliza un proceso (SIGINT).
<br><br>

### P. Miscelánea
`$ echo` Muestra una cadena por pantalla.

`$ history` Muestra los últimos comandos utilizados.
- **Opciones:**
  - `c`: elimina el historial.
  - `!n`: ejecuta el comando n.

`$ pwd` Muestra por pantalla el nombre de camino completo del directorio actual.

`$ cal` Muestra un calendario.

`$ date` Muestra la fecha.

`$ alias [-p] [name=comando]` Crea un seudónimo `name` para un comando.
- Con `-p`, lista todos los alias.

`$ unalias [-a] [name ...]` Elimina los alias `name` indicados.
- Con `-a`, elimina todos los alias.

`$ man [opciones]` Muestra las páginas del manual en línea.
<br><br>

### Q. Sistema de ficheros
`$ du [opciones] [fichero]` Muestra un resumen del uso de disco para cada fichero, recursivamente para directorios.
- **Opciones:**
  - `a`: muestra todos los ficheros
  - `b`: muestra el tamaño en bytes
  - `c`: Muestra en pantalla el espacio total ocupado por los archivos especificados.
  - `h`: muestra los tamaños de forma legible (ej.: 1K 234M 2G)
  - `s`: Muestra únicamente los tamaños de los archivos especificados en la línea de comandos.

`$ df [opciones] [fichero]` Muestra información sobre el sistema de ficheros en el que reside cada fichero, o por omisión sobre todos los sistemas de ficheros.
- **Opciones:**
  - `h`: imprime los tamaños en formato legible (ej.: 1K 234M 2G)
  - `i`: muestra la información de nodos-i en lugar del uso de bloques
  - `f`: Informa sobre el total de bloques que hay en la lista de bloques libres.
  - `l`: limita el listado a los sistemas de ficheros locales
  - `t`: Informa sobre el total de bloques ocupados.
  - `v`: Informa sobre el porcentaje de bloques ocupados, así como del número de bloques usados y libres.
<br><br>

### R. Hardware
`$ uname` Muestra la versión de Linux.
- **Opciones:**
  - `a`: muestra toda la info excepto -p y -i si se desconoce.
  - `s`: muestra el nombre del kernel.
  - `n`: muestra el nombre de red del equipo.
  - `r`: muestra la versión de la publicación de núcleo.
  - `v`: muestra la versión y fecha de compilación del núcleo.
  - `p`: muestra el tipo de procesador.
  - `i`: muestra el tipo de hardware.
  - `o`: muestra el OS.

`$ lsb_release` Muestra info sobre la distribución, la versión de Linux y la versión de LSB.
- **Opciones:**
  - `i`: muestra la id del distribuidor.
  - `d`: muestra una descripción de la distribución.
  - `r`: muestra el número de versión.
  - `c`: muestra el nombre de la versión.

`$ lshw` Muestra una lista completa del hardware del sistema. Se puede ver en diferentes formatos: -html, -xml, -json, -short, -businfo…
<br><br>

### S. Red
`$ ifconfig interface [dirección [opciones]]` Configura la interface de red.
- **Opciones:**
  - `up`: activa la interface.
  - `down`: desactiva la interface.
  - `netmask`: Establece la máscara de red.

`$ ip [opciones] [comando]` Muestra y modifica la configuración de red.
- **opciones:** 
  - `a`: muestra la información de todas las interfaces.
  - `s`: muestra la información de todas las interfaces de forma resumida.
  - `r`: muestra la información de la tabla de enrutamiento.
  - `l`: muestra la información de la tabla de enlaces.
  - `t`: muestra la información de la tabla de túneles.
  - `m`: muestra la información de la tabla de mapeo de direcciones.
  - `n`: muestra la información de la tabla de vecinos.
  - `p`: muestra la información de la tabla de políticas.
  - `x`: muestra la información de la tabla de enrutamiento de políticas.
  - `h`: muestra la ayuda.
  - `v`: muestra la versión.

`$ iwconfig [interface]` Configura la interface de red inalámbrica.

`$ netstat [opciones]` Muestra la información de las conexiones de red, la tabla de encaminamiento y las estadísticas de las interfaces.

`$ netstat` Muestra el estado de las conexiones de red, tabla de encaminamiento y las estadísticas de las interfaces.
- **Opciones:**
  - `r`: tabla de encaminamiento.
  - `s`: estadísticas.
  - `c`: Muestra la información cada segundo.

`$ ping [opciones] destino` Envía indefinidamente paquetes de prueba a destino.

`$ traceroute [opciones] destino` Muestra la ruta que siguen los paquetes a través de la red.

`$ route` Muestra la tabla de rutas, o la modifica.
<br><br>

### T. Variables de entorno del shell
Se utilizan para guardar información del sistema y del usuario.
- **HOME**: Directorio personal.
- **HOSTNAME**: Nombre de la máquina.
- **PATH**: Lista de directorios donde buscar los programas.
- **PS1**: Establece el prompt primario del sistema. Permite modificar el prompt insertando ciertos caracteres especiales:
  - `\a`: carácter de campana.
  - `\d`: la fecha en formato "día mes día".
  - `\h`: el nombre del host hasta el primer `.`.
  - `\t`: la hora actual en formato 24-horas.
  - `\u`: el nombre de usuario del usuario actual.
  - `\w`: el directorio actual de trabajo.
- **SHELL**: Intérprete de comandos por defecto.
- **TERM**: Tipo de terminal.
- **USER**: Nombre del usuario.
<br><br><br>

## *[volver al índice](../index.md)*