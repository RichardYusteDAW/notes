# Testing Library
Es una librería que permite realizar pruebas de componentes de React de forma sencilla y eficiente. Se basa en la filosofía de que las pruebas deben simular la forma en que los usuarios interactúan con la aplicación.

## 1. Web Site 🌐
- [https://testing-library.com](https://testing-library.com)
---
<br>

## 2. Instalación 📦
- Con npm: `npm install --save-dev @testing-library/react`
- Con yarn: `yarn add --dev @testing-library/react`

### 2.1. @testing-library/jest-dom
- Es una librería que contiene funciones de utilidad para probar el DOM.
  - Con npm: `npm install --save-dev @testing-library/jest-dom`
  - Con yarn: `yarn add --dev @testing-library/jest-dom`

### 2.2. @babel/preset-react
- Conjunto de plugins de Babel para compilar React.
  - Con npm: `npm install --save-dev @babel/preset-react`
  - Con yarn: `yarn add --dev @babel/preset-react`
```json
// babel.config.json
module.exports = {
    presets: [
        [ '@babel/preset-env', { targets: { esmodules: true } } ],
        [ '@babel/preset-react', { runtime: 'automatic' } ],
    ],
};
```
---
<br>

## 3. Configuración 🛠️
Para configurar Testing Library, se debe crear un archivo llamado `jest.config.js` en la raíz del proyecto:
```javascript
// jest.config.js
module.exports = {
  projects: [
    {
      displayName: 'dom',
      testEnvironment: 'jest-environment-jsdom',
      testMatch: ['**/*.test.js']
    }
  ]
};
```
---
<br>

## 4. Métodos de Testing Library 🧪
- `render`: Renderiza un componente de React.
- `screen`: Contiene funciones para buscar elementos en el DOM.
- `fireEvent`: Dispara eventos en los elementos.
- `waitFor`: Espera a que se cumpla una condición.
- `act`: Envuelve las funciones asíncronas.
- `cleanup`: Limpia el DOM después de cada prueba.
- `within`: Busca elementos dentro de un contenedor.
- `getBy`: Busca un elemento por un selector.
  - `getByLabelText`
    - `getByAltText`: Busca un elemento por el atributo `alt`.
    - `getByDisplayValue`: Busca un elemento por el valor que muestra.
    - `getByLabelText`: Busca un elemento por el texto de la etiqueta.
    - `getByPlaceholderText`: Busca un elemento por el texto del placeholder.
    - `getByRole`: Busca un elemento por el atributo `role`.
    - `getBySelectText`: Busca un elemento por el texto de la opción seleccionada.
    - `getByTestId`: Busca un elemento por el atributo `data-testid`.
    - `getByText`: Busca un elemento por el texto.
    - `getByTitle`: Busca un elemento por el atributo `title`.
- `queryBy`: Busca un elemento por un selector y devuelve null si no lo encuentra.
- `findBy`: Busca un elemento por un selector de forma asíncrona.
- `getAllBy`: Busca todos los elementos por un selector.
- `queryAllBy`: Busca todos los elementos por un selector y devuelve un array vacío si no encuentra ninguno.
- `findAllBy`: Busca todos los elementos por un selector de forma asíncrona.
---
<br>

## 5. Testear un componente 🧪
```javascript
import { render, screen } from '@testing-library/react';
import Component from './Component';

test('Should match with snapshot', () => {
  const {container} = render(<Component />);
  expect(container).toMatchSnapshot();
});

test('Should be the title', () => {
  render(<Component />);
  // screen.debug();
  const title = "Hello, World!";
  const titleElement = screen.getByText(title);

  expect(titleElement).toBeInTheDocument();
});
```

### 5.1. Testear eventos 🧪
```javascript
import { render, screen, fireEvent } from '@testing-library/react';
import Component from './Component';

test('Should update the input value when button is clicked', () => {
  // Arrange
  render(<Component />);
  const input = screen.getByRole('textbox');
  expect(input.value).toBe('10');

  // Act
  const button = screen.getByRole('button', { name: 'Increment' }); // Tiene una etiqueta aria-label="Increment"
  fireEvent.click(button);

  // Assert
  expect(input.value).toBe('11');
});
```

---
<br>







<br><br><br>

## *[volver al índice](../../../README.md)*