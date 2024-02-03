# SPRING

## Spring Boot Extension Pack (Colección de Visual Studio Code compuesta de 3 extensiones):
- **Spring Boot Tools:** proporciona `herramientas` para desarrollar y solucionar problemas de aplicaciones Spring Boot.
- **Spring Initializr Java:** brinda soporte para generar proyectos Spring Boot Java de `inicio rápido` con la API Spring Initializr.
- **Spring Boot Dashboard:** proporciona un `explorador` en la barra lateral donde podemos ver todos los proyectos Spring Boot de un espacio de trabajo. También podemos iniciar, detener o depurar rápidamente un proyecto.

## Creamos el proyecto: [spring.io](https://start.spring.io)

###	1. Añadir dependencias:
- **Thymeleaf:** sistema de `plantillas` para entornos web.
- **Spring web:** iniciador de aplicaciones web (Utiliza `Tomcat` como servidor web embebido).
- **Spring Boot DevTools:** conjunto de `herramientas` para facilitar el desarrollo de aplicaciones


### 2. Modificar puerto:
resources >> application.properties >> `server.port = 8081`

### 3. Creamos MainController dentro de ./controller:
```java
package com.fpmislata.practica.controller;

import org.springframework.stereotype.Controller; //es una anotación que marca una clase como controladora en el patrón MVC, manejando solicitudes y respuestas HTTP en una aplicación web.

@Controller
public class MainController {

    public void index() {
        System.out.println("Método index de MainController ejecutándose");
    }

}
```

### 4. Añadimos rutas (/, /about):
```java
package com.fpmislata.practica.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping; //es una anotación que proporciona un mapeo directo entre las solicitudes HTTP y los métodos de controlador.

@Controller
public class MainController {

    @GetMapping("/")
    public void index() {
        System.out.println("Método index de MainController ejecutándose");
    }

    @GetMapping("/about")
    public void about() {
        System.out.println("Método about de MainController ejecutándose");
    }

}
```

### 5. Rutas con parámetros variables (/productos/{id}):
```java
package com.fpmislata.practica.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable; //es una anotación que se utiliza para vincular variables de plantilla en la URL de una petición a parámetros de método en un controlador.

@Controller
public class ProductController {

    @GetMapping("/productos/{id}")
    public void getById(@PathVariable("id") int id) {
        System.out.println("Ruta: /productos/" + id );
    }
}
```

### 6. Thymeleaf:
- Creamos `/resources/templates/index.html`
- Retornamos "index" en el MainController y cambiamos el método a String: `return "index"`
- Los estilos están en: **/resources/static/css**
- Las imágenes están en: **/resources/static/img**

### 7. Deshabilitar la página de error WhiteLabel de Spring Boot:
- `server.error.whitelabel.enabled=false`
- Creamos nuestra propia página de error: `/resources/templates/error.html`

### 8. Creamos una clase Product:
```java
package com.fpmislata.dawprogeval2prac1.business.entity;
 
import java.math.BigDecimal;
 
public class Product {
 
    private int id;
    private String name;
    private String brand;
    private BigDecimal price;
 
    public Product(int id, String name, String brand, BigDecimal price) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.price = price;
    }
 
    public int getId() {
        return id;
    }
 
    public String getName() {
        return name;
    }
 
    public String getBrand() {
        return brand;
    }
 
    public BigDecimal getPrice() {
        return price;
    }
}
```

### 9. Modificamos ProductController:
```java
package com.fpmislata.dawprogeval2prac1.controller;
 
import java.math.BigDecimal;                                    //Clase de Java que permite trabajar con números decimales de alta precisión.
import java.util.List;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;                            //Interfaz de Spring utilizada para añadir atributos al modelo que se pasará a la vista.
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;  //Anotación de Spring que se utiliza para mapear solicitudes web a métodos específicos en los controladores.
 
import com.fpmislata.dawprogeval2prac1.business.entity.Product;
 
@RequestMapping("/products")
@Controller
public class ProductController {
 
    List<Product> products = List.of(
        new Product(1, "Producto A", "Marca A", new BigDecimal(23.99)),
        new Product(2, "Producto B", "Marca A", new BigDecimal(14.99)),
        new Product(3, "Producto C", "Marca B", new BigDecimal(68.99))
    );
 
    @GetMapping
    public String getAll(Model model){
        model.addAttribute("products", this.products);
        return "products";
    }
 
}
```

### 10. Creamos products.html:
```java
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <ul>
        <a th:each="product : ${products}" th:href="@{${'/products/' + product.id}}">
            <li th:text="|${product.brand} - ${product.name}|">Texto por defecto</li>
        </a>
    </ul>
</body>

</html>
```
<br><br><br>

## *[volver al índice](../index.md)*