# PL (Procedural Language)

## 1.LINKS
- [Tutorial de Oracle](https://www.oracletutorial.com/plsql-tutorial/)
- [Live de Oracle](https://livesql.oracle.com/)
<br>

## 2. ANNONYMOUS BLOCKS
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

## 3.PROCEDURES
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
```
<br>

## 4.FUNCTIONS
```sql
CREATE OR REPLACE FUNCTION nombre_funcion
RETURN NUMBER 
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

    RETURN 1;
END;
```
<br>

## 5.CONDITIONALS
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

## 6.LOOPS
### A.Loop
```sql
LOOP
    -- Código
    EXIT WHEN condicion;
END LOOP;
```

### B.While
```sql
WHILE condicion LOOP
    -- Código
END LOOP;
```

### C.For
```sql
FOR i IN 1..10 LOOP
    -- Código
END LOOP;
```
<br>

## 7.SELECT INTO
```sql
DECLARE
    v_variable1 VARCHAR2(20);
    v_variable2 NUMBER(10,2);

BEGIN
    SELECT columna1, columna2
    INTO v_variable1, v_variable2
    FROM tabla
    WHERE condicion;

    DBMS_OUTPUT.PUT_LINE(v_variable1 || ' ' || v_variable2);
END;
```
