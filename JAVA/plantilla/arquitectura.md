# Arquitectura por capas

```java
/PROYECT
└─ /CONTROLLER ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─  //Capa de PRESENTACIÓN de nuestra aplicación (controladores).
|     └─ BookController.java ─ ─ ─ ─ ─ ─ ─ ─ ─  //Controlador de libros.
|
└─ /DOMAIN   ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─  //Capa de DOMINIO o NEGOCIO de nuestra aplicación (entidades y servicios).
|     └─ /entity ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─  //Entidades de nuestra aplicación.
|     |     └─ Book.java ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─  //Modelo de negocio.
|     └─ /service  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─  //Servicios de nuestra aplicación.
|            └─ <<BooksService>> ─ ─ ─ ─ ─ ─ ─  //Interfaz del caso de uso "Listar todos los libros".
|            └─ /impl  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─  //Implementaciones de nuestros servicios.
|                  └─ BooksServiceImpl.java  ─  //Implementación de la interface BooksService.
|                  
└─ /PERSISTENCE  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─  //Capa de PERSISTENCIA de nuestra aplicación (repositorios).
|      └─ <<BookRepository>>   ─ ─ ─ ─ ─ ─ ─ ─  //Interfaz de acceso a datos de los libros.
|      └─ /impl  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─  //Implementaciones de nuestros repositorios.
|            └─ StaticBookRepositoryImpl.java   //Implementación estática de la interface BookRepository.
|
└─ App.java ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─   //Clase principal de nuestra aplicación.
```
<br><br><br>

## *[volver al índice](../index.md)*