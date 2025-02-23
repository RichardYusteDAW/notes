# Express-validator
Es un middleware de express que permite validar los datos que se envían a través de una petición HTTP.

## 1. Web Site🌐
[Express-validator](https://express-validator.github.io/docs/)

---
<br>

## 2. Instalar módulo 🔧
`npm install express-validator`

---
<br>

## 3. Importar módulo 📦
```javascript
const { check } = require('express-validator');
```
---
<br>

## 4. Sintaxis 📝
```javascript
const middleware = [
    check('body field', 'error message').validateMethod(),
    check('body field', 'error message').not().validateMethod(),
    check('body field', 'error message').isIn(['value1', 'value2']).validateMethod(),
    check('body field', 'error message').matches(/regex/).validateMethod(),
    check('body field', 'error message').custom((value, { req }) => {
        if (value !== req.body.field) {
            throw new Error('Error message');
        }
        return true;
    }),
    manualValidate
];
```
---
<br>

## 5. Validaciones 📏
- **Más utilizados:**
  - `isAlpha()`: Verifica si el campo contiene solo letras.
  - `isAlphanumeric()`: Verifica si el campo contiene solo letras y números.
  - `isBoolean()`: Verifica si el campo es un booleano.
  - `isDate()`: Verifica si el campo es una fecha.
  - `isEmpty()`: Verifica si el campo está vacío.
  - `isEmail()`: Verifica si el campo es un correo electrónico.
  - `isFloat()`: Verifica si el campo es un número decimal.
  - `isInt()`: Verifica si el campo es un número entero.
  - `isLength()`: Verifica si el campo tiene una longitud específica.
  - `isNumeric()`: Verifica si el campo es numérico.
  - `isString()`: Verifica si el campo es una cadena de texto.<br><br>
- **Negación:**
  - `not()`: Invierte el resultado de la validación.<br><br>
- **Está en:**
  - `isIn()`: Verifica si el campo está en un conjunto de valores.<br><br>
- **Coindide con:**
  - `matches()`: Verifica si el campo coincide con una expresión regular.<br><br>
- **Otros:**
  - `isAscii()`: Verifica si el campo contiene solo caracteres ASCII.
  - `isBase64()`: Verifica si el campo es una cadena codificada en base64.
  - `isByteLength()`: Verifica si el campo tiene una longitud específica en bytes.
  - `isCurrency()`: Verifica si el campo es una moneda.
  - `isDataURI()`: Verifica si el campo es una URI de datos.
  - `isDivisibleBy()`: Verifica si el campo es divisible por un número.
  - `isDecimal()`: Verifica si el campo es un número decimal.
  - `isFQDN()`: Verifica si el campo es un nombre de dominio completamente calificado.
  - `isFullWidth()`: Verifica si el campo contiene solo caracteres de ancho completo.
  - `isHalfWidth()`: Verifica si el campo contiene solo caracteres de ancho medio.
  - `isHexColor()`: Verifica si el campo es un color hexadecimal.
  - `isHexadecimal()`: Verifica si el campo es un número hexadecimal.
  - `isIP()`: Verifica si el campo es una dirección IP.
  - `isISBN()`: Verifica si el campo es un número ISBN.
  - `isISIN()`: Verifica si el campo es un número ISIN.
  - `isISO8601()`: Verifica si el campo es una fecha ISO8601.
  - `isISO31661Alpha2()`: Verifica si el campo es un código de país ISO31661Alpha2.
  - `isISO31661Alpha3()`: Verifica si el campo es un código de país ISO31661Alpha3.
  - `isISRC()`: Verifica si el campo es un número ISRC.
  - `isJSON()`: Verifica si el campo es una cadena JSON.
  - `isJWT()`: Verifica si el campo es un token JWT.
  - `isLatLong()`: Verifica si el campo es una latitud y longitud.
  - `isMACAddress()`: Verifica si el campo es una dirección MAC.
  - `isMD5()`: Verifica si el campo es un hash MD5.
  - `isMagnetURI()`: Verifica si el campo es un enlace magnet.
  - `isMimeType()`: Verifica si el campo es un tipo MIME.
  - `isMobilePhone()`: Verifica si el campo es un número de teléfono móvil.
  - `isMongoId()`: Verifica si el campo es un ID de MongoDB.
  - `isMultibyte()`: Verifica si el campo contiene caracteres multibyte.
  - `isPostalCode()`: Verifica si el campo es un código postal.
  - `isRFC3339()`: Verifica si el campo es una fecha RFC3339.
  - `isSlug()`: Verifica si el campo es un slug.
  - `isStrongPassword()`: Verifica si el campo es una contraseña segura.
  - `isURL()`: Verifica si el campo es una URL.
  - `isUUID()`: Verifica si el campo es un UUID.
  - `isUppercase()`: Verifica si el campo contiene solo letras mayúsculas.
  - `isVariableWidth()`: Verifica si el campo contiene caracteres de ancho variable.
  - `isWhitelisted()`: Verifica si el campo contiene solo caracteres permitidos.
---
<br>

## 6. Middlewares 📝
### 6.1. Personalizados
- `value`: Valor del campo (field).
- `context`: Objeto que incluye req, location, path y otros campos.
```javascript
check('body field', 'error message').custom((value, context) => {
    if (value !== context.req.body.field) {
        throw new Error('Error message');
    }
    return true;
})
```
---
<br>

### 6.2. Manuales
- `validationResult`: Es un método de express-validator que devuelve un objeto con los errores de validación de los middleware anteriores.
  - `request`: Recibe un objeto con los errores de validación.
  - `response`: Envía una respuesta con los errores de validación.
  - `next`: Continúa con el siguiente middleware o con el controlador si ya no hay más middleware.
```javascript
const { validationResult } = require('express-validator');

const manualValidate = (req, res, next) => {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        return res.status(400).json(errors);
    }

    next();
}

module.exports = { manualValidate }
```
<br><br><br>

## *[volver al índice](../../../../../README.md)*