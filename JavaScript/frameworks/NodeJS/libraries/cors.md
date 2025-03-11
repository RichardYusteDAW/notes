# CORS
Cross Origin Resource Sharing (CORS) "Compartir Recursos de Origen Cruzado" es un mecanismo que permite a recursos restringidos en una página web ser solicitados desde otro dominio fuera del dominio desde el que se sirvió el primer recurso.

---
<br>

## 1. ¿Cómo funciona? ⚙️
- **Petición Inicial:** El navegador envía una petición con la cabecera `Origin` que indica desde qué dominio se realiza.
- **Respuesta del Servidor:** Basado en su política de CORS, el servidor responde:
  - *Permitido:* Incluye cabeceras como Access-Control-Allow-Origin si acepta el dominio.
  - *Denegado:* Omite las cabeceras necesarias y el navegador bloquea el acceso al recurso.

---
<br>


## 2. Detalles 🛂
- Solo funciona en navegadores.
- Solo funciona con recursos de origen cruzado (diferente dominio).
- Se resuelve enviando las cabeceras concretas:
  - `Access-Control-Allow-Origin`: especifica qué dominios pueden acceder al recurso.
  - `Access-Control-Allow-Headers`: especifica qué cabeceras pueden ser enviadas en la petición (Content-Type, Authorization, etc).
  - `Access-Control-Allow-Methods`: indica los métodos HTTP permitidos (GET, POST, PUT, DELETE, etc).
  - `Access-Control-Allow-Credentials`: indica si se permiten las credenciales en la petición (cookies, autenticación HTTP, etc).
- Preflight Request: Petición de verificación previa que se envía antes de la petición real. 
  - Se utiliza para comprobar si el servidor acepta la petición.
  - Se envía con el método OPTIONS.
  - Solo para solicitudes con métodos no seguros (PUT, PATCH, DELETE).
  - Incluye las cabeceras `Access-Control-Request-Method` y `Access-Control-Request-Headers`.
---
<br>

## 3. Uso sin módulo CORS (manual)🛠️📚
```javascript
import express from 'express';

const app = express();
const ALLOWED_ORIGINS = [
    'http://example.com:8080',                                      // Si se especifica un puerto solo aceptará ese puerto.
    'http://example2.com:8081'
    ];

app.get('/api/data', (req, res) => {
    const origin = req.headers.origin;
    if (ALLOWED_ORIGINS.includes(origin)){                          // Importante!! Recordar que si es el mismo dominio no se envía la cabecera Origin.
        res.header('Access-Control-Allow-Origin', origin);          // Permite solo el dominio que ha hecho la petición si está en la lista.
        res.header('Access-Control-Allow-Headers', 'Content-Type'); // Permite solo la cabecera Content-Type
        res.header('Access-Control-Allow-Methods', 'GET, POST');    // Permite solo los métodos GET y POST
        res.header('Access-Control-Allow-Credentials', 'true');     // Permite credenciales

        res.send('Data');
    }
});


// Preflight Request (OPTIONS) es necesario para métodos no seguros (PUT, PATCH, DELETE)
app.options('/api/data/:id', (req, res) => {
    const origin = req.headers.origin;
    if (ALLOWED_ORIGINS.includes(origin)){
        res.header('Access-Control-Allow-Origin', origin);
        res.header('Access-Control-Allow-Headers', 'Content-Type');
        res.header('Access-Control-Allow-Methods', 'DELETE');
        res.header('Access-Control-Allow-Credentials', 'true');
        
        res.send('Preflight Request');
    }
});

app.delete('/api/data/:id', (req, res) => {
    const origin = req.headers.origin;
    if (ALLOWED_ORIGINS.includes(origin)){
        res.header('Access-Control-Allow-Origin', origin);
        res.header('Access-Control-Allow-Headers', 'Content-Type');
        res.header('Access-Control-Allow-Methods', 'DELETE');
        res.header('Access-Control-Allow-Credentials', 'true');
        
        res.send('Data deleted');
    }
});
```
---
<br>

## 4. Uso con módulo CORS 📦
- Este módulo automatiza la configuración de CORS en una aplicación Node.js.
- También automatiza la gestión de Preflight Request (OPTIONS).
```bash
# Instalar CORS
npm install cors
```
```javascript
// Usar CORS
import express from 'express';
import cors from 'cors';

const app = express();

// Configurar CORS
app.use(cors({
    origin: 'http://example.com',     // Dominio permitido
    methods: ['GET', 'POST'],         // Métodos permitidos
    allowedHeaders: ['Content-Type'], // Cabeceras permitidas
    credentials: true                 // Permitir credenciales
}));
```
---
<br><br><br>

## *[volver al índice](../../../../README.md)*