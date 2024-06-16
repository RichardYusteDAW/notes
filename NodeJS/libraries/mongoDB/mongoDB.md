# MongoDB
MongoDB es una base de datos NoSQL que almacena los datos en documentos JSON.

## 1. Web Site 🌐
[MongoDB](https://www.mongodb.com/)

---
<br>

## 2. Sintaxis 🔧
```javascript	
| MÉTODO     | BASES DE DATOS    | COLECCIONES                                             | DOCUMENTOS                                                            |
|------------|-------------------|---------------------------------------------------------|-----------------------------------------------------------------------|
| Crear      | use databaseName  | db.createCollection('collectionName')                   | db.collectionName.insertOne({ key: value })                           |
| Listar     | show dbs          | show collections                                        | db.collectionName.find(); db.collectionName.find({ key: value })      |
| Eliminar   | db.dropDatabase() | db.collectionName.drop()                                | db.collectionName.deleteOne({ key: value })                           |
| Actualizar |                   | db.collectionName.renameCollection('newCollectionName') | db.collectionName.updateOne({ key: value }, { $set: { key: value } }) |
```

---
<br>

<br><br><br>

## *[volver al índice](../../../index.md)*