# MongoDB
MongoDB es una base de datos NoSQL que almacena los datos en documentos JSON.

## 1. Web Site 🌐
[MongoDB](https://www.mongodb.com/)

---
<br>

## 2. Methods 🔧
```javascript	
| MÉTODO     | BASES DE DATOS    | COLECCIONES                                             | DOCUMENTOS                                                               |
|------------|-------------------|---------------------------------------------------------|--------------------------------------------------------------------------|
| Crear      | use databaseName  | db.createCollection('collectionName')                   | db.collectionName.insertOne({ key: value })                              |
|            |                   |                                                         | db.collectionName.insertMany([{ key: value }, { key: value }])           |
|            |                   |                                                         | /* db.collectionName.insert({ key: value }) */                           |
|            |                   |                                                         | /* db.collectionName.save({ key: value }) */                             |
|            |                   |                                                         |                                                                          | 
| Listar     | show dbs          | show collections                                        | db.collectionName.findOne({ key: value })                                |
|            |                   |                                                         | db.collectionName.find(); db.collectionName.find({ key: value })         |
|            |                   |                                                         |                                                                          |
|            |                   |                                                         |                                                                          |
| Eliminar   | db.dropDatabase() | db.collectionName.drop()                                | db.collectionName.deleteOne({ key: value })                              |
|            |                   |                                                         | db.collectionName.deleteMany({ key: value })                             |
|            |                   |                                                         | /* db.collectionName.remove({ key: value }) */                           |
|            |                   |                                                         |                                                                          |
| Actualizar |                   | db.collectionName.renameCollection('newCollectionName') | db.collectionName.updateOne({ key: value }, { $set: { key: value } })    |
|            |                   |                                                         | db.collectionName.updateMany({ key: value }, { $set: { key: value } })   |
|            |                   |                                                         | /* db.collectionName.update({ key: value }, { $set: { key: value } }) */ |
```
- **Crear:**
  - `insertOne()`: Inserta un documento en la colección y le asigna un identificador único si no se proporciona.
  - `insertMany()`: Inserta varios documentos en la colección y les asigna un identificador único si no se proporciona.
  - `insert()`: *deprecated* Inserta uno o varios documentos en la colección.
  - `save()`: *deprecated* Inserta o actualiza un documento en la colección.<br><br>
- **Listar:**
  - `findOne()`: Devuelve el primer documento que coincide con la consulta.
  - `find()`: Devuelve todos los documentos que coinciden con la consulta.<br><br>
- **Eliminar:**
  - `deleteOne()`: Elimina el primer documento que coincide con la consulta.
  - `deleteMany()`: Elimina todos los documentos que coinciden con la consulta.
  - `remove()`: *deprecated* Elimina uno o varios documentos que coinciden con la consulta.<br><br>
- **Actualizar:**
  - `updateOne()`: Actualiza el primer documento que coincide con la consulta.
  - `updateMany()`: Actualiza todos los documentos que coinciden con la consulta.
  - `update()`: *deprecated* Actualiza uno o varios documentos que coinciden con la consulta.
---
<br><br><br>

## *[volver al índice](../../index.md)*