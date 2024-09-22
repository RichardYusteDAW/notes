# HandleBars
Handlebars es un motor de plantillas que permite crear plantillas HTML reutilizables.  
Se utiliza para renderizar plantillas HTML con datos.

## 1. Web Site 🌐
[Handlebars](https://github.com/pillarjs/hbs)

---
<br>

## 2. Instalar módulo 🔧
`npm i hbs`

---
<br>

## 3. Importar módulo 📥
- No es necesario importarlo, ya que se maneja a través de un adaptador (express-handlebars).
- `view engine` es el motor de plantillas que se utilizará para renderizar las vistas.
- `hbs` indica a Express que se utilizará Handlebars.
```javascript
app.set('view engine', 'hbs');
```
---
<br>

## 4. Crear vista 🖥️
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
---
<br>

## 5. Renderizar vista 🎨
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
---
<br>

## 6. Partials 🧩
- Se utilizan para reutilizar fragmentos de código en varias vistas.
- Se crea un archivo `.hbs` en la carpeta `views/partials` en la raíz del proyecto.
- Se incluye en la vista principal con `{{> partialName}}`.
- A veces es necesario registrar los parciales.
```javascript
const hbs = require('hbs');
hbs.registerPartials(__dirname + '/views/partials');
```
---
<br><br><br>

## *[volver al índice](../../../README.md)*