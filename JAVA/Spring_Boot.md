# SPRING

## Spring Boot Extension Pack (Colección de Visual Studio Code compuesta de 3 extensiones):
- **Spring Boot Tools:** proporciona `herramientas` para desarrollar y solucionar problemas de aplicaciones Spring Boot.
- **Spring Initializr Java:** brinda soporte para generar proyectos Spring Boot Java de `inicio rápido` con la API Spring Initializr.
- **Spring Boot Dashboard:** proporciona un `explorador` en la barra lateral donde podemos ver todos los proyectos Spring Boot de un espacio de trabajo. También podemos iniciar, detener o depurar rápidamente un proyecto.

## Creamos el proyecto: [spring.io](https://start.spring.io)

###	1. Añadir dependencias:
- **Thymeleaf:** sistema de `plantillas` para entornos web.
- **Spring web:** iniciador de aplicaciones web (Utiliza `Tomcat` como servidor web embebido).
- **Spring Boot DevTools:** conjunto de `herramientas` para facilitar el desarrollo de aplicaciones.


### 2. Modificar puerto:
resources >> application.properties >> `server.port = 8081`

### 3. Necesitamos un MainController dentro de ./controller para gestionar las rutas:
```java
package com.fpmislata.practica.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping; //Anotación de Spring que proporciona un mapeo directo entre las solicitudes HTTP y los métodos de controlador.

@Controller
public class MainController {

    @GetMapping("/")
    public String index() {
        return "index";    
    }

    @GetMapping("/about")
    public void about() {
        return "about";
    }

}
```

### 4. Rutas con parámetros variables (/productos/{id}):
```java
package com.fpmislata.practica.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; //Interfaz de Spring utilizada para añadir atributos al modelo que se pasará a la vista.
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable; //Anotación de Spring que se utiliza para vincular variables de plantilla en la URL de una petición a parámetros de método en un controlador.
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/products")
@Controller
public class ProductController {
    ProductService productService = new ProductServiceImpl(); //Creamos una instancia de la interfaz ProductService que la implementa ProductServiceImpl.

    @GetMapping
    public String getAll(Model model) {
        model.addAttribute("products", productService.getAll();
        return "products";
    }

    @GetMapping("/{id}")
    public void getById(@PathVariable("id") int id, Model model) {
        model.addAttribute("product", productService.getById(id));
        return "product";
    }

    
}
```

### 5. Thymeleaf:
- Creamos: `/resources/templates/index.html` y `/resources/templates/about.html`
- Los estilos están en: `/resources/static/css`
- Las imágenes están en: `/resources/static/img`

### 6. Deshabilitar la página de error WhiteLabel de Spring Boot:
- `server.error.whitelabel.enabled=false`
- Creamos nuestra propia página de error: `/resources/templates/error.html`

### 7. Creamos products.html:
```java
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
</head>

<body>
    <ul>
        <a th:each="product : ${products}" th:href="@{/products/{id}(id=${product.id})}">
            <li th:text="|${product.brand} - ${product.name}|">Texto por defecto</li>
        </a>
    </ul>
</body>

</html>
```

### 8. Creamos product.html:
```java
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product details</title>
</head>

<body>
    <h1>Detalles del Producto</h1>
    <div>
        <p>ID: <span th:text="${product.id}"></span></p>
        <p>Nombre: <span th:text="${product.name}"></span></p>
        <p>Marca: <span th:text="${product.brand}"></span></p>
        <p>Precio: <span th:text="${product.price}"></span></p>
    </div>
    <a href="/products">Volver a productos</a>
</body>
</html>
```
<br><br><br>

## *[volver al índice](../index.md)*