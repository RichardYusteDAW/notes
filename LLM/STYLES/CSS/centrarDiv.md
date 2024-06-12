# Diferentes maneras de centrar un div en CSS

## 1.1. Con Margin Auto
- Centra HORIZONTALMENTE un bloque con un ancho específico.
```css
.centered {
    width: 100px;   /* O cualquier ancho específico */
    margin: 0 auto; /* Auto aplicado a margen izquierdo y derecho */
}
```
<br>

## 1.2. Con Position Absolute
- Centra un bloque en el centro de su contenedor, tanto horizontal como verticalmente.
```css
.container {
    position: relative; /* El padre debe tener posición relativa o absoluta */
}
.centered {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%); /* Ajusta el elemento al centro exacto */
}
```
<br>

## 1.3. Usando Text-Align en el Contenedor
- Centra un bloque en línea HORIZONTALMENTE.  
- `text-align` no solo afecta al texto, sino a todos los elementos en línea (inline e inline-block).
```css
.container {
    text-align: center;
}
.centered {
    display: inline-block;
}
```
<br>

## 1.4. Con Flexbox
- Centra un bloque horizontalmente.
```css
.container {
    display: flex;
    justify-content: center; /* Centra horizontalmente */
}
```
- Centra un bloque verticalmente.
```css
.container {
    display: flex;
    align-items: center;     /* Centra verticalmente */
    width: 100vw;            /* O cualquier anchura deseada */
}
```
- Centra un bloque horizontal y verticalmente.
```css
.container {
    display: flex;
    justify-content: center; /* Centra horizontalmente */
    align-items: center;     /* Centra verticalmente */
    height: 100vh;           /* O cualquier altura deseada */
}
```
<br>

## 1.5. Con Grid
- Centra un bloque horizontalmente.
```css
.container {
    display: grid;
    justify-items: center;   /* Centra horizontalmente */
}
```
- Centra un bloque verticalmente.
```css
.container {
    display: grid;
    align-items: center;     /* Centra verticalmente */
    height: 100vh;
}
```
- Centra un bloque horizontal y verticalmente.
```css
.container {
    display: grid;
    place-items: center;     /* Centra tanto horizontal como verticalmente */
    height: 100vh;
}
```
<br><br><br>

## *[volver al índice](../../../index.md)*