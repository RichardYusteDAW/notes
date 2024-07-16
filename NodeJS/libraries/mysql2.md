# MySQL2
Es un cliente un fork de [mysql](https://www.npmjs.com/package/mysql) con mejoras en la velocidad y la seguridad. Es compatible con la mayoría de las funciones de mysql y tiene algunas características adicionales.

## 1. Web Site 🌐
[MySQL2](https://www.npmjs.com/package/mysql2)

---
<br>

## 2. Instalar módulo 🔧
```npm install mysql2```

---
<br>

## 3. Importar módulo 📥
```javascript
const mysql = require('mysql2');
```
---
<br>

## 4. Crear una conexión 🏗️
- **createConnection()**: método para crear una conexión a la base de datos.
- **createPool()**: método para crear un grupo de conexiones a la base de datos.
```javascript
const connection = mysql.createConnection({
    host: 'localhost',         // Dirección del servidor de la base de datos (localhost, http://example.com, etc)
    user: 'root',              // Nombre de usuario de la base de datos
    password: 'password',      // Contraseña del usuario de la base de datos
    database: 'database',      // Nombre de la base de datos
    port: 3306,                // Puerto del servidor de la base de datos
    connectTimeout: 10000,     // Tiempo de espera para la conexión
    debug: false,              // Muestra mensajes de depuración
    flags: '',                 // Banderas de la conexión
    insecureAuth: false,       // Permite la autenticación insegura
    multipleStatements: false, // Permite múltiples consultas en una sola cadena
    namedPlaceholders: false,  // Permite marcadores de posición con nombre
    queryFormat: undefined,    // Función para formatear una consulta SQL
    ssl: false,                // Configuración de SSL
    stringifyObjects: false,   // Convierte los objetos en cadenas de texto
    timezone: 'local',         // Zona horaria de la conexión
    typeCast: true             // Convierte los valores de la base de datos en tipos de JavaScript
});

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'database',
    port: 3306,
    connectionLimit: 10,       // Límite de conexiones en el grupo de conexiones
    queueLimit: 0              // Límite de la cola de conexiones
});
```
---
<br>

## 5. Conectar y desconectar de la base de datos 🚪
- **connect()**: método que establece la conexión a la base de datos.
- **end()**: método que cierra la conexión a la base de datos.
```javascript
connection.connect((error) => {
    if (error) {
        console.error('Error connecting to the database:', error);
        return;
    }
    console.log('Connected to the database.');
});

connection.end((error) => {
    if (error) {
        console.error('Error closing the connection:', error);
        return;
    }
    console.log('Connection closed.');
});
```
---
<br>

## 6. Realizar una consulta 📄
- **error**: objeto que contiene información sobre el error.
- **results**: array de objetos que contiene los resultados de la consulta.
- **fields**: array de objetos que contiene información sobre los campos de la consulta.
```javascript
// SELECT
const sql = 'SELECT * FROM users WHERE id = ?';
connection.query(sql, [1], (error, results, fields) => {
    if (error) {
        console.error('Error executing query:', error);
        return;
    }
    console.log('Query results:', results);
    console.log('Field details:', fields);
});


// INSERT
const sql = 'INSERT INTO users (name, age) VALUES (?, ?)';
connection.query(sql, ['Alice', 30], (error, results) => {
    if (error) {
        console.error('Error executing query:', error);
        return;
    }
    console.log('Affected rows:', results.affectedRows); // Número de filas afectadas
    console.log('Insert ID:', results.insertId);         // ID de la fila insertada
    console.log('Warning count:', results.warningCount); // Número de advertencias
});


// UPDATE
const sql = 'UPDATE users SET age = ? WHERE id = ?';
connection.query(sql, [35, 1], (error, results) => {
    if (error) {
        console.error('Error updating user:', error);
        return;
    }
    console.log('Affected rows:', results.affectedRows);
    console.log('Changed rows:', results.changedRows);   // Número de filas cambiadas
});


// DELETE
const sql = 'DELETE FROM users WHERE id = ?';
connection.query(sql, [1], (error, results) => {
    if (error) {
        console.error('Error deleting user:', error);
        return;
    }
    console.log('Affected rows:', results.affectedRows);
});
```
---
<br>

## 7. Métodos de mysql2 📚
```javascript
// Formatear una consulta SQL
console.log('Formatted SQL:', mysql.format('SELECT * FROM users WHERE id = ?', [1]));

// Escapar una cadena de texto
console.log('Escaped string:', mysql.escape('John\'s'));

// Escapar un identificador
console.log('Escaped identifier:',  mysql.escapeId('id'));
```
---
<br><br><br>

## *[volver al índice](../../index.md)*