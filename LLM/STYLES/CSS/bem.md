# BEM

## 1. ¿Qué es BEM?
Bem es una metodología de desarrollo web que nos permite estructurar y organizar nuestro código CSS de una forma más sencilla y ordenada.  
BEM se basa en la creación de bloques, elementos y modificadores.

---
<br>


## 2. Estructura
- **Bloque**: componente principal.
- **Elemento**: parte de un bloque.
- **Modificador**: variante de un bloque o elemento.
```html
<div class="l-block">
    <div class="c-block"></div>

    <div class="c-block">
        <div class="c-block__element">
        <div class="c-block__element">
    </div>

    <div class="c-block c-block--modifier">
        <div class="c-block__element c-block__element--modifier">
        <div class="c-block__element c-block__element--modifier">
    </div>

    <div class="g--modifier"></div>
</div>
```
---
<br>


## 3. Bloques
- Los bloques son los componentes principales de nuestra aplicación.
- Pueden ser: 
  - **componentes**: header, navbar, sidebar, footer, etc.
  - **layouts**: container, grid, flex, etc.
```scss
.c-block {
    background-color: red;
    color: white;
    padding: 10px;
}

.l-block {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 10px;
}
```
---
<br>


## 4. Elementos
- Los elementos son las partes de un bloque.
- Se definen con dos guiones bajos `__`.
```scss
.block__element {
    // Estilos
}
```
---
<br>


## 5. Modificadores
- Los modificadores son variantes de un bloque o elemento.
- Se definen con dos guiones medios `--`.
- También puede haber modificadores globales que se definen como `g--`.
```scss
.block--modifier {
    // Estilos
}

.block__element--modifier {
    // Estilos
}

.g--modifier {
    // Estilos
}
```
---
<br>






<br><br><br>

## *[volver al índice](../../../README.md)*