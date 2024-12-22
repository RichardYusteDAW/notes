# JPA

## 1. ¿Qué es JPA? 🌐
Java Persistence API (JPA) es una API de Java que puede ser utilizada para almacenar, acceder y administrar datos entre objetos Java / POJO y una base de datos relacional.

---
<br>

## 2. Dependencias 📦
- Esta dependencia instala `Spring Data JPA`, `Spring JDBC`, `Spring Transaction`, `Spring AOP` Y `Spring Aspects`.
```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>
```
---
<br>

## 3. Application properties ⚙️
- `spring.jpa.show-sql`: Muestra por consola las consultas SQL generadas por Hibernate.
- `spring.jpa.hibernate.ddl-auto`: Permite que Hibernate genere las tablas automáticamente.
  - `none`: No realiza ninguna acción.
  - `create`: Crea las tablas cada vez que se inicia la aplicación.
  - `create-drop`: Crea las tablas cada vez que se inicia la aplicación y las elimina al finalizar.
  - `update`: Actualiza las tablas cada vez que se inicia la aplicación.

```bash
# Database Configuration
spring.datasource.url=jdbc:mysql://localhost:3306/movies
spring.datasource.username=root
spring.datasource.password=1234

# Hibernate Configuration
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=none 
```
---
<br>

## 4. Entidad 📄
```java
@Entity                                                      // Indica que la clase es una entidad.
@Table(name = "books")                                       // Indica el nombre de la tabla a la que hace referencia.
@Data
@NoArgsConstructor
public class BookEntity {
    @Id                                                      // Indica que el atributo es la clave primaria.
    @GeneratedValue(strategy = GenerationType.IDENTITY)      // Indica que el valor es autoincremental.
    private Long id;
    private String isbn;
    @Column(name = "title_es")                               // Indica el nombre de la columna en la tabla.
    private String titleEs;
    @Column(name = "title_en")
    private String titleEn;
    @Column(name = "synopsis_es")
    private String synopsisEs;
    @Column(name = "synopsis_en")
    private String synopsisEn;
    private BigDecimal price;
    private float discount;
 
    @ManyToOne(fetch = FetchType.LAZY)                       // Indica la relación muchos a uno. Lazy carga los datos solo cuando se necesitan.
    @JoinColumn(name = "publisher_id")                       // Indica la columna que hace referencia a la clave foránea.
    private PublisherEntity publisher;
    @ManyToMany(fetch = FetchType.LAZY)                      // Indica la relación muchos a muchos. Lazy carga los datos solo cuando se necesitan.
    @JoinTable(
        name = "books_authors",                              // Indica la tabla intermedia.
        joinColumns = @JoinColumn(name = "book_id"),         // Indica la columna que hace referencia a la clave primaria de la entidad.
        inverseJoinColumns = @JoinColumn(name = "author_id") // Indica la columna que hace referencia a la clave primaria de la entidad relacionada.
    );
    private List<AuthorEntity> authors;
}
```
---
<br>

## 5. Repositorio 🗄️
```java
@Repository
public interface BookJpa extends JpaRepository<BookEntity, Long> {
    @Query("SELECT b.* FROM books b WHERE b.isbn = :isbn", nativeQuery = true)
    BookEntity findByIsbn(String isbn);

    @Query("SELECT b.* FROM books b " +
           "JOIN books_authors ba ON b.id = ba.book_id " +
           "JOIN authors a ON ba.author_id = a.id " +
           "WHERE a.name = :name", nativeQuery = true)
    List<BookEntity> findAllByActorName(String title);
}
```
---
<br>

## 6. Paginación 📄
```java
public class BookDaoImpl implements BookDao {
    
    private BookJpa bookJpa;

    @Override
    public List<Book> getAll(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<BookEntity> bookEntityPage= bookJpa.findAll(pageable);
        List<Book> books = bookEntityPage
            .stream()
            .map(b-> BookMapper.INSTANCE.toBook(b))
            .toList();
        
        return books;
    }
}
```
---
<br><br><br>

## *[volver al índice](../../README.md)*