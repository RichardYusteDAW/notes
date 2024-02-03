# Testing:
## Instalar liberías de testing:
#### IntelliJ: 
Alt+Insert >> Add dependency >> org.junit.jupiter:junit-jupiter

Para aplicar cambios: `Ctrl+Maj+O` || Load Maven Changes 
	
#### VSC: 
Maven >> Dependencies >> JUnit5
```	
<dependencies>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter</artifactId>
        <version>5.10.0</version>
    </dependency>
</dependencies>
```

## Metodos de testing:
```java
@Test
@DisplayName("Este es mi test")
void calculadoraTest(){
    assertEquals(5, DebugCalculadora.sumar(3, 2));
}
```

### Assertions:
```java
AssertionError                          //Si el test falla.

//assertEquals
assertEquals(10, 3 + 7),                // Integer.
assertEquals('b', 'a' + 1),             // Char.
assertEquals(1.5, 3.0 / 2),             // Double.
assertEquals(1.5, 3.1 / 2, 0.1)         // Float or Double with tolerance (delta).
assertEquals(3.14159, Math.PI, 1e-5);   // 1e-5 == 0.00001
assertEquals("A", "a".toUpperCase())    // String.

//assertTrue
assertTrue(5 > 4);                      // Comprueba que 5 es mayor que 4.
assertFalse(5 < 4);                     // Comprueba que 5 no es menor que 4.

//assertNull
String a = null;
String b = "Joan";
assertNull(a);                          // Verifica que el objeto es null.
assertNotNull(b);                       // Verifica que el objeto NO es null.

//assertSame
String a = "test";
String b = "test";
String c = new String("test");
String d = new String("test");
assertSame(a, a);                       // Verifica que a y a apuntan al mismo objeto. TRUE
assertNotSame(a, b);                    // Verifica que a y b NO apuntan al mismo objeto. FALSE (a y b sí apuntan al mismo objeto ya que Java detectan que poseen el mismo valor y no crea objetos diferentes)
assertSame(c, c);                       // Verifica que c y c apuntan al mismo objeto. TRUE
assertNotSame(c, d);                    // Verifica que a y c NO apuntan al mismo objeto. TRUE (c y d apuntan a objetos diferentes al crearse con new String()).

//assertArrayEquals
assertArrayEquals(new int[]{1, 2, 3}, new int[]{1, 2, 3}); // Verifica que ambos arreglos son iguales,tanto en longitud como en cada uno de sus elementos.

//assertAll
assertAll(
    () -> assertFalse(1 > 0),           // Esta prueba fallará y ...
    () -> assertTrue(1 > 0)             // la seguiente intrucción también se comprobará.
)
```

### Anotaciones JUnit:
```java
@Test           //Indica que el método es un caso de prueba.
@DisplayName    //Proporciona un nombre descriptivo para el caso de prueba o la clase de prueba.
@BeforeAll      //Se ejecuta antes de todos los métodos de prueba. (debe ser estático en pruebas NO anidadas).
@AfterAll       //Se ejecuta después de todos los métodos de prueba (debe ser estático en pruebas NO anidadas).
@BeforeEach     //Se ejecuta antes de cada método de prueba.
@AfterEach      //Se ejecuta después de cada método de prueba.
@Disabled       //Desactiva un método de prueba o una clase de prueba.
@Nested         //Permite la creación de clases de prueba anidadas para estructurar mejor los casos de prueba.
```
<br>

```java
import org.junit.jupiter.api.*;

class EjemploPruebas {

    @BeforeAll
    static void inicializarRecursos() {/*Código para inicializar recursos antes de todas las pruebas*/}

    @BeforeEach
    void configurar() {/*Código de configuración antes de cada prueba*/}

    @Test
    @DisplayName("Prueba Simple")
    void pruebaSimple() {/*Código de la prueba*/}

    @Test
    @Disabled("No implementado aún")
    void pruebaDesactivada() {/*Código de una prueba desactivada*/}

    @AfterEach
    void limpiar() {/*Código de limpieza después de cada prueba*/}

    @AfterAll
    static void liberarRecursos() {/*Código para liberar recursos después de todas las pruebas*/}

    @Nested
    @DisplayName("Pruebas Anidadas")
    class PruebasAnidadas {
        
        @Test
        void pruebaAnidada1() {/*Código de una prueba anidada1*/}
		
        @Test
        void pruebaAnidada2() {/*Código de una prueba anidada2*/}
    }
}
```
<br><br><br>

## *[volver al índice](../index.md)*