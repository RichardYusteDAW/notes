# DOM
El DOM (Document Object Model) es una interfaz de programación para documentos HTML y XML.  
Proporciona una representación estructurada del documento y define cómo se puede acceder a los elementos del documento, cómo se pueden modificar y cómo se pueden agregar o eliminar elementos del documento.

## 1. Acceso a elementos del DOM 🔍
### 1.1. Window
```js
window.document;                            // Devuelve el documento HTML.
window.location;                            // Devuelve la URL de la página actual.
window.history;                             // Devuelve el historial de navegación.
window.navigator;                           // Devuelve información sobre el navegador.
window.screen;                              // Devuelve información sobre la pantalla.
window.localStorage;                        // Almacena datos sin fecha de caducidad.
window.sessionStorage;                      // Almacena datos para una sesión.
window.alert("mensaje");                    // Muestra un cuadro de diálogo con un mensaje.
window.confirm("mensaje");                  // Muestra un cuadro de diálogo con un mensaje y botones de aceptar y cancelar.
window.prompt("mensaje", "default value");  // Muestra un cuadro de diálogo con un mensaje y un campo de entrada.
window.open("url", "nombre", "opciones");   // Abre una nueva ventana del navegador.
window.close();                             // Cierra la ventana actual.
window.setTimeout(function, tiempo);        // Ejecuta una función después de un tiempo.
window.setInterval(function, tiempo);       // Ejecuta una función cada cierto tiempo.
window.clearTimeout(id);                    // Cancela la ejecución de una función programada.
window.clearInterval(id);                   // Cancela la ejecución de una función programada.
window.scroll(x, y);                        // Desplaza la ventana a una posición específica.
window.scrollTo(x, y);                      // Desplaza la ventana a una posición específica.
window.scrollBy(x, y);                      // Desplaza la ventana una cantidad específica.
```

### 1.2. Document
```js
document.URL;                               // Devuelve la URL del documento.
document.domain;                            // Devuelve el dominio del servidor del documento.
document.referrer;                          // Devuelve la URL del documento que cargó el documento actual.
document.cookie;                            // Devuelve las cookies del documento.
document.doctype;                           // Devuelve el tipo de documento del documento.
document.title;                             // Devuelve el título del documento.
document.body;                              // Devuelve el elemento <body> del documento.
document.head;                              // Devuelve el elemento <head> del documento.
document.documentElement;                   // Devuelve el elemento <html> del documento.
document.images;                            // Devuelve una colección de elementos <img> del documento.
document.links;                             // Devuelve una colección de elementos <a> del documento.
document.forms;                             // Devuelve una colección de elementos <form> del documento.
document.scripts;                           // Devuelve una colección de elementos <script> del documento.
document.styleSheets;                       // Devuelve una colección de hojas de estilo del documento.
```

### 1.3. Cookies, LocalStorage y SessionStorage
```js
// name=value; expires=fecha; path=path; domain=dominio; secure; samesite=strict/lax/none; max-age=segundos; HttpOnly; SameSite=Strict/Lax/None;
document.cookie = "city=Madrid; expires=Thu, 18 Dec 2023 12:00:00 UTC; path=/; max-age=3600; secure; samesite=strict";	// Establece una cookie.
localStorage.setItem("name", "value");      // Almacena un valor en localStorage.
localStorage.getItem("name");               // Obtiene un valor de localStorage.
localStorage.removeItem("name");            // Elimina un valor de localStorage.
localStorage.clear();                       // Elimina todos los valores de localStorage.

sessionStorage.setItem("name", "value");    // Almacena un valor en sessionStorage.
sessionStorage.getItem("name");             // Obtiene un valor de sessionStorage.
sessionStorage.removeItem("name");          // Elimina un valor de sessionStorage.
sessionStorage.clear();                     // Elimina todos los valores de sessionStorage.
```

### 1.4. Selectores
```js
document.getElementById("id");              // Devuelve el elemento con el id especificado.
document.getElementsByClassName("clase");   // Devuelve una colección de elementos con la clase especificada.
document.getElementsByTagName("etiqueta");  // Devuelve una colección de elementos con el nombre de la etiqueta especificada.
document.querySelector("selector");         // Devuelve el primer elemento que coincida con el selector especificado.
document.querySelectorAll("selector");      // Devuelve todos los elementos que coincidan con el selector especificado.
```

### 1.5. Nodos
```js
element.firstChild;                         // Devuelve el primer nodo hijo de un elemento.
element.childNodes;                         // Devuelve una HTMLCollection con los nodos hijos de un elemento.
element.lastChild;                          // Devuelve el último nodo hijo de un elemento.
element.children;                           // Devuelve una HTMLCollection con los nodos hijos de un elemento.
element.hasChildNodes();                    // Devuelve true si un elemento tiene nodos hijos.
element.nextSibling;                        // Devuelve el siguiente nodo hermano de un elemento.
element.previousSibling;                    // Devuelve el nodo hermano anterior de un elemento.
element.parentNode;                         // Devuelve el nodo padre de un elemento.
element.parentElement;                      // Devuelve el nodo padre de un elemento.
```

### 1.6. Propiedades
```js
element.checked;                            // Devuelve true si un elemento de formulario está marcado.
element.className;                          // Devuelve la clase de un elemento.
element.disabled;                           // Devuelve true si un elemento de formulario está deshabilitado.
element.hidden;                             // Devuelve true si un elemento está oculto.
element.href;                               // Devuelve la URL de un enlace de un elemento.
element.id;                                 // Devuelve el id de un elemento.
element.innerHTML;                          // Devuelve el contenido HTML de un elemento.
element.readOnly;                           // Devuelve true si un elemento de formulario es de solo lectura.
element.required;                           // Devuelve true si un elemento de formulario es obligatorio.
element.selected;                           // Devuelve true si un elemento de lista desplegable está seleccionado.
element.src;                                // Devuelve la URL de la imagen de un elemento.
element.style;                              // Devuelve un objeto con los estilos CSS de un elemento.
element.style.propiedad;                    // Devuelve el valor de un estilo CSS de un elemento.
element.tagName;                            // Devuelve el nombre de la etiqueta de un elemento.
element.textContent;                        // Devuelve el contenido de texto de un elemento.
element.value;                              // Devuelve el valor de un elemento de formulario.
```
---
<br>


## 2. Modificación de elementos del DOM 📝
### 2.1. Atributos
```js
element.getAttribute("atributo");           // Devuelve el valor de un atributo de un elemento.
element.setAttribute("atributo", "valor");  // Establece el valor de un atributo de un elemento.
element.removeAttribute("atributo");        // Elimina un atributo de un elemento.
```

### 2.2. Clases
```js
element.classList.add("clase");             // Añade una clase a un elemento.
element.classList.remove("clase");          // Elimina una clase de un elemento.
element.classList.toggle("clase");          // Añade una clase a un elemento si no está presente, y la elimina si está presente.
element.classList.contains("clase");        // Devuelve true si un elemento tiene una clase.
```

### 2.3. Contenido
```js
element.innerHTML = "<p>texto</p>";         // Establece el contenido HTML de un elemento.
element.textContent = "texto";              // Establece el contenido de texto de un elemento.
```

### 2.4. Estilos
```js
element.style.propiedad = "valor";          // Establece un estilo CSS de un elemento.
```

### 2.5. Otros
```js
element.focus();                            // Establece el foco en un elemento.
element.select();                           // Selecciona el contenido de un elemento.
element.blur();                             // Quita el foco de un elemento.
element.click();                            // Simula un clic en un elemento.
element.scrollIntoView();                   // Desplaza la ventana para que un elemento sea visible.
```
---
<br>


## 3. Creación de elementos del DOM 🛠️
```js
// Creación:
let element = document.createElement("etiqueta"); // Crea un nuevo elemento con el nombre de la etiqueta especificada.
let element2 = element.cloneNode(true);           // Clona un elemento y sus nodos hijos.

// Añadir atributos:
element.createTextNode("texto");                  // Crea un nuevo nodo de texto con el texto especificado.
element.setAttribute("atributo", "valor");        // Establece el valor de un atributo de un elemento.
element.id = "id";                                // Establece el id de un elemento.
element.className = "clase";                      // Establece la clase de un elemento.
element.href = "url";                             // Establece la URL de un enlace de un elemento.
element.src = "url";                              // Establece la URL de la imagen de un elemento.

// Añadir estilos:
element.style.color = "red";                      // Establece un estilo CSS de un elemento.
element.style.backgroundColor = "blue";           // Establece un estilo CSS de un elemento.

// Añadir clases:
element.classList.add("clase");                   // Añade una clase a un elemento.

// Añadir eventos:
element.addEventListener("event", function);      // Añade un evento a un elemento.

// Añadir el nuevo elemento al DOM:
element.appendChild(nodo);                        // Añade un nodo al final de la lista de nodos hijos de un elemento.
element.insertBefore(nodo1, nodo2);               // Inserta el nodo1 como hijo antes del nodo2.

// Eliminar el nuevo elemento del DOM:
element.remove();                                 // Elimina un elemento del DOM.
element.removeChild(nodo);                        // Elimina un nodo hijo de un elemento.

// Reemplazar un elemento por otro:
element.replaceWith(nuevoElemento);               // Reemplaza un elemento por otro.
element.replaceChild(nuevoNodo, nodo);            // Reemplaza un nodo hijo de un elemento por otro.
```
---
<br>


## 4. Listeners 👂
- Propagación de eventos:
    - **Bubbling:** El evento del elemento más interno se maneja primero y luego se maneja el evento del elemento externo (de abajo hacia arriba).
    - **Capturing:** El evento del elemento más externo se maneja primero y luego el interno (de arriba hacia abajo).
```js
element.addEventListener("event", function, useCapture); // Añade un evento a un elemento.
element.removeEventListener("event", function);          // Elimina un evento de un elemento.

// Capturing propagation:
element.addEventListener("click", function, true);

// Bubbling propagation:
element.addEventListener("click", function, false);
```
---
<br>


## 5. Eventos 🎉
### 5.1. Tipos
```js
// De ventana:
onload                     // Se dispara cuando un recurso y sus recursos dependientes han terminado de cargar.
onunload                   // Se lanza al cargar otro documento o página web.
onresize                   // Se dispara cuando se cambia el tamaño de la ventana.
onerror                    // Se dispara cuando se produce un error.
onscroll                   // Se dispara cuando se desplaza la barra de desplazamiento.

// De formularios:
onblur                     // Cuando un elemento pierde el foco.
onchange                   // Se ejecuta cuando el valor de un elemento de formulario cambia.
onfocus                    // Cuando un elemento obtiene el foco.
onreset                    // Al resetear un formulario.
onselect                   // Al seleccionar un elemento.
onsubmit                   // Al enviar un formulario.

// De imágenes:
onabort                    // Se produce al interrumpirse la carga de una imagen.

// De teclado:
onkeydown                  // Cuando se presiona una tecla.
onkeypress                 // Al pulsar una tecla correspondiente a un carácter.
onkeyup                    // Cuando se levanta una tecla tras pulsarla.

// De ratón:
onclick                    // Al hacer clic en un elemento.
ondblclick                 // Cuando se hace doble clic en un elemento.
contextmenu                // Al hacer clic con el botón derecho del ratón.
onmousedown                // Al pulsar un botón del ratón.
onmouseup                  // Cuando se levanta el botón del ratón tras presionarlo.
onmousemove                // Al mover el ratón dentro del área que ocupa el elemento.
onmouseover                // Al mover el ratón en el área de un elemento.
onmouseout                 // Al mover el ratón fuera del área del elemento.
```

### 5.2. Propiedades de eventos
```js
event.altKey;              // Devuelve true si la tecla Alt está presionada.
event.ctrlKey;             // Devuelve true si la tecla Ctrl está presionada.
event.shiftKey;            // Devuelve true si la tecla Shift está presionada.
event.metaKey;             // Devuelve true si la tecla Meta está presionada.
event.type;                // Devuelve el tipo de evento.
event.target;              // Devuelve el elemento que disparó el evento.
event.preventDefault();    // Cancela la acción predeterminada del evento.
event.stopPropagation();   // Detiene la propagación del evento (bubbling o capturing).
event.clientX;             // Devuelve la posición horizontal del puntero del ratón.
event.clientY;             // Devuelve la posición vertical del puntero del ratón.
```

### 5.3. Propiedades de target
```js
event.target.id;           // Devuelve el id del elemento que disparó el evento.
event.target.className;    // Devuelve la clase del elemento que disparó el evento.
event.target.tagName;      // Devuelve el nombre de la etiqueta del elemento que disparó el evento.
event.target.innerHTML;    // Devuelve el contenido HTML del elemento que disparó el evento.
event.target.value;        // Devuelve el valor del elemento que disparó el evento.
event.target.textContent;  // Devuelve el contenido de texto del elemento que disparó el evento.
event.target.elements;     // Devuelve una colección con todos los elementos de un formulario.
```

### 5.4. Personalizados
```js
// Creación:
var event = new CustomEvent("nombre", {detail: {key: "value", key2: "value2"}});

// Disparo:
element.dispatchEvent(event);
```
---
<br><br><br>

## *[volver al índice](../README.md)*