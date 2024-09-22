# Cors
Cross-Origin Resource Sharing (CORS) es un middleware de Express que utiliza cabeceras HTTP adicionales para permitir que un servidor exponga recursos a un origen diferente al que pertenece.  
Es un estándar que permite a un servidor especificar a qué sitios web puede acceder.  

## 1. Web Site 🌐
[CORS](https://npmjs.com/package/cors)

---
<br>

## 2. Instalar módulo 🔧
`npm i cors`

---
<br>

## 3. Importar módulo 📥
```javascript
const cors = require('cors');
```
---
<br>

## 4. Usar módulo 🛠️
```javascript
app.use(cors());
```
---
<br>

## 5. Opciones ⚙️
- Se pueden permitir o denegar solicitudes 
  - Edades máximas (tiempo que un navegador puede almacenar en caché una respuesta).
```javascript
app.use(cors({
    origin: 'http://example.com',                 // Permite solicitudes de un origen específico
    origin: false,                                // Deniega solicitudes de cualquier origen
    origin: ['http://xxx.com', 'http://zzz.com'], // Permite solicitudes de varios orígenes
    
    methods: 'GET,POST',                          // Permite solicitudes de métodos específicos
    allowedHeaders: 'Content-Type',               // Permite solicitudes de cabeceras específicas
    credentials: true,                            // Permite que el navegador envíe credenciales (como cookies)
    maxAge: 3600                                  // El resultado de la verificación puede ser almacenado en caché por 3600 segundos
}));
```
---
<br>

## 6. Configuración por defecto 📄
- `origin`: `*` (cualquier origen)
- `methods`: GET, HEAD, PUT, PATCH, POST y DELETE.
- `allowedHeaders`: 
  - request: Accept, Accept-Language, Content-Language, Content-Type, y Last-Event-ID.
  - response (default navigator exposed): Cache-Control, Content-Language, Content-Type, Expires, Last-Modified, y Pragma.
- `credentials`: false`
- `maxAge`: No se establece.

---

<br><br><br>

## *[volver al índice](../../../README.md)*