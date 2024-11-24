# Spring

## 1. ¿Qué es? 🤔
Spring Framework es un marco de trabajo de código abierto que se creó para abordar las limitaciones de J2EE (Java 2 Platform, Enterprise Edition).  
Se basa en la programación orientada a aspectos y en la inversión de control y se utiliza para desarrollar aplicaciones empresariales en Java.

---
<br>

## 2. Características principales: 🌟
- `Gestión de Beans`: Los objetos que forman la columna vertebral de tu aplicación y son gestionados por el Spring IoC container se llaman beans. Un bean es un objeto que es instanciado, ensamblado y gestionado por un contenedor Spring.
- `Desacoplamiento`: La configuración de los objetos y sus interdependencias se gestionan fuera del código de los componentes, a menudo en archivos XML o mediante anotaciones, lo que reduce el acoplamiento entre componentes.
- `Integración`: Spring ofrece integración con otras tecnologías y frameworks como JPA/Hibernate, JDBC, JMS, y web services, facilitando así la creación de aplicaciones que necesitan integrar varios tipos de tecnologías.
- `Transaccionalidad`: Soporte para la gestión programática y declarativa de transacciones para simplificar el desarrollo de aplicaciones que realizan operaciones con bases de datos.
---
<br>

## 3. Spring Modules: 📦
- `Spring Core Container`: Incluye el contenedor IoC y beans.
- `Spring AOP`: Proporciona el soporte para programación orientada a aspectos.
- `Spring Data Access/Integration`: Incluye el soporte para JDBC, JPA, JMS y transacciones.
- `Spring Web`: Incluye Spring Web MVC y Spring WebFlux, frameworks para construir aplicaciones web.
- `Spring Security`: Proporciona características de autenticación y autorización para proteger aplicaciones.
- `Spring Test`: Proporciona soporte para pruebas unitarias y de integración.
---
<br>

## 4. Anotaciones Spring: 📝
```java
@Configuration            // Indica que una clase es una clase de configuración de Spring.
@EnableAutoConfiguration  // Habilita la configuración automática de Spring Boot basada en las dependencias que se agregan al proyecto en el classpath.
@ComponentScan            // Escanea el paquete base para buscar componentes de Spring.

@Bean                     // Indica que un método produce un bean para ser administrado por el contenedor Spring.
@Primary                  // Indica que un bean debe ser preferido cuando hay varios candidatos.

@Component                // Indica que una clase es un componente de Spring.
   @Service               // Alias de @Component, indica que una clase es un servicio.
   @Repository            // Alias de @Component, indica que una clase es un repositorio.
@Autowired                // Inyección de dependencias.
@Qualifier                // Especifica cuál bean se debe inyectar.
@Value                    // Inyecta valores de propiedades.
@Scope                    // Define el alcance de un bean.
@PostConstruct            // Método de inicialización.
@PreDestroy               // Método de destrucción.
```
***Ver explicaciones más detalladas en:* [Beans](../concepts/Bean.md)

---
<br>

## 5. Spring MVC: 🌐
### 5.1. ¿Qué es Spring MVC?
Spring MVC es un framework MVC (Modelo-Vista-Controlador) para construir aplicaciones web.
- **Model:** Representa los datos o el estado de la aplicación.
- **View:** Representa la interfaz de usuario.
- **Controller:** Procesa las solicitudes del usuario y devuelve la respuesta.

### 5.2. Flujo de trabajo de Spring MVC:
1. El usuario envía una solicitud a la aplicación.
2. El controlador recibe la solicitud y procesa la lógica de negocio.
3. El controlador devuelve la vista al usuario.
4. El usuario ve la vista y envía otra solicitud.

### 5.3. Anotaciones Spring MVC:
```java
/* Controladores */
@Controller       // Indica que una clase es un controlador (Devuelve HTML).
@RestController   // Combina @Controller y @ResponseBody (Devuelve JSON o XML).
@ControllerAdvice // Permite manejar excepciones a nivel global en la aplicación.

/* Mapeo de solicitudes */
@RequestMapping   // Mapea las solicitudes web a métodos de controlador específicos.
  @GetMapping     // Mapea las solicitudes HTTP GET a métodos de controlador.
  @PostMapping    // Mapea las solicitudes HTTP POST a métodos de controlador.
  @PutMapping     // Mapea las solicitudes HTTP PUT a métodos de controlador.
  @DeleteMapping  // Mapea las solicitudes HTTP DELETE a métodos de controlador.
  @PatchMapping   // Mapea las solicitudes HTTP PATCH a métodos de controlador.

/* Parámetros de solicitud */
@PathVariable     // Variables en la URL de la solicitud.
@RequestBody      // Cuerpo de la solicitud.
@RequestParam     // Parámetros de la solicitud (GET y POST).
@RequestHeader    // Headers de la solicitud.
@CookieValue      // Cookies de la solicitud.

/* Parámetros de respuesta */
@ResponseBody     // Devuelve el objeto y lo convierta automáticamente en JSON o XML.
@ResponseStatus   // Devuelve un código de estado y un mensaje personalizado.
@ExceptionHandler // Maneja excepciones en métodos de controlador y devuelve una respuesta personalizada.
```
---
<br>

## 6. Spring Boot: 🚀
Spring Boot es un proyecto de Spring que simplifica la creación de aplicaciones basadas en Spring.

### 6.1. Spring Boot Extension Pack (Colección de Visual Studio Code compuesta de 3 extensiones):
- **Spring Initializr Java:** brinda soporte para generar proyectos Spring Boot Java de `inicio rápido` con la API Spring Initializr.
- **Spring Boot Tools:** proporciona `herramientas` para desarrollar y solucionar problemas de aplicaciones Spring Boot.
- **Spring Boot Dashboard:** proporciona un `explorador` en la barra lateral donde podemos ver todos los proyectos Spring Boot de un espacio de trabajo. También podemos iniciar, detener o depurar rápidamente un proyecto.

***También puedes crear el proyecto en:* [spring.io](https://start.spring.io)

### 6.2. Dependencias:
- **starter-web:** Iniciador de aplicaciones web (`Tomcat` + `Spring MVC` + `Jackson` + `validation` + `logging`).
- **starter-actuator:** Proporciona funciones de supervisión y administración de aplicaciones con endpoints REST.
- **starter-devtools:** Conjunto de herramientas para facilitar el desarrollo de aplicaciones. Permite la `recarga` automática de la aplicación cuando se realizan cambios.
```xml
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>

    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-actuator</artifactId>
    </dependency>

    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-devtools</artifactId>
        <scope>runtime</scope>
        <optional>true</optional>
    </dependency>
</dependencies>
```

### 6.3. Anotaciones Spring Boot:
```java
@SpringBootApplication // Anotación compuesta que combina @Configuration, @EnableAutoConfiguration y @ComponentScan.
public class App {
    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }
}
```
<br><br><br>

## *[volver al índice](../../README.md)*