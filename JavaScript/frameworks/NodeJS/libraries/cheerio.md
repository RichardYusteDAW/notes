# Cheerio
Es una biblioteca de Node.js que facilita la manipulación y el análisis de documentos HTML y XML en el servidor. Proporciona una API similar a jQuery, lo que permite a los desarrolladores seleccionar, modificar y recorrer elementos del DOM de manera sencilla.

## 1. Instalación 📦
```bash
npm install cheerio
```
---
<br>

## 2. Importar módulo 📥
```javascript
import cheerio from 'cheerio';
```
---
<br>

## 3. Uso básico 🛠️
```javascript
import cheerio from 'cheerio';

const html = `
<ul id="fruits">
  <li class="apple">Apple</li>
  <li class="orange">Orange</li>
</ul>
`;

const $ = cheerio.load(html);             // Carga el HTML y permite su manipulación

const fruitList = $('#fruits');           // Selecciona el elemento con id 'fruits'
console.log(fruitList.html());            // <li class="apple">Apple</li><li class="orange">Orange</li>
console.log(fruitList.text());            // AppleOrange

const apple = $('li').first();            // Seleccionar el primer elemento <li>
const orange = $('.orange');              // Seleccionar elemento por clase
console.log(apple.html());                // Apple
console.log(orange.text());               // Orange

let appleAttribute = apple.attr('class'); // Obtener atributo 'class'
console.log(appleAttribute);              // apple

apple.attr('class', 'green-apple');       // Modificar atributo 'class'
appleAttribute = apple.attr('class');     // Obtener atributo 'class' modificado
console.log(appleAttribute);              // green-apple

const listItems = $('li');                // Seleccionar todos los elementos <li>
listItems.each((index, element) => {
  console.log($(element).text(), index);  // Recorrer y mostrar texto de cada <li> (Apple 0, Orange 1)
});

$('ul').find('li');                       // Buscar elementos <li> dentro de <ul> (Igual que $('ul li'))
$('.apple').parent();                     // Obtener el elemento PADRE de .apple (el <ul>)
$('ul').children();                       // Obtener LOS HIJOS directos de <ul> (los <li>)
$('li').first().text();                   // Selector del primer <li> (Apple)
$('li').last().text();                    // Selector del último <li> (Orange)
$('li').eq(0).text();                     // Selector del primer <li> (Apple)
$('li').eq(1).text();                     // Selector del segundo <li> (Orange)


$('ul').append('<li>Banana</li>');        // Añadir un nuevo <li> al final de <ul>
$('ul').prepend('<li>Strawberry</li>');   // Añadir un nuevo <li> al inicio de <ul>
$('.orange').remove();                    // Eliminar el elemento con clase .orange

$('.apple').addClass('fresh');            // Añadir clase 'fresh' al elemento con clase .apple
$('.apple').removeClass('apple');         // Eliminar clase 'apple' del elemento
$('.apple').hasClass('apple');            // Comprobar si el elemento tiene clase 'apple' (false)

$('li').filter('.apple');                 // Filtrar elementos <li> con clase 'apple'
$('li').not('.apple');                    // Filtrar elementos <li> que NO tienen clase 'apple'

$.html();                                 // Obtener el HTML modificado completo
$('ul').html();                           // Obtener el HTML del elemento <ul>
```
---
<br><br><br>

## *[volver al índice](../../../../README.md)*