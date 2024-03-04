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