# Mongoose
Es una librería de modelado de objetos para MongoDB en Node.js. Proporciona una solución sencilla basada en esquemas para modelar la aplicación de datos.

## 1. Web Site 🌐
[Mongoose](https://mongoosejs.com/)

---
<br>

## 2. Instalar módulo 🔧
`npm install mongoose`

---
<br>

## 3. Importar módulo 📥
```javascript
const mongoose = require('mongoose');
```
---
<br>

## 4. Conexión a la DB 🔗
### 4.1. Conexión
```javascript
const mongoose = require('mongoose');
const URI = 'mongodb+srv://<username>:<password>@<cluster>.mongodb.net/<database>';

const connectDB = async () => {
    try {
        await mongoose.connect(URI, {
            useNewUrlParser: true,     // Permite a Mongoose usar el nuevo motor de análisis de URL de MongoDB.
            useUnifiedTopology: true,  // Habilita la nueva capa de administración de conexiones del controlador de MongoDB.
            useFindAndModify: false,   // Habilita la función `findOneAndUpdate()` en lugar de `findAndModify()`. (Deprecado)
            useCreateIndex: true       // Habilita la función `createIndex()` en lugar de `ensureIndex()`. (Deprecado)
        });
        console.log('Connected to MongoDB');
    } catch (err) {
        console.error('Error connecting to MongoDB', err);
    }
}

module.exports = connectDB;
```

### 4.2. Desconexión
```javascript
const disconnectDB = async () => {
    try {
        await mongoose.disconnect();
        console.log('Disconnected from MongoDB');
    } catch (err) {
        console.error('Error disconnecting from MongoDB', err);
    }
}
```

### 4.3. Eventos
```javascript
mongoose.connection.on('connected', () => console.log('Connected to MongoDB'));
mongoose.connection.on('reconnected', () => console.log('Reconnected to MongoDB'));
mongoose.connection.on('disconnected', () => console.log('Disconnected from MongoDB'));
mongoose.connection.on('error', (err) => console.error('Error connecting to MongoDB', err));
```
---
<br>

## 5. Crear un modelo 📝
- **Schema**: Define la estructura de los documentos que se pueden almacenar en una colección.
- **Model**: Es una clase que se utiliza para comunicarse con una colección de la base de datos que se corresponde con un esquema.
```javascript
const { Schema, model } = require('mongoose');

const userSchema = new Schema({
    username: {
        type: String,
        required: [true, 'Username is required'],
        unique: true,
        index: true, // Improves query speed.
        trim: true   // Deletes whitespace at the beginning and end.
    },
    age: {
        type: Number,
        default: 18,
        min: [18, 'You must be at least 18 years old'],
        max: [65, 'You must be at most 65 years old']
    },
    email: {
        type: String,
        required: function() { return this.age >= 18; }, // Required if age is 18 or more.
        unique: true
    },
    createdAt: {
        type: Date,
        default: Date.now, // Current date and time.
        select: false      // Not shown in queries by default.
    },
    isAdmin: {
        type: Boolean,
        default: false
    },
    role: {
        type: String,
        enum: ['user', 'admin', 'superadmin'], // Possible values.
    },
    contacts: {
        type: [Schema.Types.ObjectId], // Array of ObjectIds.
        ref: 'User'
    },
    password: {
        type: String,
        required: true,
        validate: {
            validator: function(v) {
                return /\d/.test(v) && /[a-zA-Z]/.test(v); // At least one number and one letter.
            },
            message: props => `${props.value} is not a valid password!` // Custom error message.
        },
        select: false // Not shown in queries by default.
    },
    groups: [{ type: Schema.Types.ObjectId, ref: 'Group' }],
    extras: {
        type: Schema.Types.Mixed, // Any type of data.
        required: false
    }
});

// Rewrites the 'toJSON' method to remove the '_id' and '__v' fields.
userSchema.methods.toJSON = function() {
    const { __v, _id, ...obj } = this.toObject();
    return obj;
}

// Exports the model.
 module.exports = model('User', userSchema);
```	
- **default**: Valor por defecto.
- **enum**: Valores posibles.
- **index**: Mejora la velocidad de las consultas.
- **max**: Valor máximo.
- **min**: Valor mínimo.
- **ref**: Referencia a otro modelo.
- **required**: Indica si el campo es obligatorio. (Puede tener un mensaje de error personalizado. Puede ser una función que devuelva un booleano.)
- **select**: Indica si el campo se muestra en las consultas.
- **trim**: Elimina los espacios en blanco al principio y al final.
- **type**: Tipo de dato.
- **unique**: Indica si el campo debe ser único.
- **validate**: Validación personalizada.
- **Mixed**: Cualquier tipo de dato.
- **ObjectId**: Identificador único de un documento.
---
<br>

## 6. Operaciones CRUD ✍️
### 6.1. Importar modelo
```javascript
const User = require('./models/User');
const user = new User({
    username: 'user1',
    age: 25,
    email: 'user1@gmail.com',
    isAdmin: false,
    role: 'user',
    contacts: [],
    password: '1234',
    extras: { key: 'value' }
});
```	

### 6.2. Crear
```javascript
// GUARDA un documento en la base de datos que tiene que ser instanciado previamente.
user.save()
    .then(user => console.log('User created:', user))
    .catch(err => console.error('Error creating user:', err));


// CREA un documento en la base de datos (puede crear varios documentos).
User.create({
    username: 'user2',
    age: 30,
    email: 'user2@gmail.com',
    isAdmin: false,
    role: 'user',
    contacts: [],
    password: '1234',
    extras: { key: 'value' }
})
    .then(user => console.log('User created:', user))
    .catch(err => console.error('Error creating user:', err));

// CREA VARIOS documentos en la base de datos, optimizando la inserción masiva.
User.insertMany([
    {
        username: 'user3',
        age: 35,
        email: 'user3@gmail.com',
        isAdmin: false,
        role: 'user',
        contacts: [],
        password: '1234',
        extras: { key: 'value' }
    },
    {
        username: 'user4',
        age: 40,
        email: 'user4@gmail.com',
        isAdmin: false,
        role: 'user',
        contacts: [],
        password: '1234',
        extras: { key: 'value' }
    }
])
    .then(users => console.log('Users created:', users))
    .catch(err => console.error('Error creating users:', err));
```

### 6.3. Leer
```javascript
// Encuentra todos los documentos que coincidan con la consulta. (Array vacío si no hay coincidencias)
User.find({ username: 'user1' })
    .then(users => console.log('Users:', users))
    .catch(err => console.error('Error reading users:', err));

// Encuentra todos los documentos.
User.find()
    .then(users => console.log('Users:', users))
    .catch(err => console.error('Error reading users:', err));

// Encuentra un documento por su id.
User.findById('id')
    .then(user => console.log('User:', user))
    .catch(err => console.error('Error reading user:', err));

// Encuentra un documento que coincida con la consulta. (Null si no hay coincidencias)
User.findOne({ username: 'user1' })
    .then(user => console.log('User:', user))
    .catch(err => console.error('Error reading user:', err));

// Devuelve el número total de documentos.
User.countDocuments()
    .then(count => console.log('Total users:', count))
    .catch(err => console.error('Error counting users:', err));

// Operadores de consulta compleja.
User.find()
    .limit(10)                 // Limita a 10 documentos
    .skip(5)                   // Omite los primeros 5 documentos
    .sort({ username: 1 })     // Ordena los documentos por el campo 'username' en orden ascendente
    .select('username email')  // Selecciona sólo los campos 'username' y 'email'
    .populate('role')          // Suponiendo que 'role' es un campo que referencia otro documento
    .exec()                    // Ejecuta la consulta
    .then(users => console.log('Filtered users:', users))
    .catch(err => console.error('Error reading users:', err));
```

### 6.4. Actualizar
```javascript
// Encuentra un documento por su id y lo actualiza. (Se le puede pasar el documento completo)
User.findByIdAndUpdate('id', { age: 30 }, { new: true }) // { new: true } devuelve el documento actualizado.
    .then(user => console.log('User updated:', user))
    .catch(err => console.error('Error updating user:', err));

// Encuentra un documento que coincida con la consulta y lo actualiza. (Se le puede pasar el documento completo)
User.findOneAndUpdate({ username: 'user1' }, { age: 30 }, { new: true }) // { new: true } devuelve el documento actualizado.
    .then(user => console.log('User updated:', user))
    .catch(err => console.error('Error updating user:', err));

// Actualiza un documento que coincida con la consulta y devuelve el NÚMERO DE DOCUMENTOS COINCIDENTES Y MODIFICADOS.
User.updateOne({ username: 'user1' }, { age: 30 })
    .then(result => {
        console.log('Matched documents:', result.matchedCount);
        console.log('Modified documents:', result.modifiedCount);
    })
    .catch(err => console.error('Error updating user:', err));

// Actualiza varios documentos que coincidan con la consulta y devuelve el NÚMERO DE DOCUMENTOS COINCIDENTES Y MODIFICADOS.
User.updateMany({ isAdmin: false }, { isAdmin: true })
    .then(result => {
        console.log('Matched documents:', result.matchedCount);
        console.log('Modified documents:', result.modifiedCount);
    })
    .catch(err => console.error('Error updating users:', err));
```

### 6.5. Eliminar
```javascript
// Elimina un documento por su ID y devuelve el documento eliminado.
User.findByIdAndDelete('id')
    .then(user => console.log('User deleted:', user))
    .catch(err => console.error('Error deleting user:', err));

// Elimina un documento que coincida con la consulta y devuelve el documento eliminado.
User.findOneAndDelete({ username: 'user1' })
    .then(user => console.log('User deleted:', user))
    .catch(err => console.error('Error deleting user:', err));

// Elimina el primer documento que coincida con la consulta y devuelve el resultado de la operación.
User.deleteOne({ username: 'user1' })
    .then(result => console.log('Deleted count:', result.deletedCount))
    .catch(err => console.error('Error deleting user:', err));

// Elimina todos los documentos que coincidan con la consulta y devuelve el número de documentos eliminados.
User.deleteMany({ isAdmin: false })
    .then(result => console.log('Deleted count:', result.deletedCount))
    .catch(err => console.error('Error deleting users:', err));
```
---
<br><br><br>

## *[volver al índice](../../README.md)*