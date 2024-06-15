# Express
Express es un framework para Node.js que facilita la creación de aplicaciones web y APIs. Proporciona herramientas para manejar rutas, solicitudes y respuestas de manera simple y eficiente.

## 1. Web Site 🌐
[Express](https://expressjs.com/)

---
<br>

## 2. Instalar módulo 🔧
`npm install express`

---
<br>

## 3. Importar módulo 📥
```javascript
const express = require('express');
const app = express();
```

---
<br>

## 4. Métodos 🛠️

### 4.1. Listen
- Se utiliza para iniciar el servidor en un puerto específico.
```javascript
app.listen(3000, () => {
    console.log('Server running on port 3000');
});
```

### 4.2. Get
- Se utiliza para manejar solicitudes GET.
- En la respuesta se puede enviar texto o un archivo (HTML, JSON, PDF, ZIP, CSV, XML, imagen, audio).
```javascript
app.get('/', (req, res) => {                 //Muestra texto
    res.send('Hello World!');
});

app.get('/html', (req, res) => {
    res.send('<h1>Hello World!</h1>');       //Muestra HTML
});

app.get('/html', (req, res) => {
    res.sendFile(__dirname + '/index.html'); //Muestra archivo HTML  
});

app.get('/file', (req, res) => {
    res.sendFile(__dirname + '/file.txt');   //Muestra archivo de texto
});

app.get('*', (req, res) => {
    res.sendFile(__dirname + '/404.html');   //Muestra archivo de error
});

app.get('/json', (req, res) => {
    res.json({message: 'Hello World!'});     //Muestra JSON
});
```
- Se pueden solicitar parámetros de ruta, consulta y cuerpo.
```javascript
app.get('/user/:id', (req, res) => {         //Parámetro de ruta
    res.send('User ID: ' + req.params.id);
});

app.get('/user', (req, res) => {             //Parámetro de consulta
    res.send('User ID: ' + req.query.id);
});

app.get('/user', (req, res) => {             //Parámetro de cuerpo
    res.send('User ID: ' + req.body.id);
});
```

### 4.3. Middleware
- Se utiliza para ejecutar funciones antes de manejar una solicitud.
- `next()` se utiliza para pasar la solicitud al siguiente middleware.
```javascript
app.use((req, res, next) => {
    console.log('Request received');
    next();
});
```

### 4.4. Archivos estáticos
- Se utiliza para servir archivos estáticos como imágenes, CSS y JavaScript.
- Estos archivos deben estar en `public` en la raíz del proyecto.
```javascript
app.use(express.static('public'));
```

### 4.5. Redireccionar
- Se utiliza para redirigir a una URL específica.
```javascript
app.get('/redirect', (req, res) => {
    res.redirect('https://google.com');
});
```

### 4.6. Enviar status
- Se utiliza para enviar un código de estado.
```javascript
app.get('/status', (req, res) => {
    res.status(404).send('Not Found');
});
```
---

## 5. Express como clase 🏗️
```javascript
const express = require('express');
const cors = require('cors');

class Server {
    
    constructor() {
        this.app = express();
        this.port = process.env.PORT || 3000;

        this.middlewares();
        this.routes();
    }

    middlewares() {
        // CORS
        this.app.use(cors());

        // Public folder
        this.app.use(express.static('public'));
    }

    routes() {
        this.app.get('/', (req, res) => {
            res.status(200).json({message: 'Hello World!'});
        });

        this.app.put('/user/:id', (req, res) => {
            res.status(200).json({message: 'User ID: ' + req.params.id});
        });

        this.app.post('/user', (req, res) => {
            res.status(200).json({message: 'User ID: ' + req.body.id});
        });

        this.app.delete('/user', (req, res) => {
            res.status(200).json({message: 'User ID: ' + req.query.id});
        });

        // Si utilizamos Router
        this.app.use('/user', require('../routes/user'));
    }

    listen() {
        this.app.listen(this.port, () => {
            console.log('Server running on port ' + this.port);
        });
    }
}
```	

<br><br><br>

## *[volver al índice](../../../index.md)*