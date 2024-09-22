# BCryptjs
Es una librería de Node.js que permite cifrar contraseñas de forma segura.

## 1. Web Site 🌐
[bcrypt](https://www.npmjs.com/package/bcryptjs)

---
<br>

## 2. Instalación 🔧
`npm install bcryptjs`

---
<br>

## 3. Uso 🛠️
```javascript
const bcrypt = require('bcryptjs');

const password = 1234;

// Generar un salt iterando 10 veces
const salt = bcrypt.genSaltSync(10);

// Generar el hash de la contraseña con el salt
const hash = bcrypt.hashSync(password, salt);

// Comparar la contraseña
const compare = bcrypt.compareSync(password, hash);
```
---
<br><br><br>

## *[volver al índice](../../README.md)*