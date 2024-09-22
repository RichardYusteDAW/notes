# Arquitectura de node

```java
/PROJECT
└─ /common -- -- -- -- -- -- // Nueva carpeta para configuraciones y utilidades comunes.
│   └─ /config   -- -- -- -- // Configuraciones de la aplicación como conexiones a bases de datos y variables de entorno.
│   └─ /utils -- -- -- -- -- // Utilidades y funciones de ayuda que pueden ser utilizadas en varias partes del proyecto.
│
└─ /controller   -- -- -- -- // Nueva capa para manejar las solicitudes HTTP.
│   └─ /handlers -- -- -- -- // Controladores que manejan las solicitudes HTTP y envían respuestas.
│   │   └─ bookHandler.js -- // Controlador para la gestión de libros.
│   │
│   └─ /middlewares -- -- -- // Middlewares para procesamiento previo de las solicitudes.
│   │
│   └─ /routes   -- -- -- -- // Rutas que definen los endpoints y conectan con los controladores.
│       └─ bookRoutes.js  -- // Rutas para la gestión de libros.
|       └─ router.js      -- // Router principal que conecta todas las rutas.
│
└─ /domain -- -- -- -- -- -- // Contiene la lógica de negocio y modelos.
│   └─ /models   -- -- -- -- // Modelos que representan las estructuras de datos.
│   │   └─ book.js  -- -- -- // Modelo para libro.
│   │
│   └─ /services -- -- -- -- // Servicios que contienen la lógica de negocio.
│       └─ bookService.js  -- // Servicio para gestionar libros.
│
└─ /persistence  -- -- -- -- // Capa de persistencia de la aplicación.
│   └─ /repository  -- -- -- // Repositorios para el acceso y manejo de la persistencia de datos.
│   │   └─ bookRepository.js // Repositorio para libros.
│   │
│   └─ /dao   -- -- -- -- -- // Acceso a datos de la aplicación.
│       └─ bookDao.js  -- -- // DAO para la entidad libro.
│
└─ /public -- -- -- -- -- -- // (Opcional) Archivos estáticos como imágenes, CSS y JavaScript para el front-end.
└─ /views  -- -- -- -- -- -- // (Opcional) Vistas del servidor si estás sirviendo HTML.
│
└─ app.js  -- -- -- -- -- -- // El archivo principal de la aplicación que configura y lanza el servidor.
│
└─ package.json  -- -- -- -- // Archivo de configuración del proyecto, incluye dependencias, scripts y metadatos del proyecto.
```
<br><br><br>

## *[volver al índice](../../README.md)*