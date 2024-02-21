# Arquitectura por capas

```java
/PROYECT
└─ /CONTROLLER -- -- -- -- -- -- -- -- -- -- -- --  //Capa de PRESENTACIÓN de nuestra aplicación (controladores).
|     └─ BookController.java  -- -- -- -- -- -- --  //Controlador de libros.
|
└─ /DOMAIN  -- -- -- -- -- -- -- -- -- -- -- -- --  //Capa de DOMINIO o NEGOCIO de nuestra aplicación (entidades y servicios).
|     └─ /entity  -- -- -- -- -- -- -- -- -- -- --  //ENTIDADES de nuestra aplicación.
|     |     └─ Book.java   -- -- -- -- -- -- -- --  //MODELO de negocio.
|     └─ /service -- -- -- -- -- -- -- -- -- -- --  //SERVICIOS de nuestra aplicación.
|            └─ <<BooksService>> -- -- -- -- -- --  //INTERFAZ del caso de uso.
|            └─ /impl  --- -- -- -- -- -- -- -- --  //IMPLEMENTACIONES de nuestros servicios.
|                  └─ BooksServiceImpl.java  -- --  //IMPLEMENTACIÓN de la interface BooksService.
|                  
└─ /PERSISTENCE   -- -- -- -- -- -- -- -- -- -- --  //Capa de PERSISTENCIA de nuestra aplicación (DAOs, repositorios y mapeadores).
|      └─ /dao -- -- -- -- -- -- -- -- -- -- -- --  //Acceso a datos de nuestra aplicación.
|      |     └─ <<BookDao>>   -- -- -- -- -- -- --  //INTERFAZ DAO.
|      |     |
|      |     └─ /entity -- -- -- -- -- -- -- -- --  //ENTIDADES de nuestra capa de persistencia.
|      |     |     └─ BookEntity.java  -- -- -- --  //ENTIDAD de persistencia.
|      |     |
|      |     └─ /impl   -- -- -- -- -- -- -- -- --  //IMPLEMENTACIONES de nuestros DAOs.
|      |           └─ StaticBookDaoImpl.java -- --  //IMPLEMENTACIÓN estática de la interface BookDao.
|      |
|      └─ /repository   -- -- -- -- -- -- -- -- --  //REPOSITORIOS de nuestra aplicación.
|            └─ <<BookRepository>>  -- -- -- -- --  //INTERFAZ del repositorio de libros.
|            └─ /impl   -- -- -- -- -- -- -- -- --  //IMPLEMENTACIONES de nuestros repositorios.
|            |     └─ StaticBookRepositoryImpl.java //IMPLEMENTACIÓN estática de la interface BookRepository.
|            |    
|            └─ /mapper -- -- -- -- -- -- -- -- --  //MAPEADORES de nuestras entidades.
|                  └─ BookMapper.java  -- -- -- --  //MAPEADOR de la entidad Book.
|      
|
└─ App.java -- -- -- -- -- -- -- -- -- -- -- -- --  //Clase PRINCIPAL de nuestra aplicación.
```
<br><br><br>

## *[volver al índice](../../index.md)*