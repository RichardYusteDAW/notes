# Bases de datos incrustadas
## 1. Dependencias
```xml
<dependency>
    <groupId>com.h2database</groupId>
    <artifactId>h2</artifactId>
    <scope>test</scope>
</dependency>
```
<br>

## 2. Ficheros de propiedades
`resources/application.properties`
```properties
app.profiles.active = dev
```

`resources/application-dev.properties`
```properties
app.datasource.url = jdbc:mysql://localhost:3306/Bookview
app.datasource.username = root
app.datasource.password = 1234
dao=jdbc
```

`resources/application-test.properties`
```properties
app.datasource.url = jdbc:h2:mem:testdb;MODE=MYSQL;DB_CLOSE_DELAY=-1
app.datasource.username = sa
app.datasource.password = sa
```
<br>

## 3. Clase para leer las propiedades
```java
public class AppPropertiesReader {

    // Atributos
    private final Properties properties = new Properties();
    private static AppPropertiesReaderSingleton instance;

    // Constructor
    private AppPropertiesReader() {

        // Cargar las propiedades por defecto
        loadProperties("application.properties");

        // Detectar el perfil y cargar las propiedades correspondientes
        String activeProfile = getProperty("app.profiles.active");

        if (activeProfile == null) {
            throw new RuntimeException("No se ha especificado un perfil activo");
        } else {
            System.out.println("Perfil activo: " + activeProfile);
            loadProperties("application-" + activeProfile + ".properties");
        }

    }

    // Método para cargar las propiedades
    private void loadProperties(String filename) {
        try (InputStream input = Thread.currentThread().getContextClassLoader().getResourceAsStream(filename)) {
            if (input == null) {
                throw new RuntimeException("No se ha podido encontrar el fichero de configuración: "
                        + filename);
            }
            // Cargar las propiedades desde el archivo de configuración
            properties.load(input);

        } catch (IOException e) {
            throw new RuntimeException("Error loading application.properties file");
        }
    }

    // Método para obtener una propiedad
    public String getProperty(String key) {
        return properties.getProperty(key);
    }

    // Método para obtener la instancia
    public static AppPropertiesReader getInstance() {
        if (instance == null) {
            instance = new AppPropertiesReader();
        }
        return instance;
    }

}
```
<br>

## 4. Conexion con la base de datos
```java
public class DBConnection {

    private static DBConnection instance;
    private final Connection connection;

    private final String URL = AppPropertiesReader.getInstance().getProperty("spring.datasource.url");
    private final String USER = AppPropertiesReader.getInstance().getProperty("spring.datasource.username");
    private final String PASSWORD = AppPropertiesReader.getInstance().getProperty("spring.datasource.password");

    private DBConnection() {
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);

        } catch (SQLException e) {
            throw new RuntimeException("\u001B[31m" + "Error connecting to the database" + "\u001B[0m");
        }
    }

    // Singleton
    public static DBConnection getInstance() {
        if (instance == null) {
            instance = new DBConnection();
        }
        return instance;
    }

    public Connection getConnection() {
        return connection;
    }

    // Script for creating the database
    public void executeScript(String scriptPath) {
        try (InputStream scriptStream = getClass().getClassLoader().getResourceAsStream(scriptPath)) {

            if (scriptStream == null)
                throw new RuntimeException("Script not found: " + scriptPath);

            ScriptRunner scriptRunner = new ScriptRunner(connection);
            scriptRunner.runScript(new InputStreamReader(scriptStream));
        } catch (IOException e) {
            System.out.println(String.format("Error executing script %s:\n    %s\n", scriptPath, e.getMessage()));
            throw new RuntimeException(e);
        }
    }
}
```
Instalar la librería `org.apache.ibatis.jdbc.ScriptRunner` para poder ejecutar el script.
```xml
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis</artifactId>
    <version>3.5.16</version>
</dependency>
```
<br>

## 5. Script para crear la base de datos
`resources/script.sql`
```sql
create table Book (
    isbn varchar(50) primary key,
    title varchar(100) not null,
    summary text ,
    number_of_pages int unsigned,
    publication_date date not null,
    image_path varchar(200) not null
);

insert into Book (isbn, titol, Summary, nombre_pagines, data_publicacio, ruta_img) values
    ('1', 'Book 1', 'Summary 1', 100, '2024-01-01', 'img1.png'),
    ('2', 'Book 2', 'Summary 2', 200, '2024-01-02', 'img2.png'),
    ('3', 'Book 3', 'Summary 3', 300, '2024-01-03', 'img3.png');
```
<br>

## 6. Test
```java
public class BookDaoJdbcTest {

    private final BookDao BookeDao = new BookDaoJdbc();
    private static final DatabaseConnection connection = DatabaseConnection.getInstance();

    public final List<Book> expectedBookList = List.of(
            new Book( "1", "Book 1", "Summary 1", LocalDate.parse("2024-01-01"), 100, "img1.png" ),
            new Book( "2", "Book 2", "Summary 2", LocalDate.parse("2024-01-02"), 200, "img2.png" ),
            new Book( "3", "Book 3", "Summary 3", LocalDate.parse("2024-01-03"), 300, "img3.png" )
    );


    @BeforeAll
    static void setup() throws SQLException {
        connection.executeScript("script.sql");
        connection.getConnection().setAutoCommit(false);
    }

    @AfterEach
    void tearDown() throws SQLException {
        connection.getConnection().rollback();
    }

    @Test
    void findAll_shouldReturnAllBooks() {
        List<Book> result = BookDao.findAll();
        assertEquals(expectedBookList, result);
    }

    @Test
    void findByIsbn_shouldReturnBook() {
        Book result = BookDao.findByIsbn("1");
        assertEquals(expectedBookList.get(0), result);
    }
}
```
<br><br><br>

## *[volver al índice](../../README.md)*