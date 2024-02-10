# THYMELEAF

### xmlns:th
- Es una declaración de espacio de nombres XML para Thymeleaf en un archivo HTML para definir que todos los atributos con el prefijo th: pertenecen a Thymeleaf.
```html
<html xmlns:th="http://www.thymeleaf.org">
```

### th:text
- Se utiliza para establecer el texto de un elemento HTML. Puede ser utilizado para mostrar el valor de una variable:
```html
    <p th:text="${mensaje}"></p>                                     <!-- Mostrará el valor de la variable `mensaje` dentro de un párrafo. -->
    <p th:text="|${sms1} - ${sms2} - ${sms3}|"></p>                  <!-- Concatenamos cadenas de String. -->
```

### th:each
- Se utiliza para iterar sobre colecciones (como listas o arrays). Es similar a un bucle for en Java:
```html
    <li th:each="item : ${items}" th:text="${item}"></li>            <!-- Iterará sobre la colección `items`, creando un elemento de lista `<li>` por cada ítem. -->
```

### th:href, th:src
- Se utilizan para establecer dinámicamente el atributo **href** de un enlace o el atributo **src** de una imagen:
```html
    <a th:href="@{/ruta}">Enlace</a>                                 <!-- Para enlaces. -->
    <a th:href="@{/ruta/{id}(id=${user.id})}">Enlace</a>             <!-- Para enlaces con parámetros. -->
    <a th:href="@{${'/ruta/' + user.id}}">Enlace</a>                 <!-- Para enlaces con parámetros. -->

    <img th:src="@{/ruta/imagen.png}" />                             <!-- Para imágenes. -->
```

### th:object
- Se utiliza para especificar el objeto al que se aplicarán las expresiones en un formulario, facilitando el enlace de datos del formulario a objetos de modelo en el backend:
```html
    <form th:object="${objetoFormulario}" th:action="@{/enviar}" method="post">...</form>
```

### th:value
- Se utiliza para establecer el valor de un campo de formulario:
```html
    <input type="text" th:value="${valor}" />                        <!-- Establece el valor del `input` al valor de la variable `valor`. -->
```

### th:field
- Se utiliza para vincular campos de formulario directamente a las propiedades de los objetos en tu modelo.
```html
    <input type="text" th:field="*{propiedad}" />                    <!-- Vincula el campo de formulario directamente a la propiedad `propiedad` del objeto en el modelo. -->
```

### th:fragment, th:replace, th:include, th:block
- Se utilizan para insertar fragmentos de otras plantillas.
- **th:fragment** crea un fragmento que puede ser incluido o reemplazado en otras partes de la misma plantilla o en diferentes plantillas.
- **th:replace** reemplaza completamente el element.
- **th:include** solo incluye el contenido interno del fragmento.
- **th:block** es un elemento de utilidad que Thymeleaf usa para agrupar otros elementos sin generar una etiqueta extra en el HTML final.
```html
    <head th:fragment="head"></head>                                 <!-- Crea un fragmento con el contenido del `head`. -->

    <head th:replace="template :: head"></head>                      <!-- Reemplaza el `head` por el fragmento `head`. -->
    <head th:include="template :: head"></head>                      <!-- incluye el contenido del fragmento `head` en el `head`. -->
    <head>
        <th:block th:include="template :: head"></th:block>          <!-- Nos permite añadir contenido del head` en un head que ya posee contenido. -->
        <title>Título</title>
    </head>
```

### th:if, th:unless
- **th:if** se utiliza para incluir un elemento solo si la condición es verdadera. 
- **th:unless** es lo opuesto, incluyendo el elemento solo si la condición es falsa.
```html
    <div th:if="${condicion}"></div>                                 <!-- Este bloque se muestra si 'condicion' es verdadera. -->
    <div th:unless="${condicion}"></div>                             <!-- Este bloque se muestra si 'condicion' es falsa. -->
```

### th:class, th:classappend
- **th:class** establece la clase CSS de un elemento.
- **th:classappend** agrega clases adicionales sin sobrescribir las existentes.
```html
    <div th:class="${condicion ? 'clase-verdadera' : 'clase-falsa'}"></div>
    <div th:classappend="${condicion ? 'clase-adicional' : ''}"></div>
```

### th:style
- Se utiliza para establecer el estilo de un elemento HTML.
```html
    <div th:style="'color: ' + ${color} + '; font-size: ' + ${size} + 'px'"></div>
```

### th:attr
- Se utiliza para establecer atributos HTML.
```html
    <a th:attr="href=@{${'/ruta/' + user.id}}">Enlace</a>            <!-- Establece el atributo `href` del enlace. -->
```

### th:with
- Se utiliza para definir variables locales.
```html
    <div th:with="var=${expresion}"></div>                           <!-- Define la variable `var` con el valor de `expresion`. -->
```

### th:onclick
- Se utiliza para establecer el evento `onclick` de un elemento HTML.
```html
    <button th:onclick="'alert(' + ${mensaje} + ')'">Botón</button>  <!-- Establece el evento `onclick` del botón. -->
```
<br><br><br>

## *[volver al índice](../index.md)*