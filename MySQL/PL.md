# PL (Procedural Language)

## 1. LINKS
- [Tutorial de Oracle](https://www.oracletutorial.com/plsql-tutorial/)
- [Live de Oracle](https://livesql.oracle.com/)
<br><br>

## 2. ANNONYMOUS BLOCKS
- Un **bloque anónimo** es un bloque PL/SQL que no tiene nombre y no se almacena en la base de datos. 
- Se utiliza para ejecutar código PL/SQL en tiempo de ejecución. 
- Un bloque anónimo se compone de tres partes principales: declaración de variables, código y excepciones.
```sql
DECLARE
    -- Declaración de variables
    v_variable1 VARCHAR2(20);
    v_variable2 NUMBER(10,2);

BEGIN
    -- Asignación de valores
    v_variable1 := 'Hola';
    v_variable2 := 10.5;

    -- Mostrar valores
    DBMS_OUTPUT.PUT_LINE(v_variable1 || ' ' || v_variable2);
END;
```
<br>

## 3. %TYPE y %ROWTYPE
- **%TYPE** se utiliza para declarar una variable con el mismo tipo de datos que una columna en una tabla.
```sql
DECLARE
    v_nombre_empleado empleados.nombre%TYPE;
BEGIN
    v_nombre_empleado := 'Juan Perez';
    DBMS_OUTPUT.PUT_LINE('Empleado: ' || v_nombre_empleado);
END;
```
- **%ROWTYPE** se utiliza para declarar un registro con la misma estructura que una fila en una tabla.
```sql
DECLARE
    v_empl empleados%ROWTYPE;
BEGIN
    SELECT * INTO v_empl FROM empleados WHERE id = 101;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_empl.id || ', Nombre: ' || v_empl.nombre || ', Salario: ' || v_empl.salario);
END;
```
<br>

## 4. PROCEDURES
Un **procedimiento** es un subprograma que se almacena en la base de datos y se puede llamar en cualquier parte de la aplicación.
```sql
CREATE OR REPLACE PROCEDURE nombre_procedimiento
IS
    -- Declaración de variables
    v_variable1 VARCHAR2(20);
    v_variable2 NUMBER(10,2);

BEGIN
    -- Asignación de valores
    v_variable1 := 'Hola';
    v_variable2 := 10.5;

    -- Mostrar valores
    DBMS_OUTPUT.PUT_LINE(v_variable1 || ' ' || v_variable2);
END;
/

-- Procedimiento para cambiar DBMS_OUTPUT.PUT_LINE
CREATE OR REPLACE PROCEDURE print (p_message IN VARCHAR2)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(p_message);
END;

-- Llamar al procedimiento
BEGIN
    print('Hola Mundo');
END;
```
<br>

## 5. FUNCTIONS
Una **función** es un subprograma que se almacena en la base de datos y se puede llamar en cualquier parte de la aplicación.
La diferencia entre un procedimiento y una función es que una función devuelve un valor, mientras que un procedimiento no.
```sql
CREATE OR REPLACE FUNCTION nombre_funcion
RETURN VARCHAR2 
IS
    -- Declaración de variables
    v_nombre VARCHAR2(20);

BEGIN
    -- Asignación de valores
    v_nombre := 'Hola';    

    RETURN v_nombre;
END;
/
-- Llamar a la función
DECLARE
    v_resultado VARCHAR2(20);
BEGIN
    v_resultado := nombre_funcion;
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
```
<br>

## 6. CONDITIONALS
### A.If
```sql
IF condicion THEN
    -- Código
ELSIF condicion THEN
    -- Código
ELSE
    -- Código
END IF;
```

### B.Case
```sql
CASE variable
    WHEN valor1 THEN
        -- Código
    WHEN valor2 THEN
        -- Código
    ELSE
        -- Código
END CASE;
```
<br>

## 7. LOOPS
### A.Loop
Un bucle LOOP se ejecuta de forma indefinida **HASTA** que se cumple una condición.
```sql
LOOP
    -- Código
    EXIT WHEN condicion;
END LOOP;
```

### B.While
Un bucle WHILE se ejecuta **MIENTRAS** se cumple una condición.
```sql
WHILE condicion LOOP
    -- Código
END LOOP;
```

### C.For
Un bucle FOR se ejecuta un **NÚMERO** ESPECÍFICO de veces.
```sql
FOR i IN 1..10 LOOP
    -- Código
END LOOP;
```
<br>

## 8. SELECT INTO
La instrucción SELECT INTO se utiliza para recuperar datos de una tabla y almacenarlos en variables.
```sql
DECLARE
    v_variable1 VARCHAR2(20);
    v_variable2 NUMBER(10,2);

BEGIN
    SELECT columna1, columna2 INTO v_variable1, v_variable2
    FROM tabla
    WHERE condicion;

    DBMS_OUTPUT.PUT_LINE(v_variable1 || ' ' || v_variable2);
END;
```
<br>

## 9. EXCEPTIONS
Las excepciones se utilizan para manejar errores en PL/SQL:
- **NO_DATA_FOUND**: Cuando una consulta no devuelve ninguna fila.
- **TOO_MANY_ROWS**: Cuando una consulta devuelve más de una fila.
- **OTHERS**: Cuando se produce un error que no está cubierto por otras excepciones.
- **ZERO_DIVIDE**: Cuando se intenta dividir un número por cero.
- **DUP_VAL_ON_INDEX**: Cuando se intenta insertar un valor duplicado en una columna con una restricción de clave única.
- **CURSOR_ALREADY_OPEN**: Cuando se intenta abrir un cursor que ya está abierto.
- **LOGIN_DENIED**: Cuando se intenta iniciar sesión en la base de datos con credenciales incorrectas.
- **NOT_LOGGED_ON**: Cuando se intenta ejecutar una operación que requiere una conexión a la base de datos sin estar conectado.
- **PROGRAM_ERROR**: Cuando se produce un error de programación.
- **STORAGE_ERROR**: Cuando se produce un error de almacenamiento.
- **VALUE_ERROR**: Cuando se produce un error de valor.
- **TIMEOUT_ON_RESOURCE**: Cuando se produce un error de tiempo de espera en un recurso.
```sql
DECLARE
    v_variable VARCHAR2(20);
BEGIN
    SELECT COUNT(*) INTO v_variable
    FROM tabla
    WHERE condicion;

    DBMS_OUTPUT.PUT_LINE(v_variable);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron datos');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Demasiadas filas');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error');
END;
```
<br>

## 10. CURSORS
Un **cursor** es un objeto (puntero) que apunta a un conjunto de resultados devueltos por una consulta SQL.

```sql
/* IMPLICIT CURSOR */
-- No se vea el cursor. Es manejado automáticamente por PL/SQL en sentencias como INSERT, UPDATE, DELETE y SELECT dentro de un FOR LOOP.
DECLARE
    v_empl empleados%ROWTYPE;
BEGIN
    FOR v_empl IN (SELECT * FROM empleados) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_empl.id || ', Nombre: ' || v_empl.nombre || ', Salario: ' || v_empl.salario);
    END LOOP;
END;


/* EXPLICIT CURSOR */
-- Sí se ve el cursor. Se abre, se recorre y se cierra manualmente.
DECLARE
    CURSOR c_empleados IS SELECT * FROM empleados;

    v_empl empleados%ROWTYPE;
BEGIN
    OPEN c_empleados;
    LOOP
        FETCH c_empleados INTO v_empl;
        EXIT WHEN c_empleados%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_empl.id || ', Nombre: ' || v_empl.nombre || ', Salario: ' || v_empl.salario);
    END LOOP;
    CLOSE c_empleados;
END;


/* CURSOR FOR LOOP */
-- De forma simplificada.
DECLARE
    CURSOR c_empleados IS SELECT * FROM empleados;

    v_empl empleados%ROWTYPE;
BEGIN
    FOR v_empl IN c_empleados LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_empl.id || ', Nombre: ' || v_empl.nombre || ', Salario: ' || v_empl.salario);
    END LOOP;
END;


/* PARAMETERIZED CURSOR */
-- Con parámetros.
DECLARE
    CURSOR c_empleados (p_salario NUMBER) IS SELECT * FROM empleados WHERE salario > p_salario;

    v_empl empleados%ROWTYPE;
BEGIN
    FOR v_empl IN c_empleados(1000) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_empl.id || ', Nombre: ' || v_empl.nombre || ', Salario: ' || v_empl.salario);
    END LOOP;
END;


/* REF CURSOR */
-- Se utiliza para devolver un conjunto de resultados de un procedimiento.
CREATE OR REPLACE PROCEDURE get_empleados (p_salario NUMBER, p_empleados OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN p_empleados FOR
    SELECT * FROM empleados WHERE salario > p_salario;
END;
```
<br>

## 11. TRIGGERS
Un **trigger** es un subprograma que se ejecuta automáticamente cuando se produce un evento en una tabla.
- **BEFORE**: Se ejecuta antes de que se realice la acción.
- **AFTER**: Se ejecuta después de que se realice la acción.
- **FOR EACH ROW**: Se ejecuta una vez por cada fila afectada por la acción.
- **FOR EACH STATEMENT**: Se ejecuta una vez por cada acción.
```sql
CREATE OR REPLACE TRIGGER salario_empleado_cambio
AFTER UPDATE OF salario ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_salarios (empleado_id, salario_anterior, salario_nuevo, fecha_cambio)
    VALUES (:OLD.empleado_id, :OLD.salario, :NEW.salario, SYSDATE);
END;

/* Con 2 acciones */
CREATE OR REPLACE TRIGGER salario_empleado_cambio
AFTER INSERT OR UPDATE ON empleados
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO auditoria_salarios (empleado_id, salario_anterior, salario_nuevo, fecha_cambio)
        VALUES (:NEW.empleado_id, NULL, :NEW.salario, SYSDATE);
    ELSIF UPDATING THEN
        INSERT INTO auditoria_salarios (empleado_id, salario_anterior, salario_nuevo, fecha_cambio)
        VALUES (:NEW.empleado_id, :OLD.salario, :NEW.salario, SYSDATE);
    END IF;
END;
```
<br><br><br>

## *[volver al índice](../index.md)*