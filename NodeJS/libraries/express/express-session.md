# Express-session
Es un middleware de express que permite manejar sesiones de usuario.

## 1. Web Site🌐
[Express-session](https://www.npmjs.com/package/express-session)

---
<br>

## 2. Instalar módulo 🔧
`npm install express-session`

---
<br>

## 3. Importar módulo 📦
```javascript
const session = require('express-session');
```
---
<br>

## 4. Opciones ⚙️
- **secret:** Es una cadena de texto que se utiliza para firmar la cookie de la sesión.
- **resave:** Indica si la sesión debe ser guardada en el almacenamiento aunque no haya sido modificada.
- **saveUninitialized:** Indica si la sesión debe ser guardada aunque no haya sido inicializada.
- **cookie:** Es un objeto que contiene las opciones de la cookie.
  - `domain:` Dominio de la cookie.
  - `expires:` Fecha de expiración de la cookie.
  - `httpOnly:` Indica si la cookie solo se debe enviar a través de HTTP.
  - `maxAge:` Tiempo de vida de la cookie en milisegundos.
  - `path:` Ruta de la cookie.
  - `secure:` Indica si la cookie solo se debe enviar a través de HTTPS.
  - `sameSite:` Indica si la cookie se debe enviar en la misma petición que la solicitud de origen.
  - `signed:` Indica si la cookie debe ser firmada.
- **genid:** Función para generar un nuevo ID de sesión.
- **name:** Nombre de la cookie de la sesión (predeterminado: connect.sid).
- **proxy:** Indica si la cookie debe respetar las configuraciones de proxy.
- **rolling:** Indica si la sesión debe renovarse en cada petición.
- **store:** Define el almacenamiento de sesiones personalizado (e.g., MongoDB, Redis).
- **unset:** Define el comportamiento al cerrar la sesión (destroy o keep).
---
<br>

## 5. Sintaxis 📝
```javascript
app.use(session ({
    secret: 'secret',
    resave: false,
    saveUninitialized: false,
    cookie: { secure: true }
}));
```
---
<br><br><br>

## *[volver al índice](../../../README.md)*
