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
<br>

## 6. TypeScript 📝
- TypeScript es un superconjunto de JavaScript que añade tipado estático y objetos basados en clases.
- Permite detectar errores en tiempo de compilación.
- Se compila a JavaScript para ser ejecutado en cualquier navegador o servidor.

### 6.1. Instalar TypeScript
```npm install -g typescript```

### 6.2. Iniciar TypeScript
- Este comando crea un archivo de configuración llamado `tsconfig.json`:  
```tsc --init```
```json
{
  "compilerOptions": {
    "target": "es5",                          // Versión de ECMAScript
    "module": "commonjs",                     // Sistema de módulos.
    "outDir": "./dist",                       // Directorio de salida de los archivos compilados
    "strict": true,                           // Habilita todas las opciones de comprobación de TypeScript
    "moduleResolution": "node",               // Resolución de módulos
    "esModuleInterop": true,                  // Habilita interoperabilidad entre CommonJS y ES6
    "skipLibCheck": true,                     // Evita la comprobación de librerías
    "forceConsistentCasingInFileNames": true  // Obliga a que los nombres de archivo tengan la misma capitalización 
  }
}
```

### 6.3. Compilar TypeScript
- Este comando compila todos los archivos TypeScript del proyecto y crea el directorio `dist` con los archivos JavaScript:  
```tsc    # Con la opción --watch (tsc -w) se compila automáticamente al guardar cambios```

### 6.4. Tslint
- TSLint es una herramienta de análisis estático de código para TypeScript que ayuda a mantener un código limpio y consistente ya que detecta errores y problemas de estilo.

#### 6.4.1. Instalar TSLint
```npm install tslint --save-dev```

#### 6.4.2. Iniciar TSLint
- Este comando crea un archivo de configuración llamado `tslint.json`:  
```./node_modules/.bin/tslint --init```
```json
{
  "defaultSeverity": "error", // Nivel de severidad por defecto
  "extends": [
      "tslint:recommended"    // Reglas recomendadas por TSLint
  ],
  "jsRules": {},              // Reglas para archivos JavaScript
  "rules": {
      "no-console": false     // Deshabilita la regla no-console para que no muestre errores por usar console.log
  },
  "rulesDirectory": []        // Directorio de reglas personalizadas
}
```

### 6.5. Instalar módulos de terceros
```npm install @types/<package>```

### 6.6. Tipado de variables
```typescript
let a: string = 'Hola';                   // String
let a: number = 5;                        // Number
let a: boolean = true;                    // Boolean
let a: any = 'Hola';                      // Cualquier tipo
let a: string[] = ['Hola', 'Adiós'];      // Array de strings
let a: Array<string> = ['Hola', 'Adiós']; // Array de strings
let a: [string, number] = ['Hola', 5];    // Tupla
let a: void = undefined;                  // No tiene tipo
let a: null = null;                       // Null
let a: undefined = undefined;             // Undefined
let a: never = undefined;                 // Nunca ocurre
let a: Application = new Application();   // Clase
```
---
<br><br><br>

## *[volver al índice](../index.md)*