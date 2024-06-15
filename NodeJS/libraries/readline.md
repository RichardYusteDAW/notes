# Readline
Es un módulo que permite leer datos de un stream (como un proceso de entrada estándar) línea por línea. Es útil para leer la entrada del usuario desde la línea de comandos.

## 1. Web Site 🌐
[Readline](https://nodejs.org/api/readline.html)

---
<br>

## 2. Instalar módulo 🔧
No se instala, ya viene con NodeJS.

---
<br>

## 3. Importar módulo 📥
```javascript
const readline = require('readline');
```
---
<br>

## 4. Crear interfaz 🖥️
```javascript
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
```
---
<br>

## 5. Métodos de la interfaz 🛠️
- **question**: Muestra un mensaje al usuario y espera a que introduzca una respuesta.
- **close**: Cierra la interfaz.
- **on**: Escucha eventos (line, close, etc.).
- **write**: Escribe en la salida estándar.
- **clearLine**: Borra la línea actual.
- **cursorTo**: Mueve el cursor a una posición concreta.
- **moveCursor**: Mueve el cursor una cantidad de posiciones.
```javascript
rl.question('Pregunta: ', (answer) => {          // Muestra un mensaje y espera respuesta.
    console.log(`Respuesta: ${answer}`);
    rl.close();                                  // Cierra la interfaz.
});

rl.on('close', () => {                           // Escucha el evento 'close' y muestra un mensaje al cerrar.
    console.log('Cerrado');
});

rl.write('Escribir en la salida estándar\n');    // Escribe en la salida estándar.
rl.clearLine();                                  // Borra la línea actual.
rl.cursorTo(10);                                 // Mueve el cursor a la derecha del caracter 10 de la línea actual.
rl.moveCursor(1, 1);                             // Mueve el cursor una posición a la derecha y una abajo.
```
---
<br><br><br>

## *[volver al índice](../../index.md)*