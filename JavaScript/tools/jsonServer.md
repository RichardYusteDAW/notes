# JSON SERVER
JSON Server es una herramienta que permite crear un servidor RESTful con una base de datos en formato JSON en cuestión de segundos.  
Es útil para prototipos, pruebas y simulaciones.

## 1. Instalación 🔧
`npm install -g json-server`

---
<br>

## 2. Crear base de datos 📂
Crear un archivo `db.json` con la estructura de la base de datos.

```json
{
    "movies": [
        {
            "id": 1,
            "title": "The Shawshank Redemption",
            "year": 1994
        },
        {
            "id": 2,
            "title": "The Godfather",
            "year": 1972
        }
    ],
    "actors": [
        {
            "id": 1,
            "name": "Tim Robbins",
            "movieId": 1
        },
        {
            "id": 2,
            "name": "Morgan Freeman",
            "movieId": 1
        }
    ]
}
```
---
<br>

## 3. Iniciar servidor 🚀
- Se inicializará en el puerto 3000: [http://localhost:3000](http://localhost:3000)  
`json-server --watch db.json`

---
<br>

## 4. Rutas 🛣️
- **GET /movies**: Obtener todas las películas.
- **GET /movies/1**: Obtener la película con id 1.
- **POST /movies**: Crear una nueva película.
- **PUT /movies/1**: Actualizar la película con id 1.
- **PATCH /movies/1**: Actualizar parcialmente la película con id 1.
- **DELETE /movies/1**: Eliminar la película con id 1.
---
<br>

## 5. Ejemplos 📝
```javascript
// GET ALL
fetch('http://localhost:3000/movies')
    .then(response => response.json())
    .then(data => console.log(data));

// GET ID
fetch('http://localhost:3000/movies/1')
    .then(response => response.json())
    .then(data => console.log(data));

// POST
fetch('http://localhost:3000/movies', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify({
        title: 'The Dark Knight',
        year: 2008
    })
});

// PUT
fetch('http://localhost:3000/movies/1', {
    method: 'PUT',
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify({
        title: 'The Shawshank Redemption',
        year: 1994
    })
});

// PATCH
fetch('http://localhost:3000/movies/1', {
    method: 'PATCH',
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify({
        year: 1995
    })
});

// DELETE
fetch('http://localhost:3000/movies/1', {
    method: 'DELETE'
});
```
---
<br><br><br>

## *[volver al índice](../../README.md)*