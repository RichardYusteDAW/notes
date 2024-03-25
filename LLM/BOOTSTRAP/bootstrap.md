# Bootstrap
Bootstrap es un framework de código abierto para el desarrollo web front-end que proporciona plantillas de diseño con HTML, CSS y JavaScript. Facilita la creación de sitios web responsivos y móviles primero, ofreciendo un amplio rango de componentes preestilizados y plugins para navegación, formularios, botones, y otros elementos de interfaz.

## 1. Instalación
- A través de links:
```html
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
```
- Descargando los archivos:
[Bootstrap5](https://github.com/twbs/bootstrap/releases/download/v5.0.2/bootstrap-5.0.2-dist.zip)
<br>

## 2. Breakpoints
| Breakpoint         | Class infix | Dimensions |
|--------------------|-------------|------------|
| X-Small            | None        | <576px     |
| Small              | sm          | >=576px    |
| Medium             | md          | >=768px    |
| Large              | lg          | >=992px    |
| Extra large        | xl          | >=1200px   |
| Extra extra large  | xxl         | >=1400px   |
<br>

## 3. Containers
| Clase              | Extra small  <576px | Small  ≥576px | Medium  ≥768px | Large  ≥992px | X-Large  ≥1200px | XX-Large  ≥1400px |
|--------------------|---------------------|---------------|----------------|---------------|------------------|-------------------|
| .container         | 100%                | 540px         | 720px          | 960px         | 1140px           | 1320px            |
| .container-sm      | 100%                | 540px         | 720px          | 960px         | 1140px           | 1320px            |
| .container-md      | 100%                | 100%          | 720px          | 960px         | 1140px           | 1320px            |
| .container-lg      | 100%                | 100%          | 100%           | 960px         | 1140px           | 1320px            |
| .container-xl      | 100%                | 100%          | 100%           | 100%          | 1140px           | 1320px            |
| .container-xxl     | 100%                | 100%          | 100%           | 100%          | 100%             | 1320px            |
| .container-fluid   | 100%                | 100%          | 100%           | 100%          | 100%             | 100%              |

<br>

## 4. Rejilla (Grid)
![Cuadrícula](./img/cuadrícula_bootstrap.png)
```html	
<div class="container"> 
    <div class="row">
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2">
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2">
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2">
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2">
        </div>
    </div>
</div>

<!--
col-12:   En dispositivos extra pequeños (menos de 576px), la columna ocupa el 100% del ancho de la fila (12 de 12 columnas).
col-sm-6: En pantallas pequeñas (≥576px) y mayores, la columna ocupa la mitad del ancho de la fila (6 de 12 columnas)
col-md-4: En pantallas medianas (≥768px), la columna ocupa un tercio del ancho de la fila (4 de 12 columnas), permitiendo 3 columnas por fila.
col-lg-3: En pantallas grandes (≥992px), la columna ocupa un cuarto del ancho de la fila (3 de 12 columnas), permitiendo hasta 4 columnas por fila.
col-xl-2: En pantallas extra grandes (≥1200px), la columna ocupa un sexto del ancho de la fila (2 de 12 columnas), permitiendo hasta 6 columnas por fila.
-->
```
<br>

## 5. Componentes
### 5.1. Navbar
Barra de navegación que se adapta a los distintos tamaños de pantalla.
```html
<nav class="navbar navbar-expand-lg" ></nav>
```
![Navbar](./img/navbar.png)

### 5.2. Offcanvas
Es un componente de tipo sidebar que nos permite mostrar/ocultar su contenido desde cualquier lado de la pantalla (start, end, top, bottom)
```html
<div class="offcanvas offcanvas-start">
    <div class="offcanvas-header">
    <div class="offcanvas-body">
    <div class="offcanvas-footer">
</div>
```

### 5.3. Dropdown, Collapse y Accordion
Dropdown: Menú desplegable.
Collapse: Contenido colapsable.
Accordion: Grupo de collapse.
```html
<div class="dropdown">
    <ul class="dropdown-menu">
        <li class="dropdown-item">
        <li class="dropdown-item">
        <li class="dropdown-item">
    </ul>
</div>
```
![Dropdown](./img/dropdown.png)

```html
<div class="collapse">
    <div class="collapse show">
    <div class="collapse">
</div>
```
![Collapse](./img/collapse.png)

```html
<div class="accordion">
    <div class="accordion-item">
        <h2 class="accordion-header">
            <button class="accordion-button">
        </h2>
        <div class="accordion-collapse">
    </div>
</div>
```
![Accordion](./img/accordion.png)

### 5.4. Modal, Popover, Tooltip y Toast
Modal: Ventana emergente.
Popover: Ventana emergente con contenido.
Tooltip: Mensaje emergente.
Toast: Mensaje emergente.
```html
<div class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <div class="modal-body
            <div class="modal-footer">
        </div>
    </div>
</div>
```
![Modal](./img/modal.png)

```html	
<div class="popover">
    <div class="popover-header">
    <div class="popover-body">
</div>
```
![Popover](./img/popover.png)

```html
<div class="tooltip">
    <div class="tooltip-inner">
</div>
```
![Tooltip](./img/tooltip.png)

```html
<div class="toast">
    <div class="toast-header">
    <div class="toast-body">
</div>
```
![Toast](./img/toast.png)

### 5.5. Carousel
Carrusel de imágenes.
```html
<div id="carouselExampleControls" class="carousel slide">
    <div class="carousel-inner">
        <div class="carousel-item">
        <div class="carousel-item">
        <div class="carousel-item">
    </div>
    <button class="carousel-control-prev">
    <button class="carousel-control-next">
</div>
```
![Carousel](./img/carousel.png)
![Carousel2](./img/carousel2.png)

### 5.6. Heroes
Sección de contenido con imagen de fondo.
```html
<div class="hero">
    <div class="hero-body">
        <h1 class="hero-title">
        <p class="hero-text">
    </div>
</div>

<div class="hero hero-lg">
    <div class="hero-body">
        <h1 class="hero-title
        <p class="hero-text">
    </div>
</div>
```

## 6. Formularios
### 6.1. Labels e Inputs
```html
<form>
    <label for="input" class="form-label">Nombre</label>
    <input type="text" id="input" class="form-control">

    <div class="input-group">
        <span class="input-group-text">@</span>
        <input type="email" id="input" class="form-control">
    </div>
</form>
```

### 6.2. Selects
```html
<form>
    <label for="select" class="form-label">País</label>
    <select id="select" class="form-select">
        <option value="1">España</option>
        <option value="2">México</option>
        <option value="3">Argentina</option>
    </select>
</form>
```

### 6.3. Checkboxes y Radio Buttons
```html
<form>
    <div class="form-check form-check-inline">
        <input type="checkbox" id="checkbox" class="form-check-input">
        <label for="checkbox" class="form-check-label">Acepto los términos y condiciones</label>
    </div>

    <div class="form-check form-switch">
        <input type="checkbox" id="checkbox" class="form-check-input">
        <label for="checkbox" class="form-check-label">Modo oscuro</label>
    </div>
</form>
```






