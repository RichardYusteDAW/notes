# JDBC

## 1. Definición 📚
- **JDBC (Java Database Connectivity)** es una API que nos permite realizar 3 tareas fundamentales:
  - Establecer la CONEXIÓN con la base de datos.
  - Ejecutar QUERIES.
  - Recuperar y procesar los resultados de las queries anteriores.
---
<br>

## 2. Componentes de JDBC (Clases e interfaces): 🧩
- `Driver Manager`: es una clase que gestiona la carga del driver de la base de datos y facilita la obtención de conexiones desde el driver adecuado (Abrir conexión, realizar consultas, cerrar conexión).
- `DataSource`: es una interfaz que representa una fuente de datos (Tenemos un pool de conexiones y podemos pedir una conexión de ese pool que esté disponible).
- `Driver`: es una interfaz que se implementa para conectarse a una base de datos.
- `Connection`: es una interfaz que representa la conexión con la base de datos.
- `Statement`: es una interfaz que representa una sentencia SQL.
- `ResultSet`: es una interfaz que representa el resultado de una consulta SQL.
---
<br>

## 3. Dependecia de Maven 📦
```xml
<dependency>
  <groupId>org.mariadb.jdbc</groupId>
  <artifactId>mariadb-java-client</artifactId>
  <version>3.1.2</version>
</dependency>
```
---
<br>

## 4. Fichero de propiedades 📄
`resources/application.properties`
```properties
spring.datasource.url = jdbc:mariadb://localhost:3306/DB_NAME
spring.datasource.username = USER
spring.datasource.password = PASSWORD
spring.datasource.driver-class-name = org.mariadb.jdbc.Driver
```
---
<br>

## 5. Clase para leer las propiedades 📝
```java
public class AppPropertiesReader {

    // Properties es una clase de Java que representa un conjunto de propiedades (clave-valor)
    private static final Properties properties = new Properties();
    
    // Constructor estático
    static {
            // currentThread() devuelve el hilo actual
            // getContextClassLoader() devuelve el cargador de clases del hilo actual
            // getResourceAsStream() devuelve un flujo de entrada para leer el recurso
        try (InputStream input = Thread.currentThread().getContextClassLoader().getResourceAsStream("application.properties")) {
            properties.load(input);
        } catch (IOException e) {
            throw new RuntimeException("Error loading application.properties file");
        }
    }

    // Método para obtener una propiedad
    public static String getProperty(String key) {
        return properties.getProperty(key);
    }
}
```
---
<br>

## 6. DBConnection 🔌
```java
public class DBConnection {

    // Connection es una interfaz que representa la conexión con la base de datos
    private final Connection connection;

    private final String URL = AppPropertiesReader.getProperty("spring.datasource.url");
    private final String USER = AppPropertiesReader.getProperty("spring.datasource.username");
    private final String PASSWORD = AppPropertiesReader.getProperty("spring.datasource.password");

    // Método para establecer la conexión
    public DBConnection() {
        try {
            connection =  DriverManager.getConnection(URL, USER, PASSWORD);
        
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database");
        }
    }

    public Connection getConnection(){
        return connection;
    }
}
```
---
<br>

## 7. Consultas 🔍
- **Statement**: para ejecutar sentencias SQL simples sin parámetros.
- **PreparedStatement**: para ejecutar sentencias SQL con parámetros.
- **CallableStatement**: para ejecutar procedimientos almacenados con parámetros de entrada y salida.

### 7.1 Métodos 🧮
- **execute()**: para ejecutar cualquier tipo de sentencia SQL. Devuelve TRUE si el primer resultado es un objeto ResultSet.
- **executeQuery()**: para ejecutar sentencias SELECT. Devuelve un objeto ResultSet.
- **executeUpdate()**: para ejecutar sentencias INSERT, UPDATE o DELETE. Devuelve el número de filas afectadas.

#### 7.1.2 Statement 
```java
String sql = "SELECT * FROM movies";
try (Connection connection = new DBConnection().getConnection(); // Abrimos la conexión
     Statement statement = connection.createStatement();         // Creamos el statement
     ResultSet resultSet = statement.executeQuery(sql)) {        // Ejecutamos la consulta
    while (resultSet.next()) {                                   // Recorremos el resultado ya que es un conjunto de resultados
        System.out.println(resultSet.getString("title"));
    }
} catch (SQLException e) {
    throw new RuntimeException("Error executing query");
}
```

#### 7.1.3 PreparedStatement
```java
String sql = """
    INSERT INTO movies (imdb_id, title, year, image, runtime, description, director_id) 
    VALUES ('tt0071524', 'Segunda plana', 1974, null, 105, null, 'nm0000697')                    
""";
try (Connection connection = new DBConnection().getConnection();                // Abrimos la conexión
     PreparedStatement preparedStatement = connection.prepareStatement(sql)) {  // Creamos el preparedStatement
    preparedStatement.executeUpdate();                                          // Ejecutamos la consulta
} catch (SQLException e) {
    throw new RuntimeException("Error executing query");
}
```

#### 7.1.4 CallableStatement
```java
String sql = "{CALL getMovieById(?)}";
try (Connection connection = new DBConnection().getConnection();               // Abrimos la conexión
     CallableStatement callableStatement = connection.prepareCall(sql)) {      // Creamos el callableStatement
    callableStatement.setString(1, "tt0071524");                               // Establecemos los parámetros
    callableStatement.execute();                                               // Ejecutamos la consulta
} catch (SQLException e) {
    throw new RuntimeException("Error executing query");
}
```

### 7.2 Parámetros en las consultas 🛠
```java
String sql = """
    INSERT INTO person (id, name, height, image, description, last_update, birth_date) 
    VALUES (?, ?, ?, ?, null, ?, ?)                    
""";
try (Connection connection = new DBConnection().getConnection();                // Abrimos la conexión
     PreparedStatement preparedStatement = connection.prepareStatement(sql)) {  // Creamos el preparedStatement
    
    // Establecemos los parámetros del PreparedStatement
    preparedStatement.setInt(1, 123);                                           // Establecemos los parámetros (int)
    preparedStatement.setString(2, "Billy Wilder");                             // Establecemos los parámetros (String)
    preparedStatement.setFloat(3, 1.80f);                                       // Establecemos los parámetros (float)
    preparedStatement.setBlob(4, new FileInputStream("image.jpg"));             // Establecemos los parámetros (Blob)
    preparedStatement.setNull(5, java.sql.Types.VARCHAR);                       // Establecemos los parámetros (null)
    preparedStatement.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));  // Establecemos los parámetros (Timestamp)
    preparedStatement.setDate(6, Date.valueOf(LocalDate.of(1906, 6, 22)));      // Establecemos los parámetros (Date)
    
    // Ejecutamos la actualización
    int affectedRows = preparedStatement.executeUpdate();
    System.out.println("Affected rows: " + affectedRows);

} catch (SQLException e) {
    throw new RuntimeException("Error executing query");
}
```
---
<br>

## 8. RawSQL 
- **RawSQL** es una clase que nos permite ejecutar consultas SQL sin tener que repetir el código de conexión y desconexión.
```java
public class RawSQL {

    private static final DBConnection dbConnection = new DBConnection();

    // Ejecutar un SELECT
    public static ResultSet select(String sql, List<Object> params) {
        try (PreparedStatement preparedStatement = setParameters(sql, params)){
            return preparedStatement.executeQuery();
        } catch (Exception e) {
            throw new RuntimeException("Error executing SQL query: " + sql);
        }
    }

    // Ejecutar un INSERT
    public static Object insert(String sql, List<Object> params) {
        try (PreparedStatement preparedStatement = setParameters(sql, params)){
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if(resultSet.next()){
                return resultSet.getObject(1);
            } else {
                throw new RuntimeException("Unable to retrieve the last generated ID");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error executing SQL query:" + sql);
        }
    }

    // Ejecutar un UPDATE
    public static int update(String sql, List<Object> params) {
        return RawSQL.statement(sql, params);
    }

    // Ejecutar un DELETE
    public static int delete(String sql, List<Object> params) {
        return RawSQL.statement(sql, params);
    }

    // Ejecutar un statement
    private static int statement(String sql, List<Object> params) {
        try (PreparedStatement preparedStatement = setParameters(sql, params)){
            return preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException("Error executing SQL query: " + sql);
        }
    }

    // Establecer los parámetros
    private static PreparedStatement setParameters(String sql, List<Object> values){
        try {
            Connection connection = dbConnection.getConnection();
            PreparedStatement preparedStatement =  connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            if(values != null) {
                for(int i=0;i<values.size();i++) {
                    Object value = values.get(i);
                    preparedStatement.setObject(i+1,value);
                }
            }
            return preparedStatement;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    // Realizar un commit
    public static void commit() {
        try {
            dbConnection.getConnection().commit();
        } catch (SQLException e) {
            throw new RuntimeException("Error committing the transaction");
        }
    }

    // Realizar un rollback
    public static void rollback(){
        try {
            dbConnection.getConnection().rollback();
        } catch (SQLException e) {
            throw new RuntimeException("\"Error rolling back the transaction");
        }
    }
}
```
---
<br>

## 9. JdbcTemplate 📋
- **JdbcTemplate** es una clase de Spring que simplifica el uso de JDBC y ayuda a evitar la repetición de código.
- Necesitamos utilizar un mapper para convertir los resultados de las consultas en objetos.
- Hay que añadir las siguientes dependencias de Maven:
```xml
<dependencies>
    <!-- Spring Boot Starter JDBC para usar JdbcTemplate -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-jdbc</artifactId>
    </dependency>

    <!-- Opcional: Spring Boot Starter Data JPA, si también vas a usar JPA -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>

    <!-- Base de datos de ejemplo: H2 (puedes cambiarlo por cualquier otra base de datos) -->
    <dependency>
        <groupId>com.h2database</groupId>
        <artifactId>h2</artifactId>
        <scope>runtime</scope>
    </dependency>
</dependencies>
```
```java
public class BookDaoImpl implements BookDao {

    private final JdbcTemplate jdbcTemplate;

    @Override
    public List<Book> findAll() {
        String sql = "SELECT * from books";
        return jdbcTemplate.query(sql, new BookMapper());
    }

    @Override
    public Book findByISBN(String ISBN) {
        try {
            String sql = "SELECT * FROM books WHERE isbn = ?";
            return jdbcTemplate.queryForObject(sql, new BookMapper(), ISBN);

        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Integer create(Book book) {
        String sql = "INSERT INTO books (isbn, title, synopsis, price, publisher_id, category_id) VALUES (?, ?, ?, ?, ?, ?)";

        return jdbcTemplate.update(sql, book.getISBN(), book.getTitle(), book.getSynopsis(), book.getPrice(), book.getPublisher().getId(), book getCategory().getId());
    }

    @Override
    public Integer update(String ISBN, String title, String synopsis, BigDecimal price, Publisher publisher, Category category) {
        String sql = "UPDATE books SET title = ?, synopsis = ?, price = ?, publisher_id = ?, category_id = ? WHERE isbn = ?";

        return jdbcTemplate.update(sql, title, synopsis, price, publisher.getId(), category.getId(), ISBN);
    }

    @Override
    public Boolean delete(String ISBN) {
        String sql = "DELETE FROM books WHERE isbn = ?";

        return jdbcTemplate.update(sql, ISBN) > 0;
    }
}
```
```java
// RowMapper es una interfaz que mapea una fila de un ResultSet a un objeto
public class BookMapper implements RowMapper<Book> {

    @Override
    public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
        Book book = new Book();
        book.setISBN(rs.getString("books.isbn"));
        book.setTitle(rs.getString("books.title"));
        book.setSynopsis(rs.getString("books.synopsis"));
        book.setPrice(new BigDecimal(rs.getString("books.price")));
        book.setPublisher(new Publisher(rs.getInt("publisher_id")));
        book.setCategory(new Category(rs.getInt("category_id")));
        return book;
    }
}
```
---

<br><br><br>

## *[volver al índice](../../README.md)*