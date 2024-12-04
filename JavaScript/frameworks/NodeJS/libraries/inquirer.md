# Inquirer
Inquirer es una librería de Node.js que nos permite hacer preguntas interactivas en la terminal. Es muy útil para hacer scripts interactivos o para hacer CLI (Command Line Interface) más amigables.

## 1. Web Site 🌐
[Inquirer](https://www.npmjs.com/package/inquirer)

---
<br>

## 2. Instalación 🔧
Para instalar Inquirer, ejecuta el siguiente comando:
```
npm install inquirer
```
---
<br>

## 3. Importar módulo 📥
```javascript
const inquirer = require('inquirer');
```
---
<br>

## 4. Crear preguntas 🛠️
1. Crear un array de objetos con las preguntas que queremos hacer.
- **type**: 
    - input: Pregunta abierta.
    - *confirm*: Pregunta de sí o no.
    - `list`: Pregunta con opciones, usuario selecciona usando las flechas.
    - `rawlist`: Pregunta con opciones numeradas, usuario selecciona introduciendo el número.
    - `expand`: Pregunta con opciones y descripciones, usuario selecciona usando teclas asignadas a cada opción.
    - `checkbox`: Pregunta con opciones múltiples.
    - password: Pregunta de contraseña.
- **name**: Nombre de la variable que almacenará la respuesta.
- **message**: Mensaje de la pregunta.
- **default**: Valor por defecto para preguntas de tipo *confirm*.
- **choices**: Array de opciones para preguntas de tipo `list`, `rawlist`, `expand` y `checkbox`.

2. Llamar a la función `inquirer.prompt()` pasando el array de preguntas como argumento.
```javascript
const questions = [
    {
        type: 'input',
        name: 'name',
        message: '¿Cuál es tu nombre?'
    },
    {
        type: 'confirm',
        name: 'confirm',
        message: '¿Estás seguro?',
        default: true
    },  
    {
        type: 'list',
        name: 'color',
        message: '¿Cuál es tu color favorito?',
        choices: ['Rojo', 'Verde', 'Azul']
    },
    {
        type: 'rawlist',
        name: 'size',
        message: '¿Cuál es tu talla?',
        choices: ['S', 'M', 'L', 'XL']
    },
    {
        type: 'expand',
        name: 'size',
        message: '¿Cuál es tu talla?',
        choices: [
            { key: 's', name: 'Pequeña', value: 'S' },
            { key: 'm', name: 'Mediana', value: 'M' },
            { key: 'l', name: 'Grande', value: 'L' },
            { key: 'xl', name: 'Extra Grande', value: 'XL' }
        ]
    },
    {
        type: 'checkbox',
        name: 'fruits',
        message: '¿Qué frutas te gustan?',
        choices: ['Manzana', 'Banana', 'Naranja', 'Pera']
    },
    {
        type: 'password',
        name: 'password',
        message: 'Ingresa tu contraseña'
    }
];

inquirer.prompt(questions)
    .then((answers) => {
      console.log(answers);
    })
    .catch((e) => {
        console.error(e);
    }
);
```
---
<br>

## 5. Respuestas 📝
Las respuestas se almacenan en un objeto con el nombre de la variable que le dimos a cada pregunta.
```javascript
// input
{
    name: 'Juan'
}

// confirm
{
    confirm: true
}

// list
{
    color: 'Rojo'
}

// rawlist
{
    size: 'M'
}

// expand
{
    size: 'M'
}

// checkbox
{
    fruits: ['Manzana', 'Banana']
}

// password
{
    password: '123456'
}
```
---
<br><br><br>

## *[volver al índice](../../../../README.md)*