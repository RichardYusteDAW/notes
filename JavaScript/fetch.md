# Fetch
Es una API moderna que proporciona una interfaz JavaScript para acceder y manipular partes del canal HTTP, como peticiones y respuestas.  
También proporciona un método global fetch() que proporciona una forma fácil y lógica de obtener recursos de forma asíncrona por la red.

## Utilización 🛠️
```javascript
const url = 'https://example.com/data';
const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({key: 'value'})
};

fetch(url, options)
    .then(response => {
        if (!response.ok) {
            throw new Error('Error en la petición');
        }
        return response.json();
    })
    .then(data => console.log(data))
    .catch(error => console.log('Error:', error));
```
---
<br>

## Objeto Response
Es una interfaz que representa la respuesta a una petición.
```javascript
Response {
    body: ReadableStream,           // Contiene un ReadableStream (flujo de datos) de la respuesta a la petición.
    bodyUsed: false,                // Indica si el cuerpo de la respuesta ha sido usado.
    headers: Headers,               // Contiene un objeto Headers con las cabeceras de la respuesta.
    ok: true,                       // Indica si la respuesta fue exitosa (status en el rango 200-299).
    redirected: false,              // Indica si la petición fue redirigida.
    status: 200,                    // Indica el código de estado de la respuesta.
    statusText: "OK",               // Contiene el mensaje de estado correspondiente al código de estado.
    type: "cors",                   // Indica el tipo de la respuesta.
    url: "https://example.com/data" // Contiene la URL de la respuesta.
}
```
<br><br><br>

## *[volver al índice](../README.md)*