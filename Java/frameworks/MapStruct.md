# MapStruct

## 1. ¿Qué es MapStruct?
Es una biblioteca Java que simplifica la implementación de mapeos entre beans Java. Permite generar automáticamente código de mapeo entre beans Java basado en anotaciones.

---
<br>

## 2. Dependencia Maven:
### 2.1. Dependencia de MapStruct:
```xml
<properties>
    <org.mapstruct.version>1.6.2</org.mapstruct.version>
</properties>

<dependencies>
    <dependency>
        <groupId>org.mapstruct</groupId>
        <artifactId>mapstruct</artifactId>
        <version>${org.mapstruct.version}</version>
    </dependency>
</dependencies>

<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.8.1</version>
            <configuration>
                <source>1.8</source> <!-- depending on your project -->
                <target>1.8</target> <!-- depending on your project -->
                <annotationProcessorPaths>
                    <path>
                        <groupId>org.mapstruct</groupId>
                        <artifactId>mapstruct-processor</artifactId>
                        <version>${org.mapstruct.version}</version>
                    </path>
                    <!-- other annotation processors -->
                </annotationProcessorPaths>
            </configuration>
        </plugin>
    </plugins>
</build>
```
### 2.2. Dependencia de Lombok (opcional):
```xml
<properties>
    <org.mapstruct.version>1.6.2</org.mapstruct.version>
    <lombok-mapstruck-bindings.version>0.2.0</lombok-mapstruck-bindings.version>    
</properties>
 
<annotationProcessorPaths>
    <path>
       <groupId>org.mapstruct</groupId>
           <artifactId>mapstruct-processor</artifactId>
           <version>${org.mapstruct.version}</version>
    </path>
    <path>
        <groupId>org.projectlombok</groupId>
        <artifactId>lombok</artifactId>
        <version>${lombok.version}</version>
    </path>
    <path>
        <groupId>org.projectlombok</groupId>
        <artifactId>lombok-mapstruct-binding</artifactId>
        <version>${lombok-mapstruck-bindings.version}</version>
    </path>
</annotationProcessorPaths>
```
---
<br>

## 3. Uso de MapStruct:
### 3.1. Crear un mapper:
- `@Mapper`: Anotación que indica que la interfaz es un mapper.
- `@Mapping`: Anotación que indica cómo se mapean los atributos.
- `Mappers.getMapper(BookMapper.class)`: Método que devuelve una instancia del mapper.
- `toBookCollection(Book book)`: Método que mapea un objeto `Book` a un objeto `BookCollection`.
```java
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface BookMapper {
    BookMapper INSTANCE = Mappers.getMapper(BookMapper.class);
    BookCollection toBookCollection(Book book);
}

// Si queremos cambiar el nombre de los atributos o ignorar alguno(@Mapping):
@Mapper
public interface BookMapper {

    BookMapper INSTANCE = Mappers.getMapper(BookMapper.class);

    @Mapping(source = "title", target = "name")
    @Mapping(source = "author", target = "writer")
    @Mapping(target = "id", ignore = true)
    BookCollection toBookCollection(Book book);
}

// Si queremos añadir un método para mapear una lista de objetos MapStruct lo utiliza automáticamente:
@Mapper
public interface BookMapper {

    BookMapper INSTANCE = Mappers.getMapper(BookMapper.class);

    List<String> toBookNameList(List<Book> books);

    default String toBookName(Book book) {
        return book.getTitle();
    }
}

// Si utilizamos varios métodos default con el mismo tipo y los mismos parámetros habrá que especificar que método queremos utilizar:
@Mapper
public interface BookMapper {

    BookMapper INSTANCE = Mappers.getMapper(BookMapper.class);

    @IterableMapping(qualifiedByName = "name")
    List<String> toBookNameList(List<Book> books);

    @IterableMapping(qualifiedByName = "writer")
    List<String> toBookWriterList(List<Book> books);

    @Named("name")
    default String toBookName(Book book) {
        return book.getTitle();
    }

    @Named("writer")
    default String toBookWriter(Book book) {
        return book.getAuthor();
    }
}

// Si queremos utilizar otros mappers:
@Mapper(uses = {AuthorMapper.class, PublisherMapper.class, CategoryMapper.class})
public interface BookMapper {
    BookMapper INSTANCE = Mappers.getMapper(BookMapper.class);
    BookCollection toBookCollection(Book book);
}

// Si queremos mappear a varios objetos:
@Mapper
public interface BookMapper {
    BookMapper INSTANCE = Mappers.getMapper(BookMapper.class);
    BookCollection toBookCollection(Book book);
    BookDetail toBookDetail(Book book);
}
```
---
<br><br><br>

## *[volver al índice](../../README.md)*