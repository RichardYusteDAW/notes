# Router
Es un middleware de Express que se utiliza para manejar rutas y subrutas.

## 1. Instalar módulo 🔧
No es necesario instalarlo, ya que es parte de Express.

---
<br>

## 2. Importar módulo 📥
```javascript
const { Router } = require('express');
```
---
<br>

## 3. Instanciar router 🛠️
- No es necesario `new` ya que utiliza el patrón de diseño factory.
```javascript
const router = Router();
```
---
<br>

## 4. Crear rutas 🛣️
```javascript
// router.method('path', middleware, handler);
router.get('/', [middleware], (req, res) => {
    res.send('Get');
});

router.post('/', [middleware], (req, res) => {
    res.send('Post');
});

router.put('/:id', [middleware], (req, res) => {
    res.send('Put');
});

router.delete('/:id', [middleware], (req, res) => {
    res.send('Delete');
});

router.patch('/', [middleware], (req, res) => {
    res.send('Patch');
});
```
---
<br>

## 5. Exportar módulo 📤
```javascript
module.exports = router;
```
---
<br>

## 6. Crear subrutas 🚧
- Para crear subrutas se debe instanciar el router creado y luego usarlo como middleware.
```javascript
const userRouter = require('./controller/routes/userRouter');

app.use('/users', userRouter); // A partir de este punto, todas las rutas de userRouter tendrán como prefijo '/users'.
```
---
<br>

## 7. Usar rutas en la aplicación 🚀
- Las rutas se pueden montar en un archivo `router.js` y luego importarlo en `app.js`.
```javascript
// router.js
const { Router } = require('express');
const router = Router();

router.get('/', [middleware], (req, res) => {
    res.send('Get');
});

module.exports = router;
```

```javascript	
// app.js
const router = require('./controller/routes/router');

app.use(router);
```
---
<br><br><br>

## *[volver al índice](../../../README.md)*