# Mockito:
## Instalar liberías de testing:
#### IntelliJ: 
Alt+Insert >> Add dependency >> org.mockito:mockito-junit-jupiter

Para aplicar cambios: `Ctrl+Maj+O` || Load Maven Changes 
	
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

## Anotaciones (@ExtendWith, @Mock, @InjectMocks):
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

## When, ThenReturn y ThenThrow:
- **When**: Se usa para definir el comportamiento de un método de un mock.
- **ThenReturn**: Se usa para devolver un valor cuando se llama a un método de un mock.
- **ThenThrow**: Se usa para lanzar una excepción cuando se llama a un método de un mock.

```java
@Nested
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

## Verify:
- **Verify**: Se usa para verificar que un método de un mock ha sido llamado (Para métodos void).
- Puede utilizar los siguientes métodos:
    - **times(int n)**: Verifica que el método se haya llamado exactamente n veces.
    - **atLeast(int n)**: Verifica que el método se haya llamado al menos n veces.
    - **atMost(int n)**: Verifica que el método se haya llamado como máximo n veces.
    - **never()**: Verifica que el método no se haya llamado.
    - **timeout(long ms)**: Verifica que el método se haya llamado en un tiempo menor a millis milisegundos.
```java
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
``` 
<br><br><br>
## *[volver al índice](../index.md)*