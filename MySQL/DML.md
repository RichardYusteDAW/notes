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
<br><br><br>

## *[volver al índice](../index.md)*