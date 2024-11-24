# ResponseEntity

## 1. ¿Qué es ResponseEntity? 🤔
Es una clase de Spring Framework que representa toda la respuesta HTTP: código de estado, encabezados y cuerpo de la respuesta.  
Se puede utilizar para personalizar la respuesta HTTP devuelta por un controlador.

---
<br>

## 2. Constructores: 🏗️
```java
String body = "This is the body";

/* 1ª Forma: Constructor convencional */
ResponseEntity<String> responseEntity = new ResponseEntity<>(body, HttpStatus.OK);  // Establece el cuerpo de la respuesta y el código de estado.

/* 2ª Forma: Métodos de conveniencia */
ResponseEntity<String> responseEntity2 = ResponseEntity.ok().body(body);

/* 3ª Forma: Métodos de conveniencia */
ResponseEntity<String> responseEntity3 = ResponseEntity.ok(body);

/* 4ª Forma: Métodos de conveniencia */
ResponseEntity<String> responseEntity4 = ResponseEntity.status(HttpStatus.OK).body(body);

/* 5ª Forma: Métodos de conveniencia sin cuerpo */
ResponseEntity<String> responseEntity5 = ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
```
---
<br>

## 3. HTTP Status: 🚦
- Si no se devuelve **body**, se tiene que utilizar el método **build()** para construir la respuesta.
```java
ResponseEntity.status(HttpStatus.CONTINUE).build();                      // 100
ResponseEntity.status(HttpStatus.SWITCHING_PROTOCOLS).build();           // 101
ResponseEntity.status(HttpStatus.PROCESSING).build();                    // 102
ResponseEntity.status(HttpStatus.EARLY_HINTS).build();                   // 103
ResponseEntity.status(HttpStatus.OK).build();                            // 200
ResponseEntity.status(HttpStatus.CREATED).build();                       // 201
ResponseEntity.status(HttpStatus.ACCEPTED).build();                      // 202
ResponseEntity.status(HttpStatus.NON_AUTHORITATIVE_INFORMATION).build(); // 203
ResponseEntity.status(HttpStatus.NO_CONTENT).build();                    // 204
ResponseEntity.status(HttpStatus.MULTIPLE_CHOICES).build();              // 300
ResponseEntity.status(HttpStatus.BAD_REQUEST).build();                   // 400
ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();                  // 401
ResponseEntity.status(HttpStatus.FORBIDDEN).build();                     // 403
ResponseEntity.status(HttpStatus.NOT_FOUND).build();                     // 404
ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();         // 500
ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE).build();           // 503

// Métodos de conveniencia
ResponseEntity.ok();                                                     // 200
ResponseEntity.created(URI.create("https://example.com/resource"));      // 201
ResponseEntity.accepted();                                               // 202
ResponseEntity.nonAuthoritativeInformation();                            // 203
ResponseEntity.noContent();                                              // 204
ResponseEntity.badRequest();                                             // 400
ResponseEntity.unauthorized();                                           // 401
ResponseEntity.forbidden();                                              // 403
ResponseEntity.notFound();                                               // 404
ResponseEntity.internalServerError();                                    // 500
ResponseEntity.serviceUnavailable();                                     // 503
```
---
<br>

## 4. Ejemplo de uso: 📝
```java
import org.springframework.http.ResponseEntity;

@GetMapping("/books")
public ResponseEntity<List<Book>> findAll() {
    try {
        return ResponseEntity.ok(bookService.findAll());
    } catch (Exception e) {
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    }
}

@GetMapping("/books/{id}")
public ResponseEntity<Book> findById(Long id) {
    try {
        return ResponseEntity.ok(bookService.findById(id));
    } catch (Exception e) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Book not found");
    }
}
```
<br><br><br>

## *[volver al índice](../../README.md)*