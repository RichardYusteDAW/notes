# Annotations
Las anotaciones en Java son metadatos que se pueden agregar a clases, métodos, variables, parámetros y paquetes.  
Permiten agrupar otras anotaciones.

## 1. Anotaciones predefinidas
- `@Deprecated`: Indica que un método está obsoleto y no debería usarse.
- `@FunctionalInterface`: Indica que una interfaz es funcional.
- `@Override`: Indica que un método sobrescribe un método de la superclase.
- `@SafeVarargs`: Indica que un método no realiza operaciones inseguras con varargs.
- `@SuppressWarnings`: Indica que se debe suprimir un aviso del compilador.
- `@Retention`: Indica cuánto tiempo se conserva la anotación.
  - `RetentionPolicy.SOURCE`: Solo se conserva en el código fuente.
  - `RetentionPolicy.CLASS`: Se conserva en el archivo .class, pero no se carga en tiempo de ejecución.
  - `RetentionPolicy.RUNTIME`: Se conserva en el archivo .class y se carga en tiempo de ejecución.
- `@Target`: Indica dónde se puede aplicar la anotación.
  - `ElementType.ANNOTATION_TYPE`: Anotación.
  - `ElementType.CONSTRUCTOR`: Constructor.
  - `ElementType.FIELD`: Campo.
  - `ElementType.LOCAL_VARIABLE`: Variable local.
  - `ElementType.METHOD`: Método.
  - `ElementType.PACKAGE`: Paquete.
  - `ElementType.PARAMETER`: Parámetro.
  - `ElementType.TYPE_PARAMETER`: Parámetro de tipo.
  - `ElementType.TYPE_USE`: Uso de tipo.
  - `ElementType.TYPE`: Clase, interfaz, enumeración.
- `@Transactional`: Indica que un método se ejecuta dentro de una transacción.

---
<br>

## 2. Anotaciones personalizadas
```java
/* TRANSACTIONAL */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@Transactional
public @interface Transactional{
}

/* USE CASE */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@Service
public @interface UseCase{
}

/* SERVICE */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@Service
public @interface Service{
}

/* DAO */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@Repository
public @interface Dao{
}
```



<br><br><br>
## *[volver al índice](../../README.md)*