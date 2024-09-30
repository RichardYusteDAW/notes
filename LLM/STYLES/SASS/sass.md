# SASS
SASS es un preprocesador de CSS que nos permite escribir CSS de una forma más sencilla y ordenada. SASS nos permite utilizar variables, funciones, mixins, anidamiento, entre otras cosas.

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

@for $i from 1 through 3 {
  .item-#{$i} {
    width: 2em * $i;
  }
}

@each $name, $color in $colors {
  .background-#{$name} {
    background-color: $color;
  }
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
<br><br><br>

## *[volver al índice](../../../README.md)*