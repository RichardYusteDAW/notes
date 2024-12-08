# Fetch
Es una API moderna que proporciona una interfaz JavaScript para acceder y manipular partes del canal HTTP, como peticiones y respuestas.  
También proporciona un método global fetch() que proporciona una forma fácil y lógica de obtener recursos de forma asíncrona por la red.

## Objeto Response 🏗️
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
---
<br>

## Utilización 🛠️
### GET
```javascript
const URL = 'https://example.com/data';

fetch(URL)
    .then(response => {
        if (!response.ok) {
            throw new Error(`${response.status}:${response.statusText}`)
        }
        return response.json();
    })
    .then(data => console.log(data))
    .catch(error => console.log('Error de red:', error));

// Con async/await
const findAll = async () => {
    try {
        const response = await fetch(URL);
        if (!response.ok) {
            throw new Error(`${response.status}:${response.statusText}`);
        }
        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.log('Error de red:', error);
    }
};
findAll();
```


### GET con parámetros
```javascript
const URL = 'https://example.com/data';
const ID = 1;

fetch(URL + '/' + ID)
    .then(response => {
        if (!response.ok) {
            throw new Error(`${response.status}:${response.statusText}`)
        }
        return response.json();
    })
    .then(data => console.log(data))
    .catch(error => console.log('Error de red:', error));

// Con async/await
const findById = async (ID) => {
    try {
        const response = await fetch(URL + '/' + ID);
        if (!response.ok) {
            throw new Error(`${response.status}:${response.statusText}`);
        }
        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.log('Error de red:', error);
    }
};
findById(ID);
```


### POST
```javascript
const URL = 'https://example.com/data';
const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({key: 'value'})
};

fetch(URL, options)
    .then(response => {
        if (!response.ok) {
            throw new Error(`${response.status}:${response.statusText}`)
        }
        return response.json();
    })
    .then(data => console.log(data))
    .catch(error => console.log('Error:', error));

// Con async/await
const create = async (data) => {
    const options = {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    };
    try {
        const response = await fetch(URL, options);
        if (!response.ok) {
            throw new Error(`${response.status}:${response.statusText}`);
        }
        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.log('Error de red:', error);
    }
};
create({key: 'value'});
```


### PUT
```javascript
const URL = 'https://example.com/data';
const ID = 1;
const options = {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({key: 'value'})
};

fetch(URL + '/' + ID, options)
    .then(response => {
        if (!response.ok) {
            throw new Error(`${response.status}:${response.statusText}`)
        }
        return response.json();
    })
    .then(data => console.log(data))
    .catch(error => console.log('Error de red:', error));

// Con async/await
const update = async (data, ID) => {
    const options = {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    };
    try {
        const response = await fetch(URL + '/' + ID, options);
        if (!response.ok) {
            throw new Error(`${response.status}:${response.statusText}`);
        }
        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.log('Error de red:', error);
    }
};
update(data, ID);
```


### DELETE
```javascript
const URL = 'https://example.com/data';
const ID = 1;
const options = {
    method: 'DELETE'
};
fetch(URL + '/' + ID, options)
    .then(response => {
        if (!response.ok) {
            throw new Error(`${response.status}:${response.statusText}`)
        }
        return response.json();
    })
    .then(data => console.log(data))
    .catch(error => console.log('Error de red:', error));

// Con async/await
const delete = async (id) => {
    const options = {
        method: 'DELETE'
    };
    try {
        const response = await fetch(URL + '/' + id, options);
        if (!response.ok) {
            throw new Error(`${response.status}:${response.statusText}`);
        }
        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.log('Error de red:', error);
    }
};
delete(ID);
```
<br><br><br>

## *[volver al índice](../../README.md)*