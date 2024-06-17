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

## 3. Uso 📦
```javascript
const bcrypt = require('bcryptjs');

const password = 1234;
const salt = bcrypt.genSaltSync(10); // Número de veces que se aplica el algoritmo de cifrado
const hash = bcrypt.hashSync(password, salt);
```
---
<br><br><br>

## *[volver al índice](../../index.md)*