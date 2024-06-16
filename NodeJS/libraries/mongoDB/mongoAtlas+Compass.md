# Mongo Atlas y Mongo Compass
**Mongo Atlas** es un servicio de base de datos en la nube que permite almacenar, consultar y administrar datos de MongoDB.  
**Mongo Compass** es una interfaz gráfica para MongoDB que permite conectarse a una base de datos y realizar operaciones de forma visual.

## 1. Crear cuenta 🔧
- **Acceder a la página:** [Mongo Atlas](https://account.mongodb.com/account/login).
- **Crear una cuenta:** Al crear una cuenta se crea automáticamente una organización (se puede modificar en la rueda dentada de arriba a la izquierda).
- **Crear un proyecto:** Un proyecto agrupa los clústeres y los usuarios.
- **Crear un clúster:** Un clúster es un conjunto de servidores que almacenan los datos de la base de datos.
---
<br>

## 2. Crear un clúster 🛠️
- Seleccionar el **tipo** (Storage, RAM, vCPUs)
  - M10: 10Gb, 2Gb, 2vCPU
  - Sererless: Up to 1Tb, Auto-scale, Auto-scale
  - M2: 2Gb, Shared, Shared
- Introducir un **nombre** para el clúster.
- Seleccionar el **proveedor** de la nube:
    - AWS
    - Google Cloud
    - Azure
- Seleccionar la **región**.
- Autenticación:
    - Crear un **usuario**: Si queremos añadir otro usuario: `Security > Database Access > Add New Database User`.
    - Permitir el acceso desde **cualquier dirección IP**: 0.0.0.0/0.
- Crear el clúster.
---
<br>

## 3. Conectar a la base de datos 📥
### 3.1. MongoDB Compass:  
Obtener la URI de conexión:  
`All Clusters > Connect > Compass` [mongodb+srv://<user>:<password>@cluster0.8vdu96f.mongodb.net/<database>](mongodb+srv://<user>:<password>@cluster0.8vdu96f.mongodb.net/<database>)

Conectar a la base de datos desde MongoDB Compass:  
`New Connection > Connect`

### 3.2. Node.js:
```javascript
const { MongoClient } = require('mongodb');

const uri = 'mongodb+srv://<username>:<password>@<cluster>.mongodb.net/<database>?retryWrites=true&w=majority';

const client = new MongoClient(uri);

async function connect() {
    try {
        await client.connect();
        console.log('Conectado a la base de datos');
    } catch (error) {
        console.error(error);
    }
}

connect();
```
---
<br><br><br>

## *[volver al índice](../../../index.md)*
