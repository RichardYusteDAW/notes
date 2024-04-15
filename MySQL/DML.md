# DML (Data Manipulation Language)

## INSERTAR DATOS EN UNA TABLA
```sql
INSERT INTO nombre_tabla (columna1, columna2, columna3, ...) VALUES (valor1, valor2, valor3, ...);
INSERT INTO nombre_tabla VALUES (valor1, valor2, valor3, ...);
```
<br>

## ACTUALIZAR DATOS EN UNA TABLA
```sql
UPDATE nombre_tabla SET columna1 = valor1, columna2 = valor2, ... WHERE condicion;
```
<br>

## ELIMINAR DATOS EN UNA TABLA
```sql
DELETE FROM nombre_tabla WHERE condicion;
```
<br>

## CONSULTAR DATOS EN UNA TABLA
```sql
SELECT [DISTINCT] columna FROM tabla WHERE condicion GROUP BY columna [ASC | DESC] [WITH ROLLUP] HAVING condicion_groupBy ORDER BY columna [ASC | DESC] LIMIT n_filas
IN (lista o condicion WHERE)
LIKE columna "exp_reg" --> ("%") cualquier cantidad de caracteres; ("_") un solo carácter
```
<br><br>

## FUNCIONES:
### Funciones de agregación:
```sql
COUNT()  SUM()  AVG()  MAX()  MIN()
```

### Funciones de String:
```sql
LENGTH("str")  SUBSTRING("str", pos, len)  LOWER("str")  UPPER("str")  REPLACE("str", "from_str", "to_str")  CONCAT ("str1", "str2", "...")	
```

### Funciones Numéricas:
```sql
ABS(x)  ROUND(x, d)  CEILING(x)  FLOOR(x)  RAND()
```

### Funciones de Fecha y Hora:
```sql
NOW()  CURDATE()  CURTIME()  DATE_ADD(date, INTERVAL expr unit)  DATEDIFF(expr1, expr2)
```

### Funciones de Control de Flujo:
```sql
IF(expr1, expr2, expr3)	CASE
```

### Funciones de Información de la Base de Datos:
```sql
DATABASE()  USER()
```

### Funciones de Conversión:
```sql
CAST(expr AS type)  CONVERT(expr, type)
```
<br>

## TRANSACCIONES:
### Definición:
Una transacción es un conjunto de operaciones que se ejecutan como una sola unidad de trabajo. 

### Propiedades ACID:
Todas las transacciones deben cumplir con las 4 propiedades ACID:
- **Atomicidad:** Todas las operaciones de la transacción se realizan o ninguna se realiza.
- **Consistencia:** La transacción lleva la base de datos de un estado consistente a otro estado consistente.
- **Aislamiento:** Las operaciones de una transacción no interfieren con las de otra transacción.
- **Durabilidad:** Una vez que una transacción se ha completado, los cambios que ha realizado se mantienen incluso si se produce un fallo.

### AutoCommit:
Por defecto, MySQL trabaja en modo autocommit, lo que significa que cada sentencia SQL se ejecuta como una transacción independiente. 
```sql
SELECT @@AUTOCOMMIT;  -- Verificar el estado del modo autocommit.
SET autocommit = 0;   -- Desactivar el modo autocommit.
```

### Start Transaction, Commit y Rollback:
```sql
START TRANSACTION;    -- Iniciar una transacción (También puede iniciar con BEGIN).
INSERT INTO cliente VALUES (1, 'Pepe', 'Gomez');
COMMIT;               -- Confirmar la transacción.

ROLLBACK;             -- Deshacer la transacción hasta el último COMMIT.
```

### Savepoint, Rollback to Savepoint y Release Savepoint:
```sql
SAVEPOINT sp;         -- Crear un punto de guardado.
INSERT INTO cliente VALUES (2, 'Juan', 'Perez');
ROLLBACK TO sp;       -- Deshacer la transacción hasta el punto de guardado.

RELEASE SAVEPOINT sp; -- Eliminar el punto de guardado.
```

### Acceso concurrente a los datos:
- `Dirty Read`: Una transacción lee datos que han sido modificados por otra transacción que aún no ha sido confirmada.
- `Non-Repeatable Read`: Una transacción lee los mismos datos más de una vez y encuentra diferentes valores cada vez, porque otra transacción ha modificado y confirmado esos datos entre las dos lecturas.
- `Phantom Read`:  Re-ejecuta una consulta que involucra un rango de filas y descubre que otras filas han sido insertadas o eliminadas por otra transacción, alterando el resultado de la consulta entre ejecuciones.


### Niveles de Aislamiento:
- `READ UNCOMMITTED:` Permite Dirty Read.
- `READ COMMITTED:` No permite Dirty Read, pero permite Non-Repeatable Read.
- `REPEATABLE READ:` No permite Dirty Read ni Non-Repeatable Read, pero permite Phantom Read.
- `SERIALIZABLE:` No permite Dirty Read, Non-Repeatable Read ni Phantom Read.
```sql
SELECT @@GLOBAL.transaction_isolation;  -- Verificar el nivel de aislamiento global.
SELECT @@SESSION.transaction_isolation; -- Verificar el nivel de aislamiento de la sesión.

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;  -- Cambiar el nivel de aislamiento de la sesión a read uncommitted.
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;    -- Cambiar el nivel de aislamiento de la sesión a read committed.
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;   -- Cambiar el nivel de aislamiento de la sesión a repeatable read.
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;      -- Cambiar el nivel de aislamiento de la sesión a serializable.
```
#### Ejemplos:
``` sql
### EVITAR DIRTY READ:
/*Sistema Bancario*/ Un usuario consulta el saldo disponible mientras otro está transfiriendo dinero a esa cuenta.
/*Sistema de Reservas*/ Un cliente consulta la disponibilidad de una habitación mientras otro está cancelando una reserva no confirmada aún.
/*Sistema de Comercio Electrónico*/ Un comprador ve un producto disponible mientras otro comprador está en proceso de compra no finalizada.

### EVITAR NON-REPEATABLE READ:
/*Informes Financieros*/ Un analista genera un informe financiero y lee transacciones que cambian durante el proceso debido a actualizaciones.
/*Gestión de Inventarios*/ Un gestor verifica el stock de un artículo, y al revisar de nuevo, la cantidad ha cambiado por ventas recientes.
/*Sistema de Control de Accesos*/ Un administrador consulta y modifica niveles de acceso mientras otro administrador está haciendo cambios simultáneos.

####. EVITAR PHANTOM READ:
/*Planificación de Recursos*/ Un planificador determina necesidades de recursos para un proyecto y durante la consulta se añaden nuevas tareas.
/*Análisis de Tendencias de Venta*/ Un analista de ventas analiza tendencias y durante su consulta se insertan nuevas ventas.
/*Sistema de Registro Académico*/ n administrador académico evalúa el número de estudiantes inscritos para decidir sobre nuevas secciones, mientras otros administradores inscriben más estudiantes.
```
<br><br><br>

## *[volver al índice](../index.md)*