# Server Sent Events SSE
- **Server-Sent Events (SSE)** es una tecnología que permite a un servidor enviar actualizaciones en tiempo real a los clientes a través de una conexión HTTP persistente. 
- A diferencia de **WebSockets**, SSE es unidireccional, lo que significa que los datos fluyen del servidor al cliente.
---
<br>

## Server Response 📨
- Es el objeto `response` en Node.js que representa la respuesta HTTP que el servidor envía al cliente. 
- Permite definir cabeceras, estado y enviar datos al cliente.
---
<br>

## Cabeceras 🏷️
```javascript
const http = require('http');
const port = 3000;
const server = http.createServer((req, res) => {
    
    // Establecer las cabeceras de la respuesta:
    res.setHeader('Content-Type', 'text/event-stream'); // Tipo de contenido para SSE
    res.setHeader('Cache-Control', 'no-cache');         // Evita que el navegador almacene en caché la respuesta
    res.setHeader('Connection': 'keep-alive');          // Mantiene la conexión abierta para enviar múltiples eventos
    res.flushHeaders();                                 // Enviar las cabeceras inmediatamente al cliente

    // También se puede utilizar el método writeHead() (StatusCode, statusMessage, headers).
    /*
    res.writeHead(200, {
        'Content-Type': 'text/event-stream',
        'Cache-Control': 'no-cache',
        'Connection': 'keep-alive'
    });
    */

    // Enviar un evento SSE cada segundo:
    setInterval(() => {
        const data = `data: Hello World\n\n`;
        res.write(data);
    }, 1000);
});

server.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
});
```
---
<br>

## Propiedades y Métodos del objeto `response` ⚙️
| Propiedad / Método  | Tipo     | Descripción                                                                                |
| ------------------- | -------- | ------------------------------------------------------------------------------------------ |
| **addTrailers**     | Función  | Añade cabeceras de tipo 'trailer' al final de la respuesta.                                |
| **destroy**         | Función  | Cierra la conexión abruptamente, destruyendo el socket.                                    |
| **end**             | Función  | Finaliza la respuesta y cierra la conexión.                                                |
| **finished**        | Booleano | Indica si la respuesta se ha finalizado completamente.                                     |
| **flushHeaders**    | Función  | Envía inmediatamente las cabeceras HTTP al cliente.                                        |
| **getHeader**       | Función  | Recupera el valor de una cabecera ya definida.                                             |
| **headersSent**     | Booleano | Indica si las cabeceras ya han sido enviadas.                                              |
| **on**              | Función  | Añade un listener para un evento específico (por ejemplo, `close`, `finish`).              |
| **once**            | Función  | Añade un listener que se ejecuta solo la primera vez que ocurre el evento.                 |
| **removeHeader**    | Función  | Elimina una cabecera previamente definida.                                                 |
| **sendDate**        | Booleano | Si está a `true`, añade automáticamente la cabecera Date (por defecto, true).              |
| **setHeader**       | Función  | Define una cabecera HTTP en la respuesta.                                                  |
| **setTimeout**      | Función  | Establece un tiempo de espera (timeout) para la conexión.                                  |
| **socket**          | Objeto   | Referencia al socket de red de la conexión HTTP.                                           |
| **statusCode**      | Número   | Código de estado HTTP de la respuesta (por defecto, 200).                                  |
| **statusMessage**   | String   | Mensaje de estado HTTP (por defecto, 'OK').                                                |
| **write**           | Función  | Envía datos al cliente. En SSE, se usa para enviar eventos (`res.write('data: ...\n\n')`). |
| **writeContinue**   | Función  | Envía una respuesta 100 Continue.                                                          |
| **writeHead**       | Función  | Envía el estado y cabeceras HTTP (antiguo, pero aún se usa).                               |
| **writeProcessing** | Función  | Envía una respuesta 102 Processing (poco común).                                           |
| **writable**        | Booleano | Indica si el stream está abierto para escritura.                                           |
| **writableEnded**   | Booleano | Indica si la respuesta ya no permite más escrituras (ha sido cerrada para escritura).      |
*La diferencia entre `writable` y `writableEnded` es que writable sigue siendo **true** cuando está a punto de cerrarse la conexión, mientras que writableEnded es **true** nada más ejecutar el método `end()`.*

---
<br>

## Ejemplo de uso 📝
```javascript
const http = require('http');
const port = 3000;
const server = http.createServer((req, res) => {
    // Establecer las cabeceras de la respuesta:
    res.setHeader('Content-Type', 'text/event-stream');
    res.setHeader('Cache-Control', 'no-cache');
    res.setHeader('Connection', 'keep-alive');
    res.flushHeaders();

    // Detectar cuando el cliente cierra la conexión:
    res.on('close', () => {
        clearInterval(intervalId);
        res.end();
    });

    // Enviar un evento SSE cada segundo:
    const intervalId = setInterval(() => {
        if (res.writableEnded) return;
        res.write(`data: Hello World\n\n`);
    }, 1000);

});

server.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
});
```
<br><br><br>

## *[volver al índice](../../../README.md)*