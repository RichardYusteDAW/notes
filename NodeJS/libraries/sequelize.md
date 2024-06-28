# Sequelize
Sequelize es un ORM para Node.js que soporta los dialectos de SQL: PostgreSQL, MySQL, MariaDB, SQLite y MSSQL. Es fácil de aprender y tiene una API intuitiva.

## 1. Web Site 🌐
[Sequelize](https://sequelize.org/)

---
<br>

## 2. Instalar módulo 🔧
```npm install sequelize```

Para instalar el DRIVER de la base de datos que se va a utilizar, se debe instalar uno de los siguientes paquetes:
- PostgreSQL: `npm install pg pg-hstore`
- MySQL:`npm install mysql2`
- MariaDB: `npm install mariadb`
- SQLite: `npm install sqlite3`
- MSSQL: `npm install tedious`
- Oracle: `npm install oracledb`
---
<br>

## 3. Importar módulo 📥
- **Sequelize**: clase principal de Sequelize.
- **Op**: operadores de Sequelize(and, or, gt, lt, etc).
- **Model**: clase base para los modelos (tablas) de Sequelize.
- **DataTypes**: tipos de datos de Sequelize (STRING, INTEGER, BOOLEAN, etc).

```javascript
const { Sequelize, Op, Model, DataTypes } = require('sequelize');
import { Sequelize, Op, Model, DataTypes } from 'sequelize'; // ES6
```
---
<br>

## 4. Crear una instancia de Sequelize 🏗️
- **host**: dirección del servidor de la base de datos (localhost, http://example.com, etc).
- **dialect**: tipo de base de datos que se va a utilizar (mysql, postgres, sqlite, mssql, mariadb).
- **logging**: si es `false`, no se mostrarán los mensajes de log en la consola.
- **storage**: ruta donde se va a guardar la base de datos SQLite (solo para SQLite).

```javascript
import { Sequelize } from 'sequelize';

const db = new Sequelize('database', 'username', 'password', {
  host: 'localhost',
  dialect: 'mysql',
  logging: false,
  storage: 'path/to/database.sqlite'
});
```
---
<br>

## 5. Autenticar la conexión 🚪
- **authenticate()**: método que devuelve una promesa que se resuelve si la conexión es exitosa y se rechaza si hay un error.
```javascript
try {
  await db.authenticate();
  console.log('Connection has been established successfully.');
} catch (error) {
  console.error('Unable to connect to the database:', error);
}
```
---
<br>

## 6. Crear un modelo 📄
```javascript
export { DataTypes } from 'sequelize';

const User = db.define('User', {
  username: {
    type: DataTypes.STRING,                   // Type: STRING, INTEGER, BOOLEAN, etc.
    allowNull: false,                         // Allow null: true, false.
    unique: true,                             // Unique: true, false.
    validate: {                               // Validation rules
      notEmpty: {                             // This field must not be empty
        msg: 'Username must not be empty'     // Error message
      }
    }
  },
  age: {
    type: DataTypes.INTEGER,
    defaultValue: 18,                         // Default value
    validate: {
      min: {                                  // Minimum value allowed
        args: [18],                           // Value to compare with the field value
        msg: 'You must be at least 18 years old'
      },
      max: {                                  // Maximum value allowed
        args: [65],                           // Value to compare with the field value
        msg: 'You must be at most 65 years old'
      }
    }
  },
  email: {
    type: DataTypes.STRING,
    allowNull: true,
    unique: true,
    validate: {
      isEmail: {                              // Must be a valid email address
        msg: 'Must be a valid email address'
      },
      isOldEnough(value) {
        if (this.age < 18 && value === null) {
          throw new Error('Email is required if age is 18 or more');
        }
      }
    }
  },
  isAdmin: {
    type: DataTypes.BOOLEAN,
    defaultValue: false
  },
  role: {                                     // ENUM type: only allows certain values (user, admin, superadmin)
    type: DataTypes.ENUM('user', 'admin', 'superadmin'),
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      isStrongPassword(value) {
        const strongRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
        if (!strongRegex.test(value)) {
          throw new Error('Password must contain at least one number, one uppercase and one lowercase letter, and be at least 8 characters long');
        }
      }
    }
  },
  contacts: {
    type: DataTypes.ARRAY(DataTypes.INTEGER), // This line is only for PostgreSQL
    allowNull: true
  },
  extras: {
    type: DataTypes.JSON,
    allowNull: true
  }
}, {
  timestamps: false,                          // Disable timestamps (createdAt, updatedAt)
  indexes: [                                  // Indexes are used to speed up queries
    {
      name: 'username_index',
      unique: true,
      fields: ['username']
    }
  ],
  hooks: {                                   // Hooks are functions that are called before or after a certain event (triggers)
    beforeCreate: (user, options) => {
      user.username = user.username.trim();  // Trims whitespace
    }
  }
});

export default User;
```
---
<br>

## 7. Métodos de los modelos 📄
- **sync()**: sincroniza el modelo con la base de datos.
- **build()**: crea una instancia del modelo.
- **save()**: guarda una instancia en la base de datos.
- **create()**: crea un nuevo registro en la base de datos.
- **findAll()**: busca todos los registros de la base de datos.
- **findByPk()**: busca un registro por su clave primaria.
- **findOne()**: busca un registro por una condición.
- **update()**: actualiza un registro en la base de datos.
- **destroy()**: elimina un registro de la base de datos.
```javascript
import db from './db.js';
import User from './models/User.js';

await db.sync();                                                   // Sync all models.
await User.sync({ force: true });                                  // Drop the table if it already exists.
await User.sync({ alter: true });                                  // Alter the table if it already exists.

const example = { firstName: "Jane", lastName: "Doe" }
const user = User.build(example);                                  // Create a new instance of the model.
await user.save();                                                 // Save the instance to the database.
await User.create(example);                                        // Create a new record in the database (build + save).

const user = await User.findAll();                                 // Find all users.
const user = await User.findByPk(1);                               // Find a user by its primary key.
const user = await User.findOne({ where: { firstName: "John" } }); // Find a user by a condition. Returns the first match.

await user.update({ firstName: "Alice" });                         // Update a user (It is possible to pass an entire object).
await User.update({ firstName: "Alice" }, { where: { id: 1 } });   // Update a user with a condition.

await user.destroy();                                              // Delete a user.
await User.destroy({ where: { id: 1 } });                          // Delete a user with a condition.
```
<br><br><br>

## *[volver al índice](../../index.md)*