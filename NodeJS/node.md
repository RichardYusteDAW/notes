# Node
- Es un entorno de ejecución que permite ejecutar código JavaScript en el servidor. 
- Está basado en el motor V8 de Google Chrome.
- Es un entorno asíncrono y orientado a eventos.

## 1. Web Site 🌐
[Node.js](https://nodejs.org/es/)

---
<br>

## 2. Características 📋
- **Asíncrono**: No espera a que una operación se complete para continuar con la siguiente.
- **Orientado a eventos**: Se basa en eventos, lo que permite que el servidor pueda responder a una petición sin bloquear el hilo de ejecución.
- **Single-thread**: Aunque el servidor es single-thread, puede manejar múltiples peticiones.
---
<br>

## 3. NPM 📦
- Node Package Manager es el gestor de paquetes de Node.js y permite instalar, actualizar y eliminar paquetes.

### 3.1. Comandos
```bash
npm -v                            # Muestra la versión de npm

npm init                          # Inicializa un proyecto de Node.js
npm init -y                       # Inicializa un proyecto de Node.js con valores por defecto

npm install                       # Instala todas las dependencias del proyecto
npm install --production          # Instala solo las dependencias de producción

npm install <package>             # Instala ese paquete
npm install <package> --save-dev  # Instala el paquete como dependencia de desarrollo (devDependencies)
npm install -g <package>          # Instala el paquete de forma global (local por defecto)

npm uninstall <package>           # Desinstala el paquete
npm update <package>              # Actualiza el paquete
npm list                          # Lista las dependencias del proyecto
npm list -g                       # Lista las dependencias globales
npm search <package>              # Busca un paquete
npm show <package> version        # Muestra la versión de un paquete
```
---
<br>

## 4. Importar módulos 📥
- Importar un módulo de Node:
  ```javascript
  const fs = require('fs');
  import fs from 'fs'; // New way (ES6)
  ```
- Importar módulos de terceros:
  ```javascript
  const express = require('express');
  import express from 'express'; // New way (ES6)
  ```
- Importar módulos propios:
  ```javascript
  const modulo = require('./path/modulo');
  import modulo from './path/modulo'; // New way (ES6)
  ```
- Importar solamente las funciones que nos interesen (para ello se debe exportar el módulo de esa forma):
  ```javascript
  const { funcion1, funcion2 } = require('./path/modulo');
  import { funcion1, funcion2 } from './path/modulo'; // New way (ES6)
  ```
  ---
  <br>

## 5. Exportar módulos 📤
- Exportar un módulo:
  ```javascript
  module.exports = modulo;
  export default modulo; // New way (ES6)
  ```
- Exportar solo las funciones que nos interesen:
  ```javascript
  module.exports = { funcion1, funcion2 };
  export { funcion1, funcion2 }; // New way (ES6)
  ```
- Exportar varios módulos:
  ```javascript
  module.exports = { modulo1, modulo2 };
  export { modulo1, modulo2 }; // New way (ES6)
  ```

### 5.1. Exportar con index.js
#### 5.1.1. Crear archivo index.js
```javascript
const modulo1 = require('../path/modulo1'); // This module exports funcion1 and funcion2
const modulo2 = require('../path/modulo2'); // This module exports funcion3
const modulo3 = require('../path/modulo3'); // This module exports funcion4 and funcion5

module.exports = { ...modulo1, ...modulo2, ...modulo3 };
```

#### 5.1.2. Importar módulos
```javascript
const { funcion1, funcion2, funcion3, funcion4, funcion5 } = require('../path'); // Old way
import { funcion1, funcion2, funcion3, funcion4, funcion5 } from '../path';      // New way (ES6)
```
---
<br><br><br>

## *[volver al índice](../index.md)*