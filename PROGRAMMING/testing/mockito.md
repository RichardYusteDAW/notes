# Mockito:
## 1. Instalar librerías de Mockito:
#### IntelliJ: 
Alt+Insert >> Add dependency >> org.mockito:mockito-junit-jupiter

Para aplicar cambios: `Ctrl+Shift+O` || Load Maven Changes 
	
#### VSC: 
Maven >> Dependencies >> Mockito
```	
<dependencies>
    <dependency>
        <groupId>org.mockito</groupId>
        <artifactId>mockito-junit-jupiter</artifactId>
        <version>5.2.0</version>
        <scope>test</scope>
    </dependency>
</dependencies>
```
<br>

## 2. Anotaciones (@ExtendWith, @Mock, @InjectMocks):
```java
@ExtendWith(MockitoExtension.class) //Para poder usar las anotaciones @Mock y @InjectMocks
class CarServiceTest {

    @Mock //Crea un mock de la clase CarRepository
    private CarRepository carRepository;
    
    @InjectMocks //Inyecta los mocks en la clase CarService
    private CarService carService; //Es equivalente a: "CarService carService = new CarService(carRepository)"
}
```
<br>

## 3. When, ThenReturn y ThenThrow:
- `when`: Se usa para definir el comportamiento de un método de un mock.
- `thenReturn`: Se usa para devolver un valor cuando se llama a un método de un mock.
- `thenThrow`: Se usa para lanzar una excepción cuando se llama a un método de un mock.

```java
@ExtendWith(MockitoExtension.class)
class CarServiceTest {

    @Test
    @DisplayName("Test find Car by Id")
    void findByIdTest() {
        Car car = new Car(1, "Audi", "A4");
        //Cuando se llame al método findById(1) del mock carRepository, devolverá el objeto car
        when(carRepository.findById(1)).thenReturn(car);
        
        Car resultCar = carService.findById(1);
        
        assertSame(car, resultCar);
    }
    
    @Test
    @DisplayName("Test find Car by Id not found")
    void findByIdExceptionTest() {
        //Cuando se llame al método findById(1) del mock carRepository, lanzará una excepción
        when(carRepository.findById(100)).thenThrow(new RuntimeException("Car not found"));
        
        assertThrows(RuntimeException.class, () -> carService.findById(100));
    }
}
```
<br>

## 4. Verify:
- `verify`: Se usa para verificar que un método de un mock ha sido llamado (Para métodos void).
- Puede utilizar los siguientes métodos:
    - **times(int n)**: Verifica que el método se haya llamado exactamente n veces.
    - **atLeast(int n)**: Verifica que el método se haya llamado al menos n veces.
    - **atMost(int n)**: Verifica que el método se haya llamado como máximo n veces.
    - **never()**: Verifica que el método no se haya llamado.
    - **timeout(long ms)**: Verifica que el método se haya llamado en un tiempo menor a millis milisegundos.
```java
@ExtendWith(MockitoExtension.class)
class CarServiceTest {

    @Test
    @DisplayName("Test save Car")
    void saveTest() {
        Car car = new Car(1, "Audi", "A4");
        when(carRepository.save(car)).thenReturn(car);
        
        Car resultCar = carService.save(car);
        
        verify(carRepository).save(car);               // Verifica que se haya llamado al método save(car) del mock carRepository.
        verify(carRepository, times(1)).save(car);     // Verifica que se haya llamado exactamente 1 vez.
        verify(carRepository, atLeast(1)).save(car);   // Verifica que se haya llamado al menos 1 vez.
        verify(carRepository, atMost(1)).save(car);    // Verifica que se haya llamado como máximo 1 vez.
        verify(carRepository, never()).delete(car);    // Verifica que no se haya llamado al método delete(car) del mock carRepository.
        verify(carRepository, timeout(100)).save(car); // Verifica que se haya llamado en un tiempo menor a 100 milisegundos.
        
        assertSame(car, resultCar);
    }
}
```
<br>

## 5. eq & any:
- `eq(value)`: Se utiliza para especificar que el argumento esperado debe ser IGUAL al value proporcionado.
- `any(Class<T> type)`: Se utiliza cuando no importa qué objeto específico se pase, pero sí importa el tipo del objeto.
```java
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.ArgumentMatchers.any;

@ExtendWith(MockitoExtension.class)
class CarServiceTest {

    @Test
    @DisplayName("Test find Car by Id with exact id")
    void findByIdTest() {
        Car car = new Car(1, "Audi", "A4");
        when(carRepository.findById(eq(1))).thenReturn(car); // Utiliza eq para asegurar que se busca por el id 1 exactamente.
        
        Car resultCar = carService.findById(1);
        
        assertSame(car, resultCar);
    }

    @Test
    @DisplayName("Test find Car by any Id")
    void findByIdTest() {
        Car car = new Car(1, "Audi", "A4");
        when(carRepository.findById(any(Integer.class))).thenReturn(car); // Utiliza any para permitir cualquier Integer como id.
        
        Car resultCar = carService.findById(9);

        assertSame(car, resultCar);
    }
}
```
<br>

## 6. ArgumentCaptor y @Captor:
- `ArgumentCaptor`: Es una clase utilizada para CAPTURAR ARGUMENTOS pasados a métodos en objetos mockeados. Esto permite verificar que los argumentos pasados durante la ejecución son los correctos.
```java
public void addCarDetail(CarDetail carDetail) {
    carRepository.save(carDetail);
}


@ExtendWith(MockitoExtension.class)
class CarServiceTest {

    @Mock
    private CarRepository carRepository;

    @InjectMocks
    private CarService carService;

    @Captor
    private ArgumentCaptor<CarDetail> carDetailCaptor; // Crea un captor para objetos de tipo CarDetail

    @Test
    @DisplayName("Test add Car Detail")
    void addCarDetailTest() {
        CarDetail carDetail = new CarDetail(1, "Black", "Leather");
        carService.addCarDetail(carDetail);
        
        // Captura el argumento pasado al método save() y verifica que sea correcto
        verify(carRepository).save(carDetailCaptor.capture());
        
        CarDetail capturedCarDetail = carDetailCaptor.getValue(); // Obtiene el objeto capturado
        assertAll("Should capture correct CarDetail properties",
            () -> assertEquals("Black", capturedCarDetail.getColor()),
            () -> assertEquals("Leather", capturedCarDetail.getInterior())
        );
    }
}
```
<br><br><br>

## *[volver al índice](../../index.md)*