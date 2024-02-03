# DDL (Data Definition Language)

## Crear nuevas tablas o bases de datos:
```sql 
CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] nombre_base_datos CHARACTER SET utf8 COLLATE utf8_general_ci`;
```
|                        |                                                                                   |
|------------------------|-----------------------------------------------------------------------------------|
| **CHARACTER SET**      | Especifica el set de caracteres que vamos a utilizar en la base de datos.         |
| **SHOW CHARACTER SET** | Muestra las opciones (utf8, utf8mb4, utf16, utf32...).                            |
| **COLLATE**            | Indica el criterio que vamos a seguir para ordenar las cadenas de caracteres.     |
| **SHOW COLLATE**       | Muestra las opciones (case-sensitive(_cs), case-insensitive(_ci), binary(_bin)).  |

<br><br>

```sql
CREATE [TEMPORARY] TABLE [IF NOT EXISTS] tabla (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    dni char(9) UNIQUE,
    altura DECIMAL(3,2) NOT NULL CHECK (altura > 100),
    sexo ENUM('H', 'M') NOT NULL DEFAULT 'M',
    FOREIGN KEY (nombre) REFERENCES otra_tabla(nombre)
);
```
|                           |                                                                                                          						   |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| **NOT NULL o NULL**       | Indica si la columna permite almacenar valores nulos o no.                        					   						   |
| **DEFAULT**               | Permite indicar un valor inicial por defecto si no especificamos ninguno en la inserción.                						   |
| **AUTO_INCREMENT**        | Sirve para indicar que es una columna autonumérica. Su valor se incrementa automáticamente en cada inserción de una fila. Sólo se utiliza en campos de tipo entero.     |
| **UNIQUE**    	        | Indica que el valor de la columna es único y no pueden aparecer dos valores iguales en la misma columna. 						   |
| **PRIMARY KEY**  	        | Para indicar que una columna o varias son clave primaria. 											   						   |
| **CHECK**     	        | Nos permite realizar restricciones sobre una columna. A partir de MySQL 8.0.     						   						   |
| **ON DELETE y ON UPDATE** | Nos permiten indicar el efecto que provoca el borrado o la actualización de los datos que están referenciados por claves ajenas. |
	
```
ON DELETE y ON UPDATE
	RESTRICT	--Impide que se puedan actualizar o eliminar las filas que tienen valores referenciados por claves ajenas. Es la opción por defecto en MySQL.
	CASCADE 	--Permite actualizar o eliminar las filas que tienen valores referenciados por claves ajenas.
	SET NULL 	--Asigna el valor NULL a las filas que tienen valores referenciados por claves ajenas.
	NO ACTION	--Es una palabra clave del estándar SQL. En MySQL es equivalente a RESTRICT.
```
<br>

## Eliminar tablas y bases de datos:
```sql
DROP {DATABASE | SCHEMA} [IF EXISTS] nombre_base_datos;
```
<br>

## Modificar la estructura de las tablas existentes:
```sql
ALTER DATABASE nombre_base_datos CHARACTER SET utf8;

ALTER TABLE nombre_tabla RENAME TO nuevo_nombre;

ALTER TABLE nombre_tabla RENAME COLUMN nombre_actual TO nuevo_nombre;
ALTER TABLE nombre_tabla ADD nombre_columna tipo_de_dato; --ADD COLUMN es lo mismo.
ALTER TABLE nombre_tabla MODIFY COLUMN nombre_columna tipo_de_dato;
ALTER TABLE nombre_tabla DROP COLUMN nombre_columna;

ALTER TABLE nombre_tabla ADD PRIMARY KEY (pk);
ALTER TABLE nombre_tabla DROP PRIMARY KEY;
ALTER TABLE nombre_tabla ADD FOREIGN KEY (fk) REFERENCES otra_tabla(fk);
ALTER TABLE nombre_tabla DROP FOREIGN KEY fk;

ALTER TABLE nombre_tabla ADD INDEX nombre_indice (columna_indexada);
ALTER TABLE nombre_tabla DROP INDEX nombre_indice;
```
<br>

## Eliminar contenido de una tabla sin eliminar la tabla:
```sql
TRUNCATE TABLE nombre_de_la_tabla;
```
<br>

## Otros:
```sql
USE	nombre_base_datos				--Seleccionar la base de datos.
SHOW {DATABASES | SCHEMAS}			--Muestra todas las bases de datos en el servidor.
SHOW TABLES							--Muestra todas las tablas en la base de datos actual.
SHOW TABLES FROM nombre_base_datos	--Muestra todas las tablas en una base de datos específica.
SHOW COLUMNS FROM nombre_tabla		--Muestra información sobre las columnas de una tabla específica.
```
<br>

## Tipos de datos
```sql
TINYINT 			(-128, 127)
TINYINT UNSIGNED 	(0, 255)
SMALLINT 			(-32768, 32767)
SMALLINT UNSIGNED 	(0, 65535)
MEDIUMINT 			(-8388608, 8388607)
MEDIUMINT UNSIGNED 	(0, 16777215)
INT 				(-2147483648, 2147483647)
INT UNSIGNED 		(0, 4294967295)
INTEGER 			(-2147483648, 2147483647)
INTEGER UNSIGNED 	(0, 4294967295)
BIGINT 				(-9223372036854775808, 9223372036854775807)
BIGINT UNSIGNED 	(0, 18446744073709551615)

ZEROFILL			--Rellena con ceros a la izquierda hasta completar la longitud definida.

BIT(M) 				valor de 1 a 64
BOOL, BOOLEAN 		0 es FALSE, el resto TRUE
SERIAL 				Alias de BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE


FLOAT(M,D)  			±1.175494351E-38 ±3.402823466E+38
FLOAT(M,D)UNSIGNED  	1.175494351E-38 3.402823466E+38
DOUBLE(M,D)  			±1.7976931348623157E+308 ±2.2250738585072014E-308
DOUBLE(M,D)UNSIGNED 	1.7976931348623157E+308 2.2250738585072014E-308
DECIMAL(M,D) 			M + 2 bytes si D > 0
DECIMAL(M,D)UNSIGNED 	M + 1 bytes si D = 0
NUMERIC(M,D) 			M + 2 bytes si D > 0
NUMERIC(M,D)UNSIGNED 	M + 1 bytes si D = 0


DATE 		YYYY-MM-DD
DATETIME 	YYYY-MM-DD HH:MM:SS
TIMESTAMP 	1970-01-01 00:00:00
TIME 		HH:MM:SS
YEAR[(2|4)] YY o YYYY

CHAR(M) 	--Cadena de longitud fija, máximo 255 caracteres.
VARCHAR(M) 	--Cadena de longitud variable, máximo 65535 caracteres.
TEXT[(M)] 	--Texto largo, hasta 65,536 caracteres.
MEDIUMTEXT 	--Texto más largo, hasta 16 MB.
LONGTEXT 	--Texto muy largo, hasta 4 GB.

BINARY 		--Datos binarios de longitud fija, máximo 255 bytes.
VARBINARY 	--Datos binarios de longitud variable, máximo 65535 bytes.
BLOB 		--Objeto binario grande, hasta 65,536 bytes.
MEDIUMBLOB 	--Objeto binario más grande, hasta 16 MB.
LONGBLOB 	--Objeto binario muy grande, hasta 4 GB.


ENUM('valor1', 'valor2', ...) 	--Puede tener 65535 valores. Sólo permite seleccionar un valor de la lista.
SET('valor1', 'valor2', ...) 	--Puede tener 64 valores. Permite seleccionar varios valores de la lista.
```
<br><br><br>

## *[volver al índice](../index.md)*