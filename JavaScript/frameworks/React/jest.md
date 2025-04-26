# Jest
Es un framework de pruebas para JavaScript creado por Facebook. Se enfoca en la simplicidad y la velocidad. Funciona con proyectos que utilizan: Babel, TypeScript, Node, React, Angular, Vue y más.

## 1. Web Site 🌐
- [https://jestjs.io](https://jestjs.io)
---
<br>

## 2. Instalación 📦
```bash
npm install --save-dev jest # Con npm
yarn add --dev jest         # Con yarn
```

### 2.1. Babel
- Babel es un transpilador de JavaScript que permite utilizar las últimas características del lenguaje en navegadores más antiguos, convertiendo el código moderno de JavaScript en una versión compatible con versiones anteriores.
```bash
# babel-jest: Permite utilizar Babel con Jest.
# @babel/core: Núcleo de Babel.
# @babel/preset-env: Conjunto de plugins de Babel para compilar JavaScript moderno a JavaScript compatible con versiones anteriores.
npm install --save-dev babel-jest @babel/core @babel/preset-env # Con npm
yarn add --dev babel-jest @babel/core @babel/preset-env         # Con yarn
```
```json
// babel.config.json
module.exports = {
    presets: [
        [ '@babel/preset-env', { targets: { esmodules: true } } ]
    ],
};
```
---
<br>

### 2.2. TypeScript
- TypeScript es un superconjunto de JavaScript que agrega tipado estático y otras características avanzadas al lenguaje.
```bash
npm install --save-dev typescript # Con npm
yarn add --dev typescript         # Con yarn
```

#### 2.2.1. `@types/jest`
- Es un paquete que contiene las definiciones de tipos de TypeScript para Jest y ayuda a que TypeScript reconozca las funciones y métodos de Jest.
```bash
npm install --save-dev @types/jest # Con npm
yarn add --dev @types/jest         # Con yarn
```

#### 2.2.2. `ts-jest`
- Es un preprocesador de TypeScript para Jest que permite ejecutar pruebas escritas en TypeScript sin necesidad de compilar el código a JavaScript primero.
```bash
npm install --save-dev ts-jest # Con npm
yarn add --dev ts-jest         # Con yarn
```
---
<br>

## 3. Añadir scripts en package.json 📝
- `watchAll`: Ejecuta las pruebas en modo watch.
- Opciones:
  - `w (write)`: Permite elegir la opción.
    - `f (failed)`: Ejecuta los test fallidos.
    - `o (only)`: Ejecuta solo los test que se han modificado.
    - `p (pattern)`: Filtra los ARCHIVOS por un patrón o expresión regular.
    - `t (testNamePattern)`: Filtra los TESTS por un patrón o expresión regular.
    - `q (quit)`: Salir del modo watch.
```json
"scripts": {
  "test": "jest --watchAll"
}
```
---
<br>


## 4. Configuración 🛠️
Para configurar Jest, se debe crear un archivo llamado `jest.config.js` en la raíz del proyecto:
```javascript
// jest.config.js
module.exports = {
  projects: [
    {
      displayName: 'dom',
      testEnvironment: 'jest-environment-jsdom',
      testMatch: ['**/*.test.js']
    },
    {
      displayName: 'node',
      testEnvironment: 'node',
      testMatch: ['**/*.test.js']
    }
  ]
};

// node.test.js
/**
 * @jest-environment node
*/
```
---
<br>

## 5. Estructura de los tests 📂
- Los archivos de pruebas deben tener la extensión `.test.js`.
``` javascript
describe('Test in <Component>', () => {

    beforeAll(() => { console.log('beforeAll') });
  
    beforeEach(() => { console.log('beforeEach') });
  
    test('Should return true', () => {
      // Arrange
      const value = true;
  
      // Act
      const result = value;
  
      // Assert
      expect(result).toBe(value);
    });
  
    afterEach(() => { console.log('afterEach') });
  
    afterAll(() => { console.log('afterAll') });
});
```
---
<br>

## 6. Métodos de prueba 🧪
| Métodos de prueba                           | Descripción                                                                                        |
|---------------------------------------------|----------------------------------------------------------------------------------------------------|
|toBe(value)                                  | Compara si el valor es igual (misma referencia en memoria)                                         |
|toBeCloseTo(value, precision)                | Compara si el valor es cercano a.                                                                  |
|toBeDefined()                                | Compara si el valor está definido.                                                                 |
|toBeFalsy()                                  | Compara si el valor es falso.                                                                      |
|toBeGreaterThan(value)                       | Compara si el valor es mayor que.                                                                  |
|toBeGreaterThanOrEqual(value)                | Compara si el valor es mayor o igual que.                                                          |
|toBeLessThan(value)                          | Compara si el valor es menor que.                                                                  |
|toBeLessThanOrEqual(value)                   | Compara si el valor es menor o igual que.                                                          |
|toBeNull()                                   | Compara si el valor es nulo.                                                                       |
|toBeTruthy()                                 | Compara si el valor es verdadero.                                                                  |
|toBeUndefined()                              | Compara si el valor es indefinido.                                                                 |
|toContain(value)                             | Compara si el valor contiene.                                                                      |
|toEqual(value)                               | Compara si el valor es igual. (que b tenga el mismo contenido que a)                               |
|toStrictEqual(value)                         | Compara si el valor es estrictamente igual. (que b tenga el mismo contenido que a y el mismo tipo) |
|toHaveBeenCalled()                           | Verifica si el valor fue llamado.                                                                  |
|toHaveBeenLastCalledWith(value)              | Compara si el valor fue llamado con.                                                               |
|toHaveLength(value)                          | Compara si el valor tiene una longitud.                                                            |
|toHaveReturnedWith(value)                    | Compara si el valor ha devuelto.                                                                   |
|toMatch(regexp)                              | Compara si el valor coincide con una expresión regular.                                            |
|toMatchInlineSnapshot()                      | Compara si el valor coincide con una instantánea.                                                  |
|toMatchInlineSnapshot(snapshot)              | Compara si el valor coincide con una instantánea.                                                  |
|toMatchSnapshot()                            | Compara si el valor coincide con una instantánea.                                                  |
|toThrow(error)                               | Compara si el valor lanza una excepción.                                                           |
|toThrowErrorMatchingInlineSnapshot()         | Compara si el valor lanza una excepción.                                                           |
|toThrowErrorMatchingInlineSnapshot(snapshot) | Compara si el valor lanza una excepción.                                                           |
|toThrowErrorMatchingSnapshot()               | Compara si el valor lanza una excepción.                                                           |
---
<br>

## 7. Tipos de Tests 🏷️
### 7.1.Con tipos de datos
```javascript
test('Should return types', () => {
  // Arrange
  const name = "Richard";
  const age = 25;

  // Act
  const result1 = "string";
  const result2 = "number";

  // Assert
  expect(result1).toBe(typeof name);
  expect(result2).toBe(typeof age);

  expect(name).toEqual(expect.any(String));
  expect(age).toEqual(expect.any(Number));
});
```

### 7.2. Con objetos
```javascript
test('Should return objects', () => {
  // Arrange
  const expectedPerson = { name: "Richard", age: 25 };
  // Act
  const resultPerson = { name: "Richard", age: 25, country: "Spain" };

  // Assert
  expect(resultPerson).toEqual(expectedPerson);        // Falla porque no tienen el mismo contenido.
  expect(resultPerson).toMatchObject(expectedPerson);  // Pasa porque solo compara las propiedades que tiene el objeto esperado.
});
```

### 7.3 Con arreglos
```javascript
test('Should return arrays', () => {
  // Arrange
  const expectedColors = ["red", "green", "blue"];

  // Act
  const resultColors = ["red", "green", "blue"];

  // Assert
  expect(resultColors).toEqual(expectedColors);        // Pasa porque compara el contenido de los arreglos.
  expect(resultColors).toContain("red");               // Pasa porque contiene el valor "red".
  expect(resultColors).toHaveLength(3);                // Pasa porque tiene una longitud de 3.
});
```

### 7.4. Con funciones
```javascript
test('Should return functions', () => {
  // Arrange
  const callback = () => "Hello World";

  // Act
  const result = () => "Hello World";

  // Assert
  expect(result).toEqual(callback);                    // Pasa porque compara la referencia de la función.
  expect(result).toBeInstanceOf(Function);             // Pasa porque es una instancia de Function.
});
```

### 7.5. Con promesas
```javascript
test('Should return user by id', (done) => {
  // Arrange
  const expectedUser = { id: 1, name: "Richard" };

  // Act
  getUserById(expectedUser.id).
  then(resultUser => {
    // Assert
    expect(resultUser).toEqual(expectedUser);          // Pasa porque compara el contenido de los objetos.
    done();                                            // Llama a done() para indicar que la prueba ha terminado.
  });
});

test('Should return an error', (done) => {
  // Arrange
  const expectedError = "User not found";

  // Act
  getUserById(2).
  catch(error => {
    // Assert
    expect(error).toBe(expectedError);                 // Pasa porque lanza ese error.
    done();                                            // Llama a done() para indicar que la prueba ha terminado.
  });
});
```

### 7.6. Con async/await
```javascript
test('Should return user by id', async () => {
  // Arrange
  const expectedUser = { id: 1, name: "Richard" };

  // Act
  const resultUser = await getUserById(expectedUser.id); 

  // Assert
  expect(resultUser).toEqual(expectedUser);            // Pasa porque compara el contenido de los objetos.
});

test('Should return an error', async () => {
  // Arrange
  const expectedError = "User not found";

  // Act
  const resultUser = await getUserById(2);
  
  // Assert
  expect(resultUser).toBe(expectedError);              // Pasa si el error se lanza directamente.
  //expect(resultUser).rejects.toThrow(expectedError); // Pasa si el error se lanza como una promesa.
});
```

### 7.7. Con mocks
- `jest.fn()`: Crea una función simulada.
- `mockResolvedValue(value)`: Establece el valor de retorno de la función simulada (promesa).
- `mockRejectedValue(value)`: Establece el valor de error de la función simulada (promesa).
- `mockImplementation(value)`: Establece la implementación de la función simulada (callback).
- `mockImplementationOnce(value)`: Establece la implementación de la función simulada una vez (callback).
- `toHaveBeenCalledTimes(value)`: Verifica cuántas veces se ha llamado la función simulada.
- `toHaveBeenCalledWith(value)`: Verifica si la función simulada se ha llamado con un valor.
- `toHaveReturnedWith(value)`: Verifica si la función simulada ha devuelto un valor (promesa).
- `toHaveReturnedTimes(value)`: Verifica cuántas veces ha devuelto un valor la función simulada (promesa).
- `toHaveLastReturnedWith(value)`: Verifica si la función simulada ha devuelto un valor la última vez (promesa).
- `toHaveNthReturnedWith(value)`: Verifica si la función simulada ha devuelto un valor en la posición n (promesa).
- `mockClear()`: Limpia la función simulada (resetea).
- `mockReset()`: Restablece la función simulada a su estado original.
- `mockRestore()`: Restaura la función simulada (restablece y elimina).
- `mockReturnValue(value)`: Establece el valor de retorno de la función simulada (callback).
- `mockReturnValueOnce(value)`: Establece el valor de retorno de la función simulada una vez (callback).

```javascript
test('Should return user by id', async () => {
  // Arrange
  const expectedUser = { id: 1, name: "Richard" };
  const getUserById = jest.fn().mockResolvedValue(expectedUser);

  // Act
  const resultUser = await getUserById(expectedUser.id);

  // Assert
  expect(resultUser).toEqual(expectedUser);
  expect(getUserById).toHaveBeenCalledTimes(1);
});
```
---
<br>

## 8. Testing con Arquitectura 🏗️
### 8.1. Testing en Controlador
- Si se usan contenedores jest te permiter crear una carpeta `__mocks__` dentro de la carpeta del contenedor:
```javascript
// back/01-common/container/__mocks__/UserIoC.js
const mockUserService = {
    create: jest.fn(),
    findById: jest.fn(),
    update: jest.fn(),
    delete: jest.fn()
};

export const getUserService = jest.fn(() => mockUserService);
```

```javascript
// Importaciones
import { getUserService } from "../../../../back/01-common/container/UserIoC.js";
import JWTService from "../../../../back/03-domain/service/JWTService.js";

/******************* MOCKS *******************/
jest.mock("../../../../back/01-common/container/UserIoC.js");
jest.mock("../../../../back/03-domain/service/JWTService.js");

describe("Testing UserContoller", async() => {

    /******************* SET UP *******************/
    const userService = getUserService();
    const jwtService = new JWTService();

    /******************* TESTS *******************/
    test("Should throw error if user not found", async () => {
        // Arrange
        const req = { 
          user: { getId: jest.fn().mockReturnValue("userId") },
          body: { id: 1 },
          params: { id: 1 }
        };
        const res = { 
          status: jest.fn().mockReturnThis(),
          json: jest.fn() 
        };
        const status = 404;
        const json = { error: "User not found" };

        userService.getUserById.mockResolvedValue(null);

        // Act
        await userController.getUserById(req, res);

        // Assert
        expect(res.status).toHaveBeenCalledWith(status);
        expect(res.json).toHaveBeenCalledWith(json);
    });

    test("Should return user by id", async () => {
        // Arrange
        const req = { 
          user: { getId: jest.fn().mockReturnValue("userId") },
          body: { id: 1 },
          params: { id: 1 }
        };
        const res = { 
          status: jest.fn().mockReturnThis(),
          json: jest.fn() 
        };
        const status = 200;
        const json = { id: 1, name: "Richard" };

        userService.getUserById.mockResolvedValue(json);

        // Act
        await userController.getUserById(req, res);

        // Assert
        expect(res.status).toHaveBeenCalledWith(status);
        expect(res.json).toHaveBeenCalledWith(json);
    });
});
```
<br><br><br>

## *[volver al índice](../../../README.md)*