# Socket.io
Socket.io es una biblioteca que utiliza el protocolo WebSockets.  
WebSockets  permite la comunicación bidireccional , de baja latencia y basada en eventos entre un cliente y un servidor.

## 1. Web Site 🌐
[Socket.io](https://socket.io/docs/)  
[WebSockets](https://developer.mozilla.org/es/docs/Web/API/WebSockets_API)

---
<br>

## 2. Instalar módulo 🔧
`npm install socket.io`

---
<br>

## 3. Utilizar en el servidor 🖥
### 3.1. Con Server de Socket.io
- `Server`: es una clase de socket.io que se utiliza para crear un servidor de WebSockets.
```javascript
const { Server } = require('socket.io');          // Importar módulo socket.io

const io = new Server(3000,{ /* options */ });    // Crear una instancia de socket.io

io.on('connection', (socket) => {                 // Escuchar la conexión de un cliente
    // ...
});

io.listen();                                      // Iniciar el servidor (no se especifica el puerto si se hace arriba)
```

### 3.2. Con Server HTTP
```javascript
const { createServer } = require('http');         // Importar la función createServer del módulo http
const { Server } = require('socket.io');          // Importar la clase Server del módulo socket.io

const server = createServer();                    // Crear una instancia de http
const io = new Server(server, { /* options */ }); // Crear una instancia de socket.io

io.on('connection', (socket) => {                 // Escuchar la conexión de un cliente
    // ...
});

server.listen(3000);                              // Iniciar el servidor en el puerto 3000
```

### 3.3. Con HTTPS
```javascript
const { createServer } = require('https');        // Importar la función createServer del módulo https
const { Server } = require('socket.io');          // Importar la clase Server del módulo socket.io
const { readFileSync } = require('fs');           // Importar la función readFileSync del módulo fs

const server = createServer({
    key: readFileSync('key.pem'),                 // Clave privada
    cert: readFileSync('cert.pem'),               // Certificado
});

const io = new Server(server, { /* options */ }); // Crear una instancia de socket.io

io.on('connection', (socket) => {                 // Escuchar la conexión de un cliente
    // ...
});

server.listen(3000);                              // Iniciar el servidor en el puerto 3000
```

### 3.4. Con Express
```javascript
const express = require('express');               // Importar módulo express
const { createServer } = require('http');         // Importar la función createServer del módulo http
const { Server } = require('socket.io');          // Importar la clase Server del módulo socket.io

const app = express();                            // Crear una instancia de express
const server = createServer(app);                 // Crear una instancia de http utilizando express como servidor
const io = new Server(server, { /* options */ }); // Crear una instancia de socket.io

// Podríamos extraer la lógica de socket.io a un archivo externo: chat(io)
io.on('connection', (socket) => {                 // Escuchar la conexión de un cliente
    // ...
});

server.listen(3000);                              // Iniciar el servidor en el puerto 3000
```

### 3.5. Lógica de Socket.io
```javascript
const chat = (io) => {
    const namespace = io.of('/chat');             // Crear un espacio de nombres. El socket solo se conectará a esta ruta.

    namespace.on('connection', (socket) => {      // Escuchar la conexión de un cliente en el espacio de nombres.
        console.log('Cliente conectado al chat.');

        socket.on('message', (msg) => {           // Escuchar mensajes (evento personalizado)
            io.of('/chat').emit('message', msg);
        });

        socket.on('disconnect', () => {           // Escuchar la desconexión de un cliente.
            console.log('Cliente desconectado del chat.');
        });
    });
};

module.exports = chat;
```
---
<br>

## 4. Utilizar en el cliente 🖥️
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Chat</title>
</head>
<body>
    <script src="/socket.io/socket.io.js"></script>
    <script src="/js/chat.js"></script>
</body>
</html>
```
```javascript
// Si se le pasa una ruta (io('/chat')) solo se conectará a esa ruta.
const socket = io();                                  // io() es una función que se conecta al servidor gracias al <script> en el HTML.
const message = document.getElementById('message');
const send = document.getElementById('send')

send.addEventListener('click', () => {                // Enviar mensaje cuando se haga clic en el botón con id 'send'.
    socket.emit('message', message.value);            // Emitir un mensaje con el valor del input con id 'message'.
    message.value = '';                               // Limpiar el campo de texto del input.
})

const messages = document.getElementById('messages'); // Obtener el elemento ul con id 'messages'.
socket.on('message', (msg) => {                       // Recibir mensajes.
    const item = document.createElement('li');        // Crear un elemento de lista.
    item.textContent = msg;                           // Asignar el mensaje al elemento de lista.
    messages.appendChild(item);                       // Agregar el elemento de lista al elemento ul.
});
```
---
<br>

## 5. Espacios de nombres 🛣️
### 5.1. En el lado del servidor:
```javascript
const namespace = io.of('/chat');                     // Crear un espacio de nombres. El socket solo se conectará a esta ruta.

namespace.on('connection', (socket) => {              // Escuchar la conexión de un cliente en el espacio de nombres.
    // ...
});
```

### 5.2. En el lado del cliente:
```javascript
const socket = io('/chat');                           // io('/chat') es una función que se conecta al servidor en la ruta '/chat'.
```
---
<br>

## 6. Métodos 🛠️
```javascript
socket.on('event', (data, res) => {
    console.log(data);                                // Recibir un evento del servidor y enviar una respuesta.
    res('Response');                                  // Enviar una respuesta al servidor.
});

socket.emit('event', data, res => console.log(res));  // Enviar un evento al servidor y recibir una respuesta.
socket.to('user').emit('event', data);                // Enviar un evento a un cliente específico. (Se debe especificar socket.id)
socket.to('room').emit('event', data);                // Enviar un evento a una sala específica.

socket.broadcast.emit('event', data);                 // Enviar un evento a todos los clientes, excepto al emisor.
socket.broadcast.to('room').emit('event', data);      // Enviar un evento a todos los clientes de una sala, excepto al emisor.

socket.join('room');                                  // Unirse a una sala.
socket.leave('room');                                 // Abandonar una sala.

socket.disconnect();                                  // Desconectarse del servidor.

// Métodos disponibles en el lado del servidor (io):
io.on('connection', (socket) => {                     // Escuchar la conexión de un cliente.
    // ...
});
io.on('disconnect', (socket) => {                     // Escuchar la desconexión de un cliente.
    // ...
});
io.emit('event', data);                               // Enviar un evento a todos los clientes.
io.in('room').emit('event', data);                    // Enviar un evento a todos los clientes de una sala (Se puede utilizar to)
const namespace = io.of('/chat');                     // Crear un espacio de nombres. El socket solo se conectará a esta ruta.         
```
## 7. Eventos 📡
### 7.1. En el lado del servidor:
```javascript	
| Evento              | Descripción                                                                     |
|---------------------|---------------------------------------------------------------------------------|
| `connection`        | Se ejecuta cuando un cliente se conecta al servidor.                            |
| `disconnect`        | Se ejecuta cuando un cliente se desconecta del servidor.                        |
| `disconnecting`     | Se ejecuta justo antes de que un cliente se desconecte completamente.           |
```

### 7.2. En el lado del cliente:
```javascript
| Evento              | Descripción                                                                     |
|---------------------|---------------------------------------------------------------------------------|
| `connect`           | Se ejecuta cuando se conecta al servidor.                                       |
| `disconnect`        | Se ejecuta cuando se desconecta del servidor.                                   |
| `connect_error`     | Se ejecuta cuando hay un error durante la conexión inicial.                     |
| `connect_timeout`   | Se ejecuta cuando la conexión inicial excede el tiempo de espera configurado.   |
| `reconnect`         | Se ejecuta cuando el cliente se reconecta al servidor.                          |
| `reconnect_attempt` | Se ejecuta cuando el cliente intenta reconectar.                                |
| `reconnecting`      | Se ejecuta cuando el cliente está intentando reconectar.                        |
| `reconnect_error`   | Se ejecuta cuando hay un error durante la reconexión.                           |
| `reconnect_failed`  | Se ejecuta cuando todos los intentos de reconexión han fallado.                 |
```

### 7.3. En ambos lados:
```javascript
| Evento              | Descripción                                                                     |
|---------------------|---------------------------------------------------------------------------------|
| `error`             | Se ejecuta cuando se produce un error.                                          |
| `ping`              | Enviado periódicamente por el cliente para verificar la conexión.               |
| `pong`              | Enviado en respuesta a un `ping`.                                               |
```

### 7.4. Eventos personalizados:
```javascript
socket.on('customEvent', (data, res) => {
    console.log(data);                                // Recibir un evento del servidor y enviar una respuesta.
    res('Response');                                  // Enviar una respuesta al servidor.
});
```
<br><br><br>

## *[volver al índice](../../../index.md)*