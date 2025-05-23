# Angular testing

## 1. Karma
Karma es un ejecutor de pruebas para JavaScript que permite ejecutar pruebas en diferentes navegadores.
Proporciona una configuración sencilla y permite ejecutar pruebas de forma automática cada vez que se realizan cambios en el código.

### 1.1. Instalación
```bash
npm install --save-dev karma
```
---
<br>

## 2. Jasmine
Jasmine es un framework de pruebas para JavaScript que permite escribir pruebas unitarias y de comportamiento.  
Proporciona una sintaxis clara y fácil de usar para definir especificaciones y expectativas.

### 2.1. Instalación
```bash
npm install --save-dev jasmine
```

### 2.2. Sintaxis
```javascript
describe('Nombre del conjunto de pruebas', function() {
    it('Nombre de la prueba', function() {
        // Código de la prueba
        expect(valorEsperado).toEqual(valorReal);
    });
});
```

### 2.3. Mocks
- **ComponentFixture:** Es una clase que representa una instancia de un componente y su DOM asociado. Permite interactuar con el componente y su vista.
- **TestBed:** Es un módulo de pruebas que permite configurar el entorno de pruebas. Te permite crear instancias de componentes, servicios, pipes, etc., tal como si Angular los estuviera usando en tiempo real, pero en un entorno controlado de test.
  - **configureTestingModule():** Método que configura el módulo de pruebas. Aquí se declaran los componentes, servicios y otros módulos que se van a utilizar en las pruebas.
    - **declarations:** Se utiliza para declarar los componentes que se van a probar.
    - **imports:** Se utiliza para importar otros módulos que se van a utilizar en las pruebas.
    - **providers:** Se utiliza para proporcionar servicios que se van a utilizar en las pruebas.
  - **createComponent():** Método que crea una instancia del componente a probar. Devuelve un objeto de tipo `ComponentFixture`.
  - **inject():** Método que inyecta un servicio en el entorno de pruebas. Permite acceder a la instancia del servicio.
- **jasmine.SpyObj:** Es una función que crea un objeto espía (spy) para un servicio. Permite simular el comportamiento de un servicio y verificar si se han llamado ciertos métodos.

#### 2.3.1. Componente
```javascript
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { of } from 'rxjs';
import { MyComponent } from './my-component.component';
import { MyService } from './my-service.service';

describe('MyComponent', () => {
    let component: MyComponent;                   // Componente a probar.
    let fixture: ComponentFixture<MyComponent>;   // Fixture es una instancia del componente que contiene tanto el DOM como el .ts
    let myServiceMock: jasmine.SpyObj<MyService>; // Mock del servicio.
    let view: HTMLElement;                        // Variable para almacenar el DOM del componente.

    beforeEach(() => {
        myServiceMock = jasmine.createSpyObj('MyService', ['getData']);  // Crea un mock del servicio.

        TestBed.configureTestingModule({                                 // Configuración del módulo de pruebas.
            declarations: [MyComponent],                                 // Declara el componente.
            imports: [MyModule],                                         // Importa el módulo (Si el módulo contiene el componente no es necesario declarar dicho componente).
            providers: [{ provide: MyService, useValue: myServiceMock }] // Proporciona el mock del servicio.
        });

        fixture = TestBed.createComponent(MyComponent);                  // Crea una instancia del componente.
        component = fixture.componentInstance;                           // Asigna la instancia del componente.
        fixture.detectChanges();                                         // Detecta cambios en la vista del componente.
        view = fixture.nativeElement;                                    // Asigna el DOM del componente.
    });

    it('should subscribe to data observable', () => {
        // Arrange
        const mockData = [{ id: 1, name: 'Test' }];                      // Datos simulados.
        const productData = new BehaviorSubject(mockData);               // Crea un observable simulado.
        myServiceMock.productData$ = productData.asObservable();         // Asigna el observable al mock del servicio.
        productData.next(mockData);                                      // Simula la emisión de datos.

        // Act
        component.subscribeToData();                                     // Llama al método que se va a probar.

        // Assert
        expect(component.data).toEqual(mockData);                        // Verifica que los datos sean los esperados.
    });

    it('should call getData', () => {
        // Arrange
        myServiceMock.getData.and.returnValue(of([]));                   // Simula la respuesta del servicio.

        // Act
        component.getData();                                             // Llama al método getData.

        // Assert
        expect(myServiceMock.getData).toHaveBeenCalled();                // Verifica que se haya llamado al método.
    });

    
    it('should render data in the template', () => {
        // Arrange
        const mockData = [{ id: 1, name: 'Test' }];                      // Datos simulados.
        myServiceMock.getData.and.returnValue(of(mockData));             // Simula la respuesta del servicio.

        // Act
        fixture.detectChanges();                                         // Detecta cambios en la vista del componente.
        const listItem = view.querySelector('li');                       // Selecciona el elemento de la lista.

        // Assert
        expect(listItem.textContent).toContain('Test');                  // Verifica que se muestre el dato en el DOM.
    });
});
```

#### 2.3.2. Servicio
- **HttpClient:** Es el cliente HTTP de Angular que se utiliza para realizar solicitudes HTTP.
- **HttpClientModule:** Es el módulo que proporciona el cliente HTTP real para realizar solicitudes HTTP.
- **HttpClientTestingModule:** Es un módulo de pruebas que proporciona un cliente HTTP simulado para realizar pruebas sin realizar solicitudes reales.
```javascript
// Para Angular 15 o inferior
import { TestBed } from '@angular/core/testing';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { MyService } from './my.service';

describe('MyService', () => {
    let service: MyService;
    let mockHttpClient: HttpTestingController;

    beforeEach(() => {
        TestBed.configureTestingModule({
            imports: [ HttpClientTestingModule ],                          // Importa el módulo de pruebas HTTP.
        });
        service = TestBed.inject(MyService);                               // Inyecta el servicio.
        mockHttpClient = TestBed.inject(HttpTestingController);            // Inyecta el controlador de pruebas HTTP.
    });
});
```

- **provideHttpClient():** Registra el HttpClient en el sistema de inyección de dependencias, usando la nueva API de proveedores basada en funciones (standalone API).
- **provideHttpClientTesting():** Registra un cliente HTTP simulado, que intercepta y permite controlar las peticiones HTTP con HttpTestingController.
- **HttpTestingController:** Permite simular y controlar solicitudes HTTP en las pruebas. Proporciona métodos para verificar las solicitudes y simular respuestas.
```javascript
import { TestBed } from '@angular/core/testing';
import { provideHttpClient } from '@angular/common/http';
import { HttpTestingController, provideHttpClientTesting } from '@angular/common/http/testing';
import { MyService } from './my.service';


describe('MyService', () => {
    let service: MyService;
    let mockHttpClient: HttpTestingController;

    beforeEach(() => {
        TestBed.configureTestingModule({
            providers: [ provideHttpClient(), provideHttpClientTesting() ] // Proporciona el servicio y los módulos necesarios.
        });
        service = TestBed.inject(MyService);                               // Inyecta el servicio.
        mockHttpClient = TestBed.inject(HttpTestingController);            // Inyecta el controlador de pruebas HTTP.
    });

    it('should be created', () => {
        expect(service).toBeTruthy();                                      // Verifica que el servicio se haya creado correctamente.
    });

    it('should fetch data', () => {
        // Arrange
        const mockData = [{ id: 1, name: 'Test' }];                        // Datos simulados.
        let result: string[] | undefined;                                  // Variable para almacenar el resultado.

        // Act
        service.getData().subscribe(data => result = data);                // Llama al método del servicio y almacena el resultado.
        const req = mockHttpClient
                    .expectOne('https://api.example.com/data');            // Espera una llamada HTTP.
        req.flush(mockData);                                               // Simula la respuesta del servidor.

        // Assert
        expect(req.request.method).toBe('GET');                            // Verifica que el método de la solicitud sea GET.
        expect(result).toEqual(mockData);                                  // Verifica que el resultado sea el esperado.
    });
});
```

#### 2.3.3. Router y RouterLink
```javascript
import { ComponentFixture, TestBed, fakeAsync, tick } from '@angular/core/testing';
import { RouterOutlet, Router, provideRouter } from '@angular/router';
import { MyComponent } from './my-component.component';
import { routes } from './app-routing.module';

describe('MyComponent', () => {
    let fixture: ComponentFixture<MyComponent>;
    let router: Router;

    beforeEach(() => {
        TestBed.configureTestingModule({
            imports: [ MyComponent, RouterOutlet ],                        // Importa el componente y el outlet del router.
            providers: [ provideRouter(routes) ]                           // Proporciona el router y las rutas.
        });

        fixture = TestBed.createComponent(MyComponent);                    // Crea una instancia del componente.
        router = TestBed.inject(Router);                                   // Inyecta el router.
    });

    it('should be created', () => {
        expect(fixture.componentInstance).toBeTruthy();                    // Verifica que el componente se haya creado correctamente.                                      
    });

    it('should navigate to /home', fakeAsync(() => {
        // Act
        router.navigate(['/home']);                                        // Llama al método de navegación.
        tick();                                                            // Avanza el tiempo simulado.
        fixture.detectChanges();                                           // Detecta cambios en la vista.
        const view = fixture.nativeElement;                                // Obtiene el DOM del componente.

        // Assert
        expect(router.url).toBe('/home');                                  // Verifica que la URL sea la esperada.
        expect(view.textContent).toContain('Home');                        // Verifica que el contenido del DOM contenga 'Home'.
    }));

    it('should navigate to /home when a is clicked', fakeAsync(() => {
        // Arrange
        const link = fixture.nativeElement.querySelector('a');             // Selecciona el enlace.

        // Act
        link.click();                                                      // Simula un clic en el botón.
        tick();                                                            // Avanza el tiempo simulado.
        fixture.detectChanges();                                           // Detecta cambios en la vista.
        const view = fixture.nativeElement;                                // Obtiene el DOM del componente.

        // Assert
        expect(router.url).toBe('/home');                                  // Verifica que la URL sea la esperada.
        expect(view.textContent).toContain('Home');                        // Verifica que el contenido del DOM contenga 'Home'.
    }));
});
```

#### 2.3.4. Eventos
```javascript
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MyComponent } from './my-component.component';

describe('MyComponent', () => {
    let fixture: ComponentFixture<MyComponent>;
    let component: MyComponent;
    let view: HTMLElement;

    beforeEach(() => {
        TestBed.configureTestingModule({
            imports: [ MyComponent ]                                       // Importa el componente.
        });

        fixture = TestBed.createComponent(MyComponent);                    // Crea una instancia del componente.
        component = fixture.componentInstance;                             // Asigna la instancia del componente.
        fixture.detectChanges();                                           // Detecta cambios en la vista.
        view = fixture.nativeElement;                                      // Obtiene el DOM del componente.
    });

    it('should call onClick when button is clicked', () => {
        // Arrange
        const onClickSpy = spyOn(component, 'onClick');                    // Espía el método onClick.
        const button = view.querySelector('button');                       // Selecciona el botón.

        // Act
        const event = new MouseEvent('click');                             // Crea un nuevo evento de clic.
        button.dispatchEvent(event);                                       // Dispara el evento de clic.
        //button.click();                                                  // Simula un clic en el botón directamente.

        // Assert
        expect(onClickSpy).toHaveBeenCalled();                             // Verifica que se haya llamado al método onClick.
    });

    it('should call onInput when input value changes', () => {
        // Arrange
        const onInputSpy = spyOn(component, 'onInput');                    // Espía el método onInput.
        const input = view.querySelector('input');                         // Selecciona el input.

        // Act
        const event = new Event('input');                                  // Crea un nuevo evento de entrada.
        input.dispatchEvent(event);                                        // Dispara el evento de entrada.

        // Assert
        expect(onInputSpy).toHaveBeenCalled();                             // Verifica que se haya llamado al método onInput.
    });
});
```
| Tipo de evento         | Evento      | Constructor recomendado                      | Uso típico                                     |
|------------------------|-------------|----------------------------------------------|------------------------------------------------|
| Teclado                | `keydown`   | `new KeyboardEvent('keydown',{key:'Enter'})` | Pulsación de tecla hacia abajo                 |
|                        | `keyup`     | `new KeyboardEvent('keyup',{key:'Escape'})`  | Soltar una tecla                               |
|                        | `keypress`  | `new KeyboardEvent('keypress',{key:'a'})`    | Pulsación continua (obsoleto en algunos casos) |
| Ratón                  | `click`     | `new MouseEvent('click')`                    | Clic de ratón                                  |
|                        | `dblclick`  | `new MouseEvent('dblclick')`                 | Doble clic                                     |
|                        | `mousedown` | `new MouseEvent('mousedown')`                | Botón del ratón presionado                     |
|                        | `mouseup`   | `new MouseEvent('mouseup')`                  | Botón del ratón liberado                       |
|                        | `mousemove` | `new MouseEvent('mousemove')`                | Movimiento del ratón                           |
| Formularios            | `input`     | `new Event('input')`                         | Entrada de texto o cambio en un input          |
|                        | `change`    | `new Event('change')`                        | Cambio de valor en un campo                    |
|                        | `submit`    | `new Event('submit')`                        | Envío de formulario                            |
| Enfoque/blur           | `focus`     | `new FocusEvent('focus')`                    | Cuando un elemento recibe el foco              |
|                        | `blur`      | `new FocusEvent('blur')`                     | Cuando un elemento pierde el foco              |
| Eventos personalizados | `custom`    | `new CustomEvent('nombre',{detail:datos})`   | Para eventos definidos por el usuario          |
---
<br>


### 2.4. Métodos de Jasmine
| Categoría                 | Método / Matcher                   | Explicación                                                                               |
| ------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------- |
| **Control de asincronía** | `fakeAsync(fn)`                    | Ejecuta una función en una zona fake para simular asincronía sin esperas reales.          |
|                           | `tick(ms)`                         | Avanza el tiempo simulado en milisegundos dentro de `fakeAsync`.                          |
|                           | `flush()`                          | Ejecuta todos los temporizadores pendientes (setTimeout, setInterval, etc).               |
|                           | `flushMicrotasks()`                | Ejecuta todas las tareas pendientes en la cola de microtareas (promesas, observables).    |
|                           | `waitForAsync(fn)`                 | Ejecuta pruebas asincrónicas reales pero espera a que se completen antes de continuar.    |
|                           | `async(fn)`                        | Obsoleto en Angular. Reemplazado por `waitForAsync`.                                      |
|                           | `done()`                           | Callback manual que indica cuándo ha terminado una prueba asincrónica.                    |
| ------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------- |
| **Espías**                | `spyOn(obj, 'method')`             | Crea un espía en un método de un objeto. Permite espiar llamadas, modificar retorno, etc. |
|                           | `createSpy()`                      | Crea una función espía sin implementación original.                                       |
|                           | `createSpyObj('Nombre', ['met1'])` | Crea un objeto espía con varios métodos simulados.                                        |
| ------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------- |
| **Comportamiento**        | `and.callFake(fn)`                 | Sustituye el método espiado por una función personalizada.                                |
|                           | `and.returnValue(valor)`           | Hace que el método espiado devuelva un valor fijo.                                        |
|                           | `and.returnValues(...valores)`     | Devuelve valores diferentes en llamadas sucesivas.                                        |
|                           | `and.callThrough()`                | Ejecuta el método original además de espiar.                                              |
|                           | `and.throwError('mensaje')`        | Lanza un error simulado cuando se llama al método.                                        |
| ------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------- |
| **Verificación**          | `toHaveBeenCalled()`               | Verifica que se haya llamado al método espía.                                             |
|                           | `toHaveBeenCalledWith(...)`        | Verifica que se haya llamado con determinados argumentos.                                 |
|                           | `toHaveBeenCalledTimes(n)`         | Verifica que se haya llamado un número exacto de veces.                                   |
| ------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------- |
| **Igualdad básica**       | `toBe(valor)`                      | Compara por igualdad estricta (`===`).                                                    |
|                           | `toEqual(valor)`                   | Compara estructura de objetos o arrays (valor profundo).                                  |
| ------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------- |
| **Comparaciones**         | `toBeGreaterThan(n)`               | Verifica que sea mayor que `n`.                                                           |
|                           | `toBeLessThan(n)`                  | Verifica que sea menor que `n`.                                                           |
|                           | `toBeCloseTo(valor, decimales?)`   | Verifica que esté cerca de un valor con cierto número de decimales.                       |
| ------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------- |
| **Strings/arrays**        | `toContain(valor)`                 | Verifica que una cadena o array contiene un valor.                                        |
|                           | `toMatch(regex)`                   | Verifica que una cadena cumple una expresión regular.                                     |
| ------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------- |
| **Booleanos**             | `toBeTruthy()`                     | Verifica que el valor sea considerado verdadero (`!!valor === true`).                     |
|                           | `toBeFalsy()`                      | Verifica que el valor sea considerado falso (`!!valor === false`).                        |
|                           | `toBeDefined()`                    | Verifica que la variable esté definida.                                                   |
|                           | `toBeUndefined()`                  | Verifica que la variable esté sin definir.                                                |
| ------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------- |
| **Errores y excepciones** | `toThrow()`                        | Verifica que una función lanza una excepción.                                             |
|                           | `toThrowError('mensaje')`          | Verifica que lanza un error con un mensaje específico.                                    |
| ------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------- |
| **Otros**                 | `toBeNaN()`                        | Verifica que el valor es `NaN`.                                                           |
|                           | `not.toEqual(...)`                 | Nega cualquier matcher (`not` invierte el resultado esperado).                            |
<br><br><br>

## *[volver al índice](../../../README.md)*