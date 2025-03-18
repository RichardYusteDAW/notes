# React
Es una librería de JavaScript para construir interfaces de usuario. Es mantenido por Facebook y la comunidad de software libre.

## 1. Web Site 🌐
[https://es.reactjs.org](https://es.reactjs.org)

---
<br>

## 2. Crear proyecto 🔧
### 2.1. Create React App
- Es una herramienta para crear aplicaciones de React con un solo comando.
- Web Site: [Create React App](https://create-react-app.dev/)
- Crear proyecto:
  - Con NPM: `npx create-react-app my-app`
  - Con Yarn: `yarn create react-app my-app`

### 2.2. Vite
- Es un entorno de desarrollo para aplicaciones web modernas.
- Web Site: [Vite](https://vitejs.dev/)
- Crear proyecto:
  - Con NPM: `npm init vite@latest`
  - Con Yarn: `yarn create vite`

---
<br>

## 3. Instalar dependencias 📦
- Con NPM:
  - `npm install`
- Con Yarn:
  - `yarn`
---
<br>

## 4. Arrancar proyecto 🚀
### 4.1. Create React App
- Con NPM:
  - `npm start`: Arranca la aplicación en modo desarrollo.
  - `npm run build`: Compila la aplicación para producción.
  - `npm run test`: Ejecuta los tests.
  - `npm run eject`: Extrae las configuraciones de la aplicación.
- Con Yarn:
  - `yarn start`: Arranca la aplicación en modo desarrollo.
  - `yarn build`: Compila la aplicación para producción.
  - `yarn test`: Ejecuta los tests.
  - `yarn eject`: Extrae las configuraciones de la aplicación.

### 4.2. Vite
- Con NPM:
  - `npm run dev`: Arranca la aplicación en modo desarrollo.
  - `npm run build`: Compila la aplicación para producción.
  - `npm run serve`: Sirve la aplicación compilada.
  - `npm run preview`: Sirve la aplicación compilada en modo preview.
- Con Yarn:
  - `yarn dev`: Arranca la aplicación en modo desarrollo.
  - `yarn build`: Compila la aplicación para producción.
  - `yarn serve`: Sirve la aplicación compilada.
  - `yarn preview`: Sirve la aplicación compilada en modo preview.
---
<br>

## 5. Cargar React 📥
### 5.1. En HTML
- `React`: Librería principal de React.
- `React DOM`: Librería para manipular el DOM.
```html
<html>
    <head>
        <meta charset="UTF-8" />
        <script crossorigin src="https://unpkg.com/react@18/umd/react.production.min.js"></script>
        <script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.production.min.js"></script>
        <title>Curso de React</title>
    </head>

    <body>
        <div id="root"></div>
        <script>
            const divRoot = document.querySelector('#root');
            const name = 'Richard';
            const h1Tag = React.createElement('h1', null, `Hello ${name}`);
            ReactDOM.render(h1Tag, divRoot);
        </script>
    </body>
</html>
```

### 5.2. En HTML con Babel
- `Babel`: Compilador de JavaScript que permite usar JSX en el navegador.
```html
<html>
    <head>
        <meta charset="UTF-8" />
        <script crossorigin src="https://unpkg.com/react@18/umd/react.production.min.js"></script>
        <script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.production.min.js"></script>
        <script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
        <title>Curso de React</title>
    </head>

    <body>
        <div id="root"></div>
        <script type="text/babel">
            const divRoot = document.querySelector('#root');
            const name = 'Richard';
            const h1Tag = <h1>Hello {name}</h1>;
            ReactDOM.render(h1Tag, divRoot);
        </script>
    </body>
</html>
```

### 5.3 Con módulos
```html
<!-- index.html -->
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <title>Curso de React</title>
    </head>
    <body>
        <div id="root"></div>
        <script type="module" src="main.js"></script>
    </body>
</html>
```
```javascript
// main.js
import React from 'react';
import ReactDOM from 'react-dom';
import HelloWorld from './HelloWorld';
import './styles.css';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <React.StrictMode>
        <HelloWorld name="Richard" message="Esto es un mensaje"/>
    </React.StrictMode>
);
```
---
<br>

## 6. Componentes 🛠️
- Son funciones de JavaScript que devuelven un elemento de React.
```javascript
import React from 'react';

const HelloWorld = () => {
    return <h1>Hello World!</h1>;
}

export default HelloWorld;
```

### 6.1. Props y fragmentos
- `Props`: Son argumentos que se pasan a un componente.
- `Fragment`: Es un componente que no renderiza nada, pero permite agrupar una lista de elementos hijos entre: `<></>`
```javascript
// HelloWorld.js
const HelloWorld = (props) => ( 
    <>
        <h1>Hello {props.name}!</h1>
        <p>{props.message}</p>
    </>
);

export default HelloWorld;
```

### 6.2. PropTypes y DefaultProps
- `PropTypes`: Permite definir el tipo de las propiedades.
- `DefaultProps`: Permite definir valores por defecto para las propiedades.

```bash
npm install prop-types
```
```javascript
// HelloWorld.js
import PropTypes from 'prop-types';

const HelloWorld = (props) => (
    <>
        <h1>Hello {props.name}!</h1>
        <p>{props.message}</p>
    </>  
);

HelloWorld.propTypes = {
    name: PropTypes.string.isRequired,
    message: PropTypes.string
};

HelloWorld.defaultProps = {
    name: 'Richard',
    message: 'No hay mensaje'
};
```
---
<br>

## 7. Eventos 🎉
| Evento React        | Descripción                                                                                    |
|---------------------|------------------------------------------------------------------------------------------------|
| `onBlur`            | Se dispara cuando un elemento pierde el foco.                                                  |
| `onChange`          | Se activa cuando el valor de un input, select o textarea cambia.                               |
| `onClick`           | Se activa cuando el usuario hace clic en un elemento.                                          |
| `onContextMenu`     | Se activa cuando el usuario hace clic derecho en un elemento.                                  |
| `onCopy`            | Se dispara cuando el usuario copia el contenido de un elemento.                                |
| `onCut`             | Se dispara cuando el usuario corta el contenido de un elemento.                                |
| `onDoubleClick`     | Se activa cuando el usuario hace doble clic en un elemento.                                    |
| `onDrag`            | Se activa cuando un elemento o texto es arrastrado.                                            |
| `onDragEnd`         | Se activa cuando una operación de arrastre finaliza.                                           |
| `onDragEnter`       | Se activa cuando un elemento arrastrado entra en un área droppable.                            |
| `onDragExit`        | Se activa cuando un elemento arrastrado sale de un área droppable.                             |
| `onDragLeave`       | Se activa cuando un elemento arrastrado deja un área droppable.                                |
| `onDragOver`        | Se activa cuando un elemento arrastrado está siendo arrastrado sobre un área droppable.        |
| `onDragStart`       | Se activa cuando el usuario comienza a arrastrar un elemento.                                  |
| `onDrop`            | Se activa cuando un elemento es soltado sobre un área droppable.                               |
| `onFocus`           | Se dispara cuando un elemento recibe el foco.                                                  |
| `onInput`           | Se activa cuando un input recibe entrada del usuario.                                          |
| `onKeyDown`         | Se activa cuando el usuario presiona una tecla.                                                |
| `onKeyPress`        | Se activa cuando el usuario presiona una tecla que produce un carácter.                        |
| `onKeyUp`           | Se activa cuando el usuario suelta una tecla presionada.                                       |
| `onMouseDown`       | Se activa cuando el usuario presiona un botón del ratón sobre un elemento.                     |
| `onMouseEnter`      | Se activa cuando el cursor se mueve sobre un elemento.                                         |
| `onMouseLeave`      | Se activa cuando el cursor se mueve fuera de un elemento.                                      |
| `onMouseMove`       | Se activa cuando el cursor se mueve mientras está sobre un elemento.                           |
| `onMouseOut`        | Se activa cuando el cursor se mueve fuera de un elemento o de uno de sus hijos.                |
| `onMouseOver`       | Se activa cuando el cursor se mueve sobre un elemento o sobre uno de sus hijos.                |
| `onMouseUp`         | Se activa cuando el usuario suelta un botón del ratón que estaba presionado sobre un elemento. |
| `onPaste`           | Se dispara cuando el usuario pega contenido en un elemento.                                    |
| `onScroll`          | Se activa cuando se desplaza el contenido de un elemento.                                      |
| `onSelect`          | Se activa cuando el usuario selecciona texto de un elemento.                                   |
| `onSubmit`          | Se activa cuando se envía un formulario.                                                       |
| `onTouchCancel`     | Se activa cuando se cancela un toque en un dispositivo táctil.                                 |
| `onTouchEnd`        | Se activa cuando se levanta un dedo de un dispositivo táctil.                                  |
| `onTouchMove`       | Se activa cuando se mueve un dedo durante un toque en un dispositivo táctil.                   |
| `onTouchStart`      | Se activa cuando un dedo toca un dispositivo táctil.                                           |
| `onWheel`           | Se activa cuando se gira la rueda del ratón sobre un elemento.                                 |
<br>

Ejemplo:
```javascript
import React from 'react';

const Button = () => {
    const handleClick = () => {
        alert('Hola Mundo!');
    };

    return <button onClick={handleClick}>Click me!</button>;
}
```
---
<br>

## 8. Hooks 🎣
- Son funciones que permiten usar el estado y otras características de React en componentes funcionales.

### 8.1. useState
- Permite añadir estado a un componente funcional.
  - `count`: Estado actual.
  - `setCount`: Función que actualiza el estado y vuelva a renderizar el componente.
  - `useState(0)`: Valor inicial del estado.
```javascript
import { useState } from 'react';

const Counter = () => {
    const [count, setCount] = useState(0);

    return (
        <>
            <h1>{count}</h1>
            <button onClick={() => setCount(count + 1)}>Incrementar</button>
        </>
    );
}
```

### 8.2. useEffect
- Permite realizar efectos secundarios una vez que el componente ha sido renderizado y sujeto a alguna dependencia.
  - `useEffect(() => {}, [])`: Se ejecuta una sola vez.
  - `useEffect(() => {}, [count])`: Se ejecuta cada vez que `count` cambia.
```javascript
import { useState, useEffect } from 'react';

const Counter = () => {
    const [count, setCount] = useState(0);

    useEffect(() => {
        document.title = `Contador: ${count}`;

        // Cleanup
        return () => {
            document.title = 'Curso de React';
        };

    }, [count]);

    return (
        <>
            <h1>{count}</h1>
            <button onClick={() => setCount(count + 1)}>Incrementar</button>
        </>
    );
}
```

### 8.3. React.memo, useMemo y useCallback
- `React.memo`: Permite memorizar un componente funcional.
- `useMemo`: Permite memorizar un valor calculado.
- `useCallback`: Permite memorizar una función.
```javascript
import { useState, useMemo, useCallback } from 'react';

const Counter = () => {
    const [count, setCount] = useState(0);

    // Cada vez que se renderiza el componente, doubleCount seguirá siendo el mismo valor, a no ser que count cambie.
    const doubleCount = useMemo(() => count * 2, [count]);

    // useCallback para evitar re-creación innecesaria de la función
    const handleClick = useCallback(() => setCount((prevCount) => prevCount + 1), []);

    return (
        <>
            <h1>{count}</h1>
            <h2>{doubleCount}</h2>
            <button onClick={handleClick}>Incrementar</button>
            <MemoizedChildComponent count={doubleCount} />
        </>
    );
}

// Componente hijo memorizado que solo se actualiza si sus props cambian
const MemoizedChildComponent = React.memo(({ count }) => {
    console.log('Rendering ChildComponent');
    return <div>El doble del contador es: {count}</div>;
});
```

<br><br><br>

## *[volver al índice](../../../README.md)*