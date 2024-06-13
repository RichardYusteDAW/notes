# Express
Express es un framework para Node.js que facilita la creación de aplicaciones web y APIs. Proporciona herramientas para manejar rutas, solicitudes y respuestas de manera simple y eficiente.

## 1. Web Site
[Express](https://expressjs.com/)

---
<br>

## 2. Instalar módulo
`npm install express`

---
<br>

## 3. Importar módulo
```javascript
const express = require('express');
const app = express();
```

---
<br>

## 4. Métodos

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
<br>

## 5. Handlebars
- Handlebars es un motor de plantillas que permite crear plantillas HTML reutilizables.
- Se utiliza para renderizar plantillas HTML con datos.

### 5.1. Instalar módulo
`npm i hbs`

### 5.2. Web Site
[Handlebars](https://github.com/pillarjs/hbs)

### 5.3. Importar módulo
- No es necesario importarlo, ya que se maneja a través de un adaptador (express-handlebars).
- `view engine` es el motor de plantillas que se utilizará para renderizar las vistas.
- `hbs` indica a Express que se utilizará Handlebars.
```javascript
app.set('view engine', 'hbs');
```

### 5.4. Crear vista
- Se crea un archivo `.hbs` en la carpeta `views` en la raíz del proyecto.
- Se utilizan `{{}}` para insertar variables
- `{{#if}}` para condicionales.
- `{{#each}}` para bucles.
- `{{>}}` para incluir parciales.
```html
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
</head>
<body>
    <h1>{{title}}</h1>            <!-- Variable -->
    {{#if show}}                  <!-- Condicional -->
        <p>{{message}}</p>
    {{#else}}
        <p>Message not found</p>
    {{/if}}

    <ul>
        {{#each items}}          <!-- Bucle -->
            <li>{{this}}</li>    <!-- this sustituye a items[i] -->
        {{/each}}
    </ul>
    
        {{> footer}}            <!-- Incluir parcial -->
</body>
</html>
```

### 5.5. Renderizar vista
- Se utiliza `res.render` para renderizar la vista.
- Se envían los datos a la vista como un objeto.
```javascript
app.get('/home', (req, res) => {
    res.render('home.hbs', {
        title: 'Home',
        show: true,
        message: 'Welcome to the home page',
        items: ['Item 1', 'Item 2', 'Item 3']
    });
});
```

### 5.6. Partials
- Se utilizan para reutilizar fragmentos de código en varias vistas.
- Se crea un archivo `.hbs` en la carpeta `views/partials` en la raíz del proyecto.
- Se incluye en la vista principal con `{{> partialName}}`.
---
<br><br><br>

## *[volver al índice](../../index.md)*