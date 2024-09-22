# FileSystem
El módulo `fs` proporciona una API para interactuar con el sistema de archivos en un entorno de Node.js. Este módulo proporciona una forma de trabajar con archivos y directorios a través de una API basada en promesas o devoluciones de llamada.

## 1. Web Site 🌐
[FileSystem](https://nodejs.org/api/fs.html)

---
<br>

## 2. Instalar módulo 🔧
No se instala, ya viene con NodeJS.

---
<br>

## 3. Importar módulo 📥
```javascript
const fs = require('fs');
```
---
<br>

## 4. Métodos 🛠️
### 4.1. Crear directorio
```javascript
fs.mkdir('path/to/directory', { recursive: true }, (err) => {
    if (err) throw err;
});
```

### 4.2. Eliminar directorio
```javascript
fs.rm('path/to/directory', { recursive: true }, (err) => {
    if (err) throw err;
});
```

### 4.3. Leer directorio
```javascript
fs.readdir('path/to/directory', (err, files) => {
    if (err) throw err;
    console.log(files);
});
```

### 4.4. Crear archivo sin contenido.
```javascript
fs.writeFile('path/to/file.txt', "", (err) => {
    if (err) throw err;
});
```

### 4.5. Crear archivo y escribir contenido.
```javascript
let content = 'This is the content of the file';

fs.writeFile('path/to/file.txt', content, (err) => {
    if (err) throw err;
});
```

### 4.6. Leer archivo
```javascript
fs.readFile('path/to/file.txt', 'utf8', (err, data) => {
    if (err) throw err;
    console.log(data);
});
```

### 4.7. Agregar contenido a un archivo
```javascript
fs.appendFile('path/to/file.txt', 'content', (err) => {
    if (err) throw err;
});
```

### 4.8. Eliminar archivo
```javascript
fs.unlink('path/to/file.txt', (err) => {
    if (err) throw err;
});
```

### 4.9. Mover archivo
```javascript
fs.rename('path/to/file.txt', 'path/to/newfile.txt', (err) => {
    if (err) throw err;
});
```

### 4.10. Copiar archivo
```javascript
fs.copyFile('path/to/file.txt', 'path/to/newfile.txt', (err) => {
    if (err) throw err;
});
```

### 4.11. Verificar si un archivo o directorio existe
```javascript
fs.access('path/to/file.txt', fs.constants.F_OK, (err) => {
    if (err) {
        console.log('File does not exist');
    } else {
        console.log('File exists');
    }
});
```
<br><br><br>

## *[volver al índice](../../README.md)*