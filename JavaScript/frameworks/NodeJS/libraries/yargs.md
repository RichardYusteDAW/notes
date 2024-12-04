# Yargs
Es un módulo que permite crear interfaces de línea de comandos interactivas, analizando argumentos y opciones pasadas por el usuario.

## 1. Web Site 🌐
[Yargs](https://yargs.js.org/docs/)

---
<br>

## 2. Instalar módulo 🔧
`npm install yargs`

---
<br>

## 3. Importar módulo y opciones 📥
- **option**: Define una opción que puede ser pasada por el usuario.
  - **alias**: Define un alias para la opción.
  - **demandOption**: Indica si la opción es obligatoria (required).
  - **default**: Valor por defecto de la opción.
  - **describe**: Descripción de la opción.
  - **type**: Tipo de dato de la opción.

- **check**: Función que se ejecuta después de analizar las opciones.
  - **argv**: Objeto con las opciones analizadas.
  - **options**: Objeto con las opciones definidas.

```javascript
const argv = require('yargs')
  .option("f", {
      alias: "file",
      demandOption: true,
      default: "/etc/passwd",
      describe: "file path",
      type: "string"
  })
  .check((argv) => {
      if (argv.file != "/etc/passwd") {
        throw new Error("file path must be /etc/passwd");
      }
      return true;
  })
  .argv;
```
<br><br><br>

## *[volver al índice](../../../../README.md)*