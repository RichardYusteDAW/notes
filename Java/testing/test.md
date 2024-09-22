# Testing:
## 1. Instalar librerías de testing:
### A. IntelliJ: 
Alt+Insert >> Add dependency >> org.junit.jupiter:junit-jupiter

Para aplicar cambios: `Ctrl+Shift+O` || Load Maven Changes 
	
### B. VSC: 
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
<br>

## 2. Métodos de testing:
```java
@Test
@DisplayName("Este es mi test")
void calculadoraTest(){
    assertEquals(5, DebugCalculadora.sumar(3, 2));
}
```

### - Assertions:
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
    () -> assertTrue(1 > 0)             // la siguiente intrucción también se comprobará.
)

//assertThrows
assertThrows(ResourceNotFoundException.class, () -> movieService.findById("ABC")); // Verifica que se lanza una excepción de tipo ResourceNotFoundException al ejecutar el método movieService.findById("ABC").
```

### - Anotaciones JUnit:
```java
@Test           // Indica que el método es un caso de prueba.
@DisplayName    // Proporciona un nombre descriptivo para el caso de prueba o la clase de prueba.
@BeforeAll      // Se ejecuta antes de todos los métodos de prueba. (debe ser estático en pruebas NO anidadas).
@AfterAll       // Se ejecuta después de todos los métodos de prueba (debe ser estático en pruebas NO anidadas).
@BeforeEach     // Se ejecuta antes de cada método de prueba.
@AfterEach      // Se ejecuta después de cada método de prueba.
@Disabled       // Desactiva un método de prueba o una clase de prueba.
@Nested         // Permite la creación de clases de prueba anidadas para estructurar mejor los casos de prueba.
```
<br>

```java
import org.junit.jupiter.api.*; // Importar todas las anotaciones de JUnit
import static org.junit.jupiter.api.Assertions.*; // Importar todas las aserciones de JUnit

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
<br>

### - Test Parametrizados:
#### @ValueSource:
```java
import org.junit.jupiter.params.ParameterizedTest;

@ParameterizedTest                   //Indica que el método es un caso de prueba parametrizado.
@DisplayName("Prueba Parametrizada") //Proporciona un nombre descriptivo para el caso de prueba.

//Proporciona un conjunto de valores para el caso de prueba:
@ValueSource(ints = {1, 2, 3, 4, 5})
@ValueSource(floats = {1.0f, 2.0f, 3.0f, 4.0f, 5.0f})
@ValueSource(doubles = {1.0, 2.0, 3.0, 4.0, 5.0})
@ValueSource(strings = {"Java", "JUnit", "Maven"})
@ValueSource(chars = {'a', 'b', 'c', 'd', 'e'})
@ValueSource(booleans = {true, false})
@ValueSource(classes = {String.class, Integer.class, Double.class})

void pruebaParametrizada(int valor) {
    assertTrue(valor > 0);
}

void pruebaParametrizada(String valor) {
    assertTrue(valor.length() > 0);
    assertTrue(valor.contains("a"));
}
```
#### @NullSource && @EmptySource && @NullAndEmptySource:
```java
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.NullAndEmptySource;
import org.junit.jupiter.params.provider.NullSource;
import org.junit.jupiter.params.provider.EmptySource;

@ParameterizedTest (name="\"{0}\"")
@DisplayName("Prueba Parametrizada")
@NullSource         //Proporciona un valor NULL para el caso de prueba.
@EmptySource        //Proporciona un valor vacío para el caso de prueba.
@NullAndEmptySource //Proporciona un valor nulo y un valor vacío para el caso de prueba.
@ValueSource(strings = {"Java", null, ""}) //Proporciona un conjunto de valores para el caso de prueba.

void pruebaParametrizada(String valor) {
    assertTrue(valor == null);
    assertTrue(valor.isEmpty());
    assertTrue(valor == null || valor.isEmpty());
}
```

#### @CsvSource:
```java
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

@ParameterizedTest(name="{0} + {1} = {2}")
@DisplayName("Prueba Parametrizada")
@CsvSource({"1, 1, 2", "2, 3, 5", "3, 4, 7", "4, 5, 9", "5, 6, 11"}) //Los valores solo pueden ser de tipo primitive o String.

void pruebaParametrizada(int a, int b, int resultado) {
    assertEquals(resultado, a + b);
}
```

#### @MethodSource:
```java
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import java.util.stream.Stream;

@ParameterizedTest(name="[{index}] {0} + {1} = {2}")
@DisplayName("Prueba Parametrizada")
@MethodSource("valores") //Proporciona un método que devuelve un Stream, Iterable, Iterator, o array de argumentos para el caso de prueba.
void pruebaParametrizada(int a, int b, int resultado) {
    assertEquals(resultado, a + b);
}

static Stream<Arguments> valores() {
    return Stream.of(
        Arguments.of(1, 1, 2),
        Arguments.of(2, 3, 5),
        Arguments.of(3, 4, 7),
        Arguments.of(4, 5, 9),
        Arguments.of(5, 6, 11)
    );
}
```
<br>

## 3. Estructura de un test:
- `ARRANGE` (Preparar): Preparar el entorno de pruebas (configurar datos, inicializar objetos, preparar mocks...).
- `ACT` (Actuar): Llamar al método que se va a probar.
- `ASSERT` (Afirmar): Verificar que el resultado es el esperado.
```java
@Test
void sumarTest() {
    //ARRANGE
    int a = 3;
    int b = 2;
    int expected = 5; //Resultado esperado

    //ACT
    int result = DebugCalculadora.sumar(a, b); //Llamada al método a probar

    //ASSERT
    assertEquals(esperado, resultado); //Verificar que el resultado es el esperado
}
```

## 3.1. Estructura por capas:
### 3.1.1. Entity:
```java
/* Testear los constructores. */
    // Arrange
    // Act
        Se crea la Entity a través de su constructor.
    // Assert
        Se llama a los getters correspondientes.

/* Testear los setters. */
    // Arrange
        Se crea la Entity a través de su constructor.
    // Act
        Se setean los atributos con nuevos valores.
    // Assert
        Se llama a los getters correspondientes.

/* Testear los métodos. */
    // Arrange
        Se crea la Entity a través de su constructor.
    // Act
        Se llama a los métodos de la Entity.
    // Assert
        Se verifica que el resultado sea el esperado.
```

### 3.1.2. Service and Repository:
```java
@ExtendWith(MockitoExtension.class)
class ServiceOrRepositoryTest {
    @Mock
    Se crean los mocks necesarios a través de las INTERFACES.

    @InjectMocks
    Se inyectan los mocks en la clase Service o Repository a través de su IMPLEMENTACIÓN.

    /* Check Exception */
        // Arrange
            when(mock.method()).thenReturn(value);
        // Act && Assert
            assertThrows(Exception.class, () -> serviceOrRepository.method());
    
    /* Check Void Method */
        // Arrange
            when(mock.method()).thenReturn(value);
        // Act
            Se llama al método.
        // Assert
            verify(mock.method()); // Verifica que los métodos mock han sido llamados.
    
    /* Check Method */
        // Arrange
            expected = Se prepara el valor esperado.
            when(mock.method()).thenReturn(value);
        // Act
            result = Se llama al método.
        // Assert
            verify(mock.method()); // Verifica que los métodos mock han sido llamados.
            assertEquals(expected,  result);
}
```

### 3.1.3. Dao:
```java
class DaoTest {
    Se crean la implementación del DAO desde la interfaz.
    private static Connection connection;

    @BeforeAll
    public static void setUp() throws SQLException {
        connection = DBConnection.getInstance().getConnection();
        DBConnection.getInstance().executeScript("script.sql");
        connection.setAutoCommit(false);
    }

    @AfterEach
    void tearDown() throws SQLException {
        connection.rollback();
    }

    @Test
    void methodTest() throws SQLException{
        /* Check Void Method */
            // Arrange
                String sql = Se prepara la sentencia SQL.
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, value);
                rs = ps.executeQuery(); 

                assertFalse(rs.next()); // Verificamos el estado actual de la base de datos.
            // Act
                Se llama al método.
                rs = ps.executeQuery(); // Volvemos a ejecutar la sentencia SQL.
            // Assert
                assertTrue(rs.next()); // Verificamos el estado actual de la base de datos.
                assertEquals(value, rs.getString(1)); // Verificamos que el valor sea el esperado.

        /* Check Method */
            // Arrange
                expected = Se prepara el valor esperado.
            // Act
                result = Se llama al método.
            // Assert
                assertEquals(expected,  result);
    }
}
```
<br><br><br>

## *[volver al índice](../../README.md)*