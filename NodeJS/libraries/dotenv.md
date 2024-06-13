# DotEnv
- Es un módulo que permite cargar variables de entorno desde un archivo `.env` a `process.env`.

## 1. Web Site
[dotenv](https://www.npmjs.com/package/dotenv)

---
<br>

## 2. Instalar módulo
`npm install dotenv`

---
<br>

## 3. Importar módulo
- No es necesario importar el módulo en cada archivo, solo se debe importar una vez en el archivo principal.
```javascript
require('dotenv').config();
```
---
<br>

## 4. Uso
- Crear un archivo `.env` en la raíz del proyecto.
- Definir las variables de entorno en el archivo `.env`:
```env
DB_HOST=localhost
DB_USER=root
DB_PASS=1234
```
- Acceder a las variables de entorno:
  
```javascript
const host = process.env.DB_HOST;
const user = process.env.DB_USER;
const pass = process.env.DB_PASS;
```
    
<br><br><br>

## *[volver al índice](../../index.md)*