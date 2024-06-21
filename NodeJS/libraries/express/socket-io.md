# Socket.io
Es un módulo que permite la comunicación en tiempo real entre el servidor y el cliente, utilizando WebSockets.
WebSockets es un protocolo de comunicación bidireccional que permite la comunicación en tiempo real entre el servidor y el cliente.

## 1. Web Site 🌐
[Socket.io](https://socket.io/docs/)  
[WebSockets](https://developer.mozilla.org/es/docs/WebSockets)

---
<br>

## 2. Instalar módulo 🔧
`npm install socket.io`

---
<br>

## 3. Utilizar en el servidor 🖥
```javascript
const http = require('http');          // Importar módulo http
const express = require('express');    // Importar módulo express
const initSocket = require('./path/to/initSocket');

const app = express();                 // Crear una instancia de express
const server = http.createServer(app); // Crear un servidor http

initSocket(server);                    // Inicializar socket.io (Extraemos la lógica de socket.io a un archivo externo)

server.listen(3000, () => {
    console.log('Server running on port 3000');
});
```

```javascript
const socketio = require('socket.io'); // Importar módulo socket.io

const initializeSocket = (server) => {
    const io = socketio(server);       // Crear una instancia de socket.io
    
    const namespace = io.of('/chat');  // Crear un espacio de nombres. El socket solo se conectará a esta ruta.

    namespace.on('connection', (socket) => {
        console.log('Cliente conectado al chat.');

        socket.on('message', (msg) => {
            io.of('/chat').emit('message', msg);
        });

        socket.on('disconnect', () => {
            console.log('Cliente desconectado del chat.');
        });
    });
};

module.exports = initializeSocket;
```
---
<br>

## 4. Utilizar en el cliente 🖥️
```html
<!DOCTYPE html>
<html lang="en">
<header>
    <title>Chat</title>
</header>
<body>
    <script src="/socket.io/socket.io.js"></script>
    <script src="/js/chat.js"></script>
</body>
</html>
```
```javascript
const socket = io('/chat');
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

## 5. Métodos 🛠️
```javascript
socket.emit('event', data, res => console.log(res));  // Enviar un evento al servidor y recibir una respuesta.

socket.on('event', (data, res) => {
    console.log(data);                                // Recibir un evento del servidor y enviar una respuesta.
    res('Response');                                  // Enviar una respuesta al servidor.
});

socket.broadcast.emit('event', data);                 // Enviar un evento a todos los clientes, excepto al que lo emitió.
socket.to('user').broadcast.emit('event', data);      // Enviar un evento a un cliente específico.
socket.to('room').broadcast.emit('event', data);      // Enviar un evento a una una sala específica.

socket.join('room');                                  // Unirse a una sala.
socket.leave('room');                                 // Abandonar una sala.

socket.disconnect();                                  // Desconectarse del servidor.

io.of('namespace').on('event', socket => {            // Crear un espacio de nombres.
    socket.emit('event', data);                       // Enviar un evento a un cliente específico.
});         
```
## 5. Eventos 📡
### 5.1. En el lado del servidor:
```javascript	
| Evento              | Descripción                                                                     |
|---------------------|---------------------------------------------------------------------------------|
| `connection`        | Se ejecuta cuando un cliente se conecta al servidor.                            |
| `disconnect`        | Se ejecuta cuando un cliente se desconecta del servidor.                        |
| `join`              | Se utiliza para unirse a una sala.                                              |
| `leave`             | Se utiliza para abandonar una sala.                                             |
| `broadcast`         | Se utiliza para enviar mensajes a todos los clientes excepto al que lo emitió.  |
| `to`                | Se utiliza para enviar mensajes a un cliente específico en una sala específica. |
| `disconnecting`     | Se ejecuta justo antes de que un cliente se desconecte completamente.           |
```

### 5.2. En el lado del cliente:
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

### 5.3. En ambos lados:
```javascript
| Evento              | Descripción                                                                     |
|---------------------|---------------------------------------------------------------------------------|
| `error`             | Se ejecuta cuando se produce un error.                                          |
| `ping`              | Enviado periódicamente por el cliente para verificar la conexión.               |
| `pong`              | Enviado en respuesta a un `ping`.                                               |
```
<br><br><br>

## *[volver al índice](../../../index.md)*