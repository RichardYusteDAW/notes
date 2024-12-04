# XMLHttpRequest
Es un objeto que proporciona funcionalidad al cliente para transferir datos entre un cliente y un servidor.

## Utilización 🛠️
```javascript
// 1º Crear objeto XMLHttpRequest
let xhr = new XMLHttpRequest();

// 2º Configurar petición
xhr.open(method, URL, [async, user, password]);

// 3º Parsear respuesta
xhr.responseType = 'json';

// 4º Enviar petición
xhr.send([body]);

// 5º Recibir respuesta
xhr.onload = () => {
    if (xhr.status == 200) {
        console.log(`Estado: ${xhr.status}`);
        console.log(`Respuesta: ${xhr.response}`);
    } else {
        console.log(`Error: ${xhr.status}`);
    }
};

// 6º Recibir error
xhr.onerror = () => {
    console.log('Network Error');
};
```
<br><br><br>

## *[volver al índice](../../README.md)*