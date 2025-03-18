# Jest
Es un framework de pruebas para JavaScript creado por Facebook. Se enfoca en la simplicidad y la velocidad. Funciona con proyectos que utilizan: Babel, TypeScript, Node, React, Angular, Vue y más.

## 1. Web Site 🌐
- [https://jestjs.io](https://jestjs.io)
---
<br>

## 2. Instalación 📦
- Con npm: `npm install --save-dev jest`
- Con yarn: `yarn add --dev jest`

### 2.1. @types/jest
- Es un paquete que contiene las definiciones de tipos de TypeScript para Jest y ayuda a que TypeScript reconozca las funciones y métodos de Jest.
  - Con npm: `npm install --save-dev @types/jest`
  - Con yarn: `yarn add --dev @types/jest`

### 2.2. babel-jest, @babel/core, @babel/preset-env
- `babel-jest`: Permite utilizar Babel con Jest.
- `@babel/core`: Núcleo de Babel.
- `@babel/preset-env`: Conjunto de plugins de Babel para compilar JavaScript moderno a JavaScript compatible con versiones anteriores.
  - Con npm: `npm install --save-dev babel-jest @babel/core @babel/preset-env`
  - Con yarn: `yarn add --dev babel-jest @babel/core @babel/preset-env`
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
- `toBe(value)`: Compara si el valor es igual.
- `toBeCloseTo(value, precision)`: Compara si el valor es cercano a.
- `toBeDefined()`: Compara si el valor está definido.
- `toBeFalsy()`: Compara si el valor es falso.
- `toBeGreaterThan(value)`: Compara si el valor es mayor que.
- `toBeGreaterThanOrEqual(value)`: Compara si el valor es mayor o igual que.
- `toBeLessThan(value)`: Compara si el valor es menor que.
- `toBeLessThanOrEqual(value)`: Compara si el valor es menor o igual que.
- `toBeNull()`: Compara si el valor es nulo.
- `toBeTruthy()`: Compara si el valor es verdadero.
- `toBeUndefined()`: Compara si el valor es indefinido.
- `toContain(value)`: Compara si el valor contiene.
- `toEqual(value)`: Compara si el valor es igual.
- `toHaveBeenCalled()`: Verifica si el valor fue llamado.
- `toHaveBeenLastCalledWith(value)`: Compara si el valor fue llamado con.
- `toHaveLength(value)`: Compara si el valor tiene una longitud.
- `toHaveReturnedWith(value)`: Compara si el valor ha devuelto.
- `toMatch(regexp)`: Compara si el valor coincide con una expresión regular.
- `toMatchInlineSnapshot()`: Compara si el valor coincide con una instantánea.
- `toMatchInlineSnapshot(snapshot)`: Compara si el valor coincide con una instantánea.
- `toMatchSnapshot()`: Compara si el valor coincide con una instantánea.
- `toThrow(error)`: Compara si el valor lanza una excepción.
- `toThrowErrorMatchingInlineSnapshot()`: Compara si el valor lanza una excepción.
- `toThrowErrorMatchingInlineSnapshot(snapshot)`: Compara si el valor lanza una excepción.
- `toThrowErrorMatchingSnapshot()`: Compara si el valor lanza una excepción.
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
  const resultPerson = { name: "Richard", age: 25 };

  // Assert
  expect(resultPerson).toEqual(expectedPerson);
  expect(resultPerson).toMatchObject(expectedPerson);
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
  expect(resultColors).toEqual(expectedColors);
  expect(resultColors).toContain("red");
  expect(resultColors).toHaveLength(3);
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
  expect(result).toEqual(callback);
  expect(result).toBeInstanceOf(Function);
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
    expect(resultUser).toEqual(expectedUser);
    done();
  });
});

test('Should return an error', (done) => {
  // Arrange
  const expectedError = "User not found";

  // Act
  getUserById(2).
  catch(error => {
    // Assert
    expect(error).toBe(expectedError);
    done();
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
  expect(resultUser).toEqual(expectedUser);
});

test('Should return an error', async () => {
  // Arrange
  const expectedError = "User not found";

  // Act
  const resultUser = await getUserById(2);
  
  // Assert
  expect(resultUser).toBe(expectedError);
  //expect(resultUser).rejects.toThrow(expectedError);
});
```

### 7.7. Con mocks
- `jest.fn()`: Crea una función simulada.
- `mockResolvedValue(value)`: Establece el valor de retorno de la función simulada.
- `mockRejectedValue(value)`: Establece el valor de error de la función simulada.
- `mockImplementation(value)`: Establece la implementación de la función simulada.
- `mockImplementationOnce(value)`: Establece la implementación de la función simulada una vez.
- `toHaveBeenCalledTimes(value)`: Verifica cuántas veces se ha llamado la función simulada.
- `toHaveBeenCalledWith(value)`: Verifica si la función simulada se ha llamado con un valor.
- `toHaveReturnedWith(value)`: Verifica si la función simulada ha devuelto un valor.
- `toHaveReturnedTimes(value)`: Verifica cuántas veces ha devuelto un valor la función simulada.
- `toHaveLastReturnedWith(value)`: Verifica si la función simulada ha devuelto un valor la última vez.
- `toHaveNthReturnedWith(value)`: Verifica si la función simulada ha devuelto un valor en la posición n.
- `mockClear()`: Limpia la función simulada.
- `mockReset()`: Restablece la función simulada.
- `mockRestore()`: Restaura la función simulada.
- `mockReturnValue(value)`: Establece el valor de retorno de la función simulada.
- `mockReturnValueOnce(value)`: Establece el valor de retorno de la función simulada una vez.

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
<br><br><br>

## *[volver al índice](../../../README.md)*