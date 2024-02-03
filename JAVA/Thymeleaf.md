# THYMELEAF

### th:text
- Se utiliza para establecer el texto de un elemento HTML. Puede ser utilizado para mostrar el valor de una variable:
```
    <p th:text="${mensaje}"></p>                                //Mostrará el valor de la variable `mensaje` dentro de un párrafo.
    <p th:text="|${sms1} - ${sms2} - ${sms3}|"></p>             //Concatenamos cadenas de String.
```

### th:each
- Se utiliza para iterar sobre colecciones (como listas o arrays). Es similar a un bucle for en Java:
```
    <li th:each="item : ${items}" th:text="${item}"></li>       //Iterará sobre la colección `items`, creando un elemento de lista `<li>` por cada ítem.
```

### th:if, th:unless
- **th:if** se utiliza para incluir un elemento solo si la condición es verdadera. 
- **th:unless** es lo opuesto, incluyendo el elemento solo si la condición es falsa.
```
    <div th:if="${condicion}"></div>                            //Este bloque se muestra si 'condicion' es verdadera.
    <div th:unless="${condicion}"></div>                        //Este bloque se muestra si 'condicion' es falsa.
```

### th:href, th:src
- Se utilizan para establecer dinámicamente el atributo **href** de un enlace o el atributo **src** de una imagen:
```
    <a th:href="@{/ruta}">Enlace</a>                            //Para enlaces.
    <a th:href="@{/ruta/{id}(id=${user.id})}">Enlace</a>        //Para enlaces con parámetros.
    <a th:href="@{${'/ruta/' + user.id}}">Enlace</a>            //Para enlaces con parámetros.

    <img th:src="@{/ruta/imagen.png}" />                        //Para imágenes.
```

### th:replace, th:include
- Se utilizan para insertar fragmentos de otras plantillas. 
- **th:replace** reemplaza completamente el element.
- **th:include** solo incluye el contenido interno del fragmento.
```
    <div th:replace="fragmentos/cabecera :: cabecera"></div>    //Reemplaza el `div` con el contenido definido en el fragmento `cabecera`.
    <div th:include="fragmentos/header :: common-header"></div> //Incluye el contenido interno del fragmento 'common-header' definido en 'fragmentos/header.html' dentro del `<div>` existente.

```

### th:value
- Se utiliza para establecer el valor de un campo de formulario:
```
    <input type="text" th:value="${valor}" />                   //Establece el valor del `input` al valor de la variable `valor`.
```

### th:object
- Se utiliza para especificar el objeto al que se aplicarán las expresiones en un formulario, facilitando el enlace de datos del formulario a objetos de modelo en el backend:
```
    <form th:object="${objetoFormulario}" th:action="@{/enviar}" method="post">...</form>
```

### th:class, th:classappend
- **th:class** establece la clase CSS de un elemento.
- **th:classappend** agrega clases adicionales sin sobrescribir las existentes.
```
    <div th:class="${condicion ? 'clase-verdadera' : 'clase-falsa'}"></div>
    <div th:classappend="${condicion ? 'clase-adicional' : ''}"></div>
```
<br><br><br>

## *[volver al índice](../index.md)*