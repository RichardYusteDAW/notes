# SASS
SASS es un preprocesador de CSS que nos permite escribir CSS de una forma más sencilla y ordenada.  
SASS nos permite utilizar variables, funciones, mixins, anidamiento, entre otras cosas.

## 1. Instalación
```bash
npm install -g sass
```
---
<br>


## 2. Compilar
- **watch**: Observa los cambios en el archivo de entrada y compila automáticamente el archivo de salida.
```bash
sass input.scss output.css
sass --watch input.scss output.css
```
---
<br>


## 3. Archivo de barril
```scss
@import 'file1';
@import 'file2';
@import 'file3';
```
---
<br>


## 4. Variables
```scss
// Declaración
$font-family: Arial, sans-serif;
$primary-color: #666;
$name: 'secondary';

// Uso
body {
  font-family: $font-family;
  color: $primary-color;
  #{$name}-color: red;
}
```
---
<br>


## 5. Bucles
```scss
$colors: (
   "rojo": #FF0000, 
   "verde": #00FF00, 
   "azul": #0000FF
);

// For to (from 0 to 2)
@for $i from 0 to 3 {
  .item-#{$i} {
    width: 2em * $i;
  }
}

// For through (from 1 to 3)
@for $i from 1 through 3 {
  .item-#{$i} {
    width: 2em * $i;
  }
}

// Each
@each $name, $color in $colors {
  .background-#{$name} {
    background-color: $color;
  }
}

// While
$i: 1;
@while $i <= 3 {
  .item-#{$i} {
    width: 2em * $i;
  }
  $i: $i + 1;
}
```
---
<br>


## 6. Selector padre
```scss
AAA {
  color: red;
  &__BBB {
    color: blue;
  }
}
```
---
<br>

## 7. Mixins
```scss
@mixin box-shadow($shadow...) {
  -webkit-box-shadow: $shadow;
  -moz-box-shadow: $shadow;
  box-shadow: $shadow;
}

// Uso
.c-button {
  @include box-shadow(2px 10px 24px #FF0000);
}
```
---
<br>

## 8. Funciones
```scss
@function getBorderSize($size) {
  @return 10px * $size;
}

// Uso
.c-button {
  border: getBorderSize(2) solid #00FF00;
}
```
---
<br>

## 9. Condicionales
```scss
$color: 'red';

@if $color == 'red' {
  color: 'red';
} @elseif $color == 'blue' {
  color: 'blue';
} @else {
  color: 'green';
}
```
---
<br>

## 10. Listas
```scss
$colors: #FF0000 #00FF00 #0000FF;
$colors2: #FF0000, #00FF00, #0000FF;
$colors3: (#FF0000, #00FF00, #0000FF);

// Uso
$index: 2;
$valor: nth($colors, $index); // #00FF00
$length: length($colors);     // 3
```
---
<br>

## 11. Mapas
```scss
$colors: (
  "rojo": #FF0000, 
  "verde": #00FF00, 
  "azul": #0000FF
);

// Uso
$color: map-get($colors, "rojo"); // #FF0000
$keys: map-keys($colors);         // rojo, verde, azul
$values: map-values($colors);     // #FF0000, #00FF00, #0000FF
```
---
<br>

## 12. Webs para colores:
- [Lorenzo](https://logongas.github.io/color-schemes-generator/)
- [Data Viz Color Palette Generator](https://www.learnui.design/tools/data-color-picker.html#single)
- [Palettte App](https://palettte.app/)
- [ColorxColor:](https://colorcolor.in/)
---
<br><br><br>

## *[volver al índice](../../../README.md)*