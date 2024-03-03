# BEANS

## 1. BEANS EN XML
Un bean en JAVA es un objeto que posee:
 - Un constructor vacío.
 - Getters y setters.
 - Es serializable (utiliza la interfaz `java.io.Serializable`).

 Un bean en Spring es un objeto que:
  - No necesita un contructor vacío.
  - Tiene getters y setters
  - No es necesario que sea serializable.

Spring Framework utiliza beans como objetos gestionados por su contenedor de Inversión de Control (IoC).  
Los beans se definen en un archivo de configuración XML, permitiendo a Spring instanciar, configurar y ensamblar los objetos automáticamente.

### A. Definir un bean en XML:
Para definir un bean en el archivo de configuración XML de Spring, necesitas especificar:
- La clase del bean:
  - **id:** El identificador único del bean dentro del contenedor de Spring.
  - **class:** Ruta de la clase Java a instanciar para este bean.
  - **scope:** Determina la vida útil de ese bean en el contexto de la aplicación.
    - *Singleton*: Una única instancia por contenedor de Spring, compartida en toda la aplicación.
    - *Prototype*: Una nueva instancia cada vez que se solicita el bean.
    - *Request*: Una instancia por solicitud HTTP en aplicaciones web.
    - *Session*: Una instancia por sesión de usuario en aplicaciones web.
    - *Application*: Una instancia por aplicación web, compartida entre todas las sesiones y solicitudes.

- Las propiedades:
  - **name:** El nombre de la propiedad en la clase MiClase que deseas configurar.
  - **value:** El valor que deseas asignar a la propiedad. Spring llamará al método setter correspondiente para inyectar este valor.

Ejemplo de un archivo `applicationContext.xml`:
 - **xmlns:** Define el espacio de nombres XML para los beans de Spring. Es necesario para que el archivo XML sea interpretado correctamente como una configuración de Spring.
 - **xmlns:xsi:** Especifica el espacio de nombres XML Schema instance, necesario para utilizar atributos como xsi:schemaLocation.
 - **xsi:schemaLocation:** Proporciona la ubicación del XML Schema que define la estructura permitida del documento XML. Esto permite la validación del archivo de configuración XML de Spring.

```xml
<!-- Raíz del documento de configuración de Spring -->
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           http://www.springframework.org/schema/beans/spring-beans.xsd">
    
    <!-- Definición de un bean individual -->
    <bean id="miBean" class="com.ejemplo.MiClase" scope="prototype"> 
        <property name="mensaje" value="Hola Mundo desde Spring!"/> <!-- Propiedad del bean que se va a configurar -->
    </bean>

</beans>
```

### B. Clase JAVA asociada:
Para el bean definido anteriormente, necesitas una clase Java `MiClase` con una propiedad `mensaje` y sus respectivos métodos getter y setter.

```java
package com.ejemplo;

public class MiClase {
    private String mensaje;

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getMensaje() {
        return mensaje;
    }
}
```

### C. Usar el bean en tu aplicación:
Para usar el bean, debes cargar el contexto de Spring y obtener el bean mediante su ID.

```java
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Principal {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        MiClase obj = context.getBean("miBean", MiClase.class);
        System.out.println(obj.getMensaje());
    }
}
```

### D. Inyección de dependencias:

```xml
<beans xmlns="http://www.springframework.org/schema/beans">

    <!-- Definición del bean dependiente -->
    <bean id="dependenciaClase" class="com.ejemplo.DependenciaClase" />

    <!-- Definición de un bean con una dependencia inyectada -->
    <bean id="miBean" class="com.ejemplo.MiClase">
        <property name="mensaje" value="Hola Mundo desde Spring!"/>
        
        <property name="dependencia" ref="dependenciaClase"/> <!-- Inyección de la dependencia -->
    </bean>

</beans>
```
<br>

## 2. BEANS CON ANOTACIONES
A partir de Spring 2.5, se introdujeron las anotaciones, permitiendo una configuración más intuitiva que los archivos XML.

### A. Habilitar Component Scanning:
Para usar anotaciones, primero necesitas habilitar el escaneo de componentes mediante:
- Tu configuración XML (`applicationContext.xml`):
```xml
<context:component-scan base-package="com.ejemplo" />
```
- Una configuración basada en Java:
```java
@Configuration
@ComponentScan("com.ejemplo")
public class AppConfig {
}
```

### B. Definir un bean con anotaciones:
Usa la anotación `@Component` (o sus especializaciones `@Service`, `@Repository`, `@Controller`) en tus clases Java para definirlas como beans.

```java
package com.ejemplo;
import org.springframework.stereotype.Component;

@Component("miBean") //Si no se especifica nombre el id será el nombre de la clase (MiClase).
public class MiClase {
    private String mensaje = "Hola Mundo desde Spring con Anotaciones!";

    public String getMensaje() {
        return mensaje;
    }
}
```

### C. Usar el bean en tu aplicación:
La forma de usar el bean en tu aplicación no cambia. Spring automáticamente detectará y creará el bean basado en las anotaciones.

```java
public class Principal {
    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        MiClase obj = context.getBean("miBean", MiClase.class);
        System.out.println(obj.getMensaje());
    }
}
```

### D. Inyección de dependencias:
- Definimos un servicio`ServicioEjemplo` como un bean con la anotación `@Service`:
```java
package com.ejemplo;
import org.springframework.stereotype.Service;
import org.springframework.context.annotation.Primary;

@Service("servicioEjemploPrimero")
@Primary // Marca este bean como el primario entre los que implementan la interfaz ServicioEjemplo.
public class ServicioEjemploPrimero implements ServicioEjemplo {
    public String getSaludo() {
        return "Saludo desde ServicioEjemploPrimero";
    }
}

@Service("servicioEjemploSegundo")
public class ServicioEjemploSegundo implements ServicioEjemplo {
    public String getSaludo() {
        return "Saludo desde ServicioEjemploSegundo";
    }
}
```

- Innyectamos `ServicioEjemplo` en `MiClase` usando `@Autowired`:
```java
package com.ejemplo;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

@Component("miBean")
public class MiClase {
    private ServicioEjemplo servicioEjemplo;

    @Autowired
    @Qualifier("servicioEjemploPrimero") // Especifica cuál implementación inyectar en el caso de tener varias.
    public void setServicioEjemplo(ServicioEjemplo servicioEjemplo) {
        this.servicioEjemplo = servicioEjemplo;
    }

    public void mostrarSaludo() {
        System.out.println(servicioEjemplo.getSaludo());
    }
}
```