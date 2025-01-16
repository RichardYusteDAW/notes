# Responsive Design

## 1. Viewport 🖥️
- `vh`: altura de la ventana.
- `vw`: ancho de la ventana.
- `vmin`: el menor entre `vh` y `vw`.
- `vmax`: el mayor entre `vh` y `vw`.
```html
<!-- Se utiliza para que el navegador ajuste el ancho de la página al ancho del dispositivo. -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```
- Diferencias con 100%:
  - `100%` se refiere al tamaño del contenedor padre y `vw` se refiere al tamaño de la ventana.
  - `100%` no toma en cuenta el tamaño de la barra de desplazamiento y `vw` sí.
---
<br>


## 2. rem vs em 🔢
- `rem`: es el tamaño en pixeles multiplicado por el tamaño de la fuente de la etiqueta **html**.
- `em`: es el tamaño en pixeles multiplicado por el tamaño de la fuente de la etiqueta padre.
---
<br>


## 3. Cálculos 🧮
- `min()`: selecciona el menor entre dos valores.
- `max()`: selecciona el mayor entre dos valores.
- `clamp()`: selecciona un valor que se encuentre entre dos valores.
- `calc()`: realiza operaciones matemáticas.
```css
.c-titulo {
  font-size: min(100px, 10vw); /* Selecciona el menor entre 100px y 10vw */
}

.c-titulo2 {
  font-size: max(100px, 10vw); /* Selecciona el mayor entre 100px y 10vw */
}

.c-titulo3 {
  font-size: clamp(100px, 10vw, 200px); /* El valor es 10vw y no puede ser menor a 100px ni mayor a 200px */
}

.c-titulo4 {
  font-size: clamp(10px, 10vw + 2px, 20px); /* El valor es 10vw + 2px y no puede ser menor a 10px ni mayor a 20px */
  /*font-size: clamp(10px, calc(10vw + 2px), 20px); Son equivalentes */
}

.c-titulo5 {
  font-size: calc(10px + 2vw); /* El valor es 10px + 2vw */
}
```
---
<br>


## 4. Calcular tamaño de pantalla 📏
$$ \text{pendiente} = \frac{\left(\text{MAXvalue} - \text{MINvalue}\right)}{\left(\text{Wupper} - \text{Wlower}\right)} \times 100 $$
$$ \text{coeficiente} = \text{MINvalue} - \left(\frac{\text{pendiente}}{100} \times \text{Wlower}\right) $$

![calcular tamaño de pantalla](./img/clamp.png)

$$ \text{MAXvalue} = \text{coeficiente} + \left(\frac{\text{pendiente}}{100} \times \text{Wupper}\right) $$
$$ \text{MINvalue} = \text{coeficiente} + \left(\frac{\text{pendiente}}{100} \times \text{Wlower}\right) $$

$$ \text{Wupper} = \frac{100}{\text{pendiente}} \times \left(\text{MAXvalue} - \text{coeficiente}\right) $$
$$ \text{Wlower} = \frac{100}{\text{pendiente}} \times \left(\text{MINvalue} - \text{coeficiente}\right) $$

---
<br><br><br>

## *[volver al índice](../../../README.md)*