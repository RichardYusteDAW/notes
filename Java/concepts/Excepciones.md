# Excepciones

## 1. Introducción
Las excepciones son errores que ocurren en tiempo de ejecución y que pueden ser capturados y tratados por el programador.  
Las excepciones son objetos que se lanzan cuando ocurre un error en tiempo de ejecución.

<br>

## 2. Clasificación
Las excepciones se clasifican en dos tipos:
- **Excepciones comprobadas**: son aquellas que el compilador obliga a tratar.
- **Excepciones no comprobadas**: son aquellas que el compilador no obliga a tratar.

<br>

## 3. Jerarquía de excepciones
Todas las excepciones en Java son subclases de la clase `Throwable`, que es la clase base para todas las excepciones en Java.
```java
OBJECT
└─ Throwable                          // Clase base para errores y excepciones.
   ├─ ERROR
   |  ├─ OutOfMemoryError             // Error por falta de memoria disponible.
   |  └─ StackOverflowError           // Error por desbordamiento de pila.
   |
   └─ EXCEPTION
      ├─ Checked Exception            // Excepciones que requieren ser capturadas o declaradas.
      |  ├─ IOException               // Excepciones de I/O.
      |  ├─ SQLException              // Excepciones relacionadas con la base de datos.
      |  └─ ClassNotFoundException    // Error al no encontrar una clase.
      |
      └─ RuntimeException             // Excepciones no verificadas en tiempo de compilación.
         ├─ NullPointerException      // Referencia nula.
         ├─ IndexOutOfBoundsException // Índice fuera de límites.
         └─ ArithmeticException       // Error aritmético, como división por cero.
```
<br>

## 4. Captura de excepciones
- Para capturar una excepción se utiliza un bloque `try-catch`.  
- El bloque `finally` se utiliza para ejecutar código que **SIEMPRE** debe ejecutarse, independientemente de si se lanza una excepción o no.
```java
try {
    // Código que puede lanzar una excepción.
} catch (Exception e) {
    // Código que se ejecuta si se lanza una excepción.
} finally {
    // Código que siempre se ejecuta.
}
```
<br>

## 5. Métodos de la clase **Throwable**
- `getMessage()`: devuelve el mensaje de error asociado a la excepción.
- `getClass()`: devuelve el nombre de la clase de la excepción.
- `getStackTrace()`: devuelve la traza de la excepción.
- `printStackTrace()`: imprime la traza de la excepción.
- `toString()`: devuelve una cadena que representa la excepción.
- `getCause()`: devuelve la causa de la excepción.

<br>

## 6. Lanzamiento de excepciones
- Para lanzar una excepción se utiliza la palabra clave `throw`.
```java
try {
    // Código que puede lanzar una excepción.
    throw new Exception("Mensaje de error");
} catch (Exception e) {
    // Código que se ejecuta si se lanza una excepción.
    System.out.println(e.getMessage());
}
```

- Si un método lanza una excepción, debe declararla en su firma con la palabra clave `throws`.
```java
public void metodo() throws Exception {
    throw new Exception("Mensaje de error");
}
```

- Si la excepcíon es unChecked (RuntimeException), no es necesario declararla en la firma del método.
```java
public void metodo() {
    throw new RuntimeException("Mensaje de error");
}
```
<br>

## 7. Creación de excepciones personalizadas
- Para crear una excepción personalizada se debe crear una clase que herede de `Exception` o `RuntimeException`.
```java
public class MiExcepcion extends Exception {

    private int codigo; //Se puede añadir este atributo para almacenar un código de error.

    public MiExcepcion(String mensaje, int codigo) {
        super(mensaje);
        this.codigo = codigo;
    }

    public int getCodigo() {
        return codigo;
    }
}
```
- Para lanzar una excepción personalizada se utiliza la palabra clave `throw`.
```java
try {
    throw new MiExcepcion("Mensaje de error", 1);
} catch (MiExcepcion e) {
    System.out.println(e.getMessage());
    System.out.println(e.getCodigo());
}
```
<br>

## 8. Try-with-resources
- El bloque **try-with-resources** se utiliza para cerrar recursos que implementan la interfaz `AutoCloseable` o `Closeable`. 
- Los recursos se cierran automáticamente al finalizar el bloque *try* en el orden inverso a como se abrieron.
- Se pueden abrir varios recursos separados por punto y coma (;).
```java
try (BufferedReader br = new BufferedReader(new FileReader("archivo.txt"))) {
    // Código que utiliza el recurso.
} catch (Exception e) {
    // Código que se ejecuta si se lanza una excepción.
}
```
<br>

## 9. Múltiples excepciones
- Se pueden anidar excepciones utilizando el método `initCause()` de la clase `Throwable`.
```java
try {
    try {
        throw new Exception("Excepción 1");
    } catch (Exception e) {
        throw new Exception("Excepción 2").initCause(e);
    }
} catch (Exception e) {
    System.out.println(e.getMessage());
    System.out.println(e.getCause().getMessage());
}
```

- Se pueden concatenar catchs para capturar varias excepciones.
```java
try {
    // Código que puede lanzar una excepción.
} catch (Exception1 e) {
    // Código que se ejecuta si se lanza la excepción 1.
} catch (Exception2 e) {
    // Código que se ejecuta si se lanza la excepción 2.
}
```

- Se pueden manejar múltiples excepciones en un solo bloque catch.
```java
try {
    // Código que puede lanzar una excepción.
} catch (Exception1 | Exception2 e) {
    // Código que se ejecuta si se lanza la excepción 1 o la excepción 2.
}
```
<br><br><br>

## *[volver al índice](../../README.md)*