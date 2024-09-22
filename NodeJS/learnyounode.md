# LEARNYOUNODE
Son una kata de ejercicios para aprender Node.js.

## 1. Instalación
```npm install -g learnyounode```

---
<br>

## 2. Comandos
| Comando                      | Descripción                                                     |
|------------------------------|-----------------------------------------------------------------|
| `learnyounode`               | Inicia el menú interactivo de learnyounode.                     |
| `learnyounode list`          | Lista todos los ejercicios disponibles.                         |
| `learnyounode select`        | Selecciona un ejercicio para trabajar.                          |
| `learnyounode verify <file>` | Verifica tu solución para el ejercicio actual.                  |
| `learnyounode run <file>`    | Ejecuta tu programa en un entorno de prueba, sin verificarlo.   |
| `learnyounode print`         | Imprime la descripción del ejercicio actual.                    |
| `learnyounode solution`      | Muestra una solución oficial después de completar el ejercicio. |
| `learnyounode help`          | Muestra una ayuda sobre cómo usar el taller.                    |
| `learnyounode reset`         | Restablece el progreso de todos los ejercicios.                 |

---
<br>

## 3. Ejercicios
### 3.1. Hola Mundo
```javascript	
// ENUNCIADO: 
Escribe un programa que imprima el texto "HELLO WORLD" en la consola (stdout).

// PISTA:
- Para escribir un programa en Node.js, crea un archivo con extensión .js y dentro escribe JavaScript! 
- Para ejecutarlo usa el comando 'node', por ejemplo:  `$ node program.js`  
- Puedes escribir a consola de la misma forma que en el navegador(browser): `console.log('texto')`
- Cuando termines debes ejecutar: `$ learnyounode verify program.js`
```
- **SOLUCIÓN:**
```javascript
// program.js
console.log('HELLO WORLD');
```
---
<br>


### 3.2. Baby Steps
```javascript
// ENUNCIADO:
Escribe un programa que acepte uno o más números como argumentos de la línea de comandos 
e imprima la suma de esos números a consola(stdout).

// PISTA:
- Puedes acceder a los argumentos de la línea de comandos usando el objeto global `process`, 
el cual tiene una propiedad `argv` que es un array con toda la información del comando.

- Para comenzar puedes escribir un programa que contenga: `console.log(process.argv)`

- Luego, para ejecutarlo desde la consola usa node program.js y algunos números como arguments: `$ node program.js 1 2 3`

- La salida estándar a consola será algo parecido a: ['node', '/path/to/your/program.js', '1', '2', '3']

- Para resolver este ejercicio debes iterar en la lista de argumentos de modo que sólo escribas la suma. 

- Debes comenzar a iterar en el tercer elemento (índice 2 de la lista) sumando cada elemento sucesivo hasta el final.

- Ten en cuenta que todos los elementos de process.argv son cadenas de caracteres ('strings') 
por lo que debes convertirlas a números: +process.argv[2] ó Number(process.argv[2]).
```

- **SOLUCIÓN:**
```javascript
// program.js
let args = process.argv.slice(2);
let sum = args.reduce((acc, val) => acc + parseInt(val), 0);
console.log(sum);
```
---
<br>


### 3.3. ¡Mi Primer I/O!
```javascript
// ENUNCIADO:
Escribe un programa que, usando una llamada síncrona al sistema de archivos, 
lea un archivo recibido por argumento e imprima a consola la cantidad de saltos de línea ('\n') que contiene.
El programa recibirá la ruta al archivo como único argumento.

// PISTA:
- Para resolver este ejercicio usaremos el módulo fs del núcleo de Node: `const fs = require('fs')`

- Toda operación síncrona (o de bloqueo) del sistema de archivos en el módulo fs tiene sufijo 'Sync'. 
  Para leer un archivo debes usar: `fs.readFileSync('/path/to/file')`. 
  Éste devuelve un objeto Buffer con los contenidos del archivo.

- Los objetos Buffer de Node son una representación eficiente de Arrays de datos 
  en variedad de formatos como ser ASCII, binarios o UTF-8 entre otros. 
  Los objetos Buffer se pueden convertir en String usando el método toString(): `const str = buf.toString()`

- Si buscas una forma sencilla de contar el número de saltos de línea en un string, 
  piensa que puedes convertir un String de Javascript en un array de substrings usando .split(), 
  y que puedes usar '\n' como delimitador.
  
- Nótese que el fichero de test no tiene ningún salto de línea ('\n') al final de la última línea, 
  con lo que al usar este método acabarás obteniendo un array que tiene un elemento más que el número de saltos de línea.
```

- **SOLUCIÓN:**
```javascript
// program.js
const fs = require('fs');

const file = process.argv[2];
const buffer = fs.readFileSync(file);
const str = buffer.toString();
const array = str.split('\n');
const lines = array.length - 1

console.log(lines);
```
---
<br>


### 3.4. ¡Mi Primer Asincrónico!
```javascript
// ENUNCIADO:
Escribe un programa que use operación de sistema de archivos asíncrona para leer un archivo 
e imprimir en consola el número de saltos de línea ('\n') que contiene.
El programa recibirá la ruta al archivo como único argumento.

// PISTA:
- Vamos a sustituir fs.readFileSync() por fs.readFile() y en lugar de esperar que retorne un valor, 
  vamos a tener que procesar el resultado con una función de callback que se invoca al terminar la lectura del archivo.

- La forma habitual de usar callbacks en Node.js es con la siguiente firma: `function callback(err, data) { /* ... */ }`

- Puedes validar si ocurrió un error controlando si el primer parámetro es nulo. 
  Si no hay errores, 'data' será un objeto Buffer de Node.js. 
  Al igual  que pasa con readFileSync(), puedes pasar 'utf8' como segundo parámetro y 
  luego el callback como tercero de modo de que data sea un String y no un Buffer.
```

- **SOLUCIÓN:**
```javascript
// program.js
const fs = require('fs');

const file = process.argv[2];

fs.readFile(file, 'utf8', (err, data) => {
    if (err) throw err;

    const array = data.split('\n');
    const lines = array.length - 1;
    console.log(lines);
});
```
---
<br>


### 3.5. LS filtrado
```javascript
// ENUNCIADO:
Crea un programa que dado un directorio imprima una lista de archivos filtrados por la extensión. 
El primer argumento será la ruta al directorio  y el segundo la extensión a filtrar. 
El segundo argumento no incluye el punto '.'.
La lista de archivos a imprimir en consola debe hacerse un archivo por línea y debes utilizar Async I/O.

// PISTA:
- La función fs.readdir() recibe como parámetros: una ruta(path) y un callback. 
  La firma del callback es: `function callback(err, list) { /* ... */ }`

- La lista es un arreglo de nombres de archivos de tipo String.

- Además, el módulo `path` puede resultar útil, especialmente la función `extname`.
```

- **SOLUCIÓN:**
```javascript
// program.js
const fs = require('fs');
const path = require('path');

const dir = process.argv[2];
const ext = '.' + process.argv[3];

const callback = (err, list) => {
    if (err) throw err;

    list.forEach(file => { if (path.extname(file) === ext) console.log(file); });
};

fs.readdir(dir, callback);
```
---
<br>

### 3.6. Hazme Modular
```javascript
// ENUNCIADO:
Este problema es similar al anterior e introduce la idea de módulos. Deberás crear dos archivos para resolver el ejercicio.

El programa debe imprimir el listado de archivos de un directorio filtrando por extensión. 
Nuevamente el primer argumento será la ruta al directorio y el segundo la extensión a filtrar, por  
Debes usar Async I/O.

En Node, los callbacks suelen tener una firma convencional de tener (error, data). 
Esto implica que si hay un error el primer parámetro devuelve el error sino viene null y el segundo parámetro son los datos.  
Para este ejercicio los datos a devolver es la lista de archivos en forma de Array. 
Si ocurre un error, por ejemplo en la llamada a fs.readdir(), el callback debe llamarse con dicho error.

El módulo debe cumplir el siguiente contrato:  
  1. Exportar una función que reciba los parámetros mencionados.  
  2. Llamar al callback una única vez cuando ocurre un error o con la lista correspondiente.  
  3. No debe modificar variables globales o stdout.  
  4. Capturar los posibles errores y devolverlos en el callback.  
   
La ventaja de usar contratos es que el módulo puede ser usado por cualquiera que asuma este contrato.

// PISTA:
- Para crear un módulo basta con crear un nuevo archivo en el directorio de trabajo. 
  Para definir una función de export, 
  debes asignar la función al objeto global module.exports: `module.exports = function (args) { /* ... */ }`
  También puedes usar una función con nombre y asignar el nombre a exports.

- Para llamar a esta función desde el programa debes usar require de la misma forma que para cargar el módulo de fs 
  salvo que debes agregar el prefijo './' para indicar que es un archivo del directorio actual:
  `const mymodule = require('./mymodule.js')`
  El '.js' es opcional y en la mayoría de los casos se omite.

- Ahora ya tienes cargada la función del módulo en la variable mymodule y la puedes invocar.
  Ten en cuenta que es buena práctica en Node controlar errores y devolverlos bien al principio del código:
    function bar (callback) {
    foo(function (err, data) {
        if (err) { return callback(err) } // devolver el error
    
        // ... no hay error, continuar con los cálculos.
    
        // si todo termina bien, llamar el callback con `null` como parámetro de error
    
        callback(null, data)
    })
    }
```

- **SOLUCIÓN:**
```javascript
// program.js
const mymodule = require('./mymodule');

const dir = process.argv[2];
const ext = process.argv[3];

const callback = (err, data) => {
    if (err) throw err;

    data.forEach(file => console.log(file));
};

mymodule(dir, ext, callback);
```

```javascript
// mymodule.js
const fs = require('fs');
const path = require('path');

module.exports = (dir, ext, callback) => {

    fs.readdir(dir, (err, list) => {

        if (err) return callback(err);

        const data = list.filter(file => path.extname(file) === '.' + ext);
        callback(null, data);

    });
};
```
---
<br>


### 3.7. Cliente HTTP
```javascript
// ENUNCIADO:
Escribe un programa que reciba como argumento una URL y realice una petición HTTP GET a la misma. 
Luego, deberá imprimir por consola el contenido de cada evento "data" de la petición, uno por línea.

// PISTA:
- Para este ejercicio necesitas el módulo http incluido en Node.
  El método http.get() es versión simplificada para peticiones GET y conviene que la uses para la solución. 
  El primer parámetro de http.get() es la URL y el segundo es un callback.  
  A diferencia de otros callbacks la firma es: `function callback (response) { /* ... */ }`

- Siendo response un objeto Stream de Node. En Node los Streams emiten eventos, a los cuales puedes suscribir callbacks. 
  Para este ejercicio sólo nos interesan los eventos: "data", "error" y "end". 
  Para escuchar un evento debes hacer: `response.on('data', function (data) { /* ... */ })`  
   
- El evento "data" se dispara cuando un chunk, conjunto de datos, está disponible para procesarse. 
  El tamaño del chunk depende de la implementación.  
   
- Nota: Por omisión, los objetos 'data' recibidos son Buffers de Node que deben ser convertidos a Strings para luego ser escritos en consola. 
  Sin embargo, el objeto response que obtienes de http.get() tiene un método setEncoding() que permite definir cómo se leen los bytes obtenidos. 
  Si lo llamas con parámetro "utf8" recibirás Strings en los eventos emitidos.
```

- **SOLUCIÓN:**
```javascript
// program.js
const http = require('http');

const url = process.argv[2];

http.get(url, (response) => {

  response.setEncoding('utf8');
  response.on('data', data => console.log(data));
  response.on('error', error => console.error(error));
  response.on('end', () => console.log('Response ended'));
});
```
---
<br>


### 3.8. Colección HTTP
```javascript
// ENUNCIADO:
Escribe un programa que realice una petición HTTP GET a una URL provista como primer argumento del programa.
Almacena todos los datos recibidos del servidor, es decir no sólo el primer evento "data", 
y luego escribe a consola dos líneas:  
- En la primera escribe la cantidad de caracteres recibidos.
- En la segunda escribe la totalidad de caracteres recibidos (todo el string).

// PISTA:
- Hay por lo menos dos formas de resolver este problema:
  1) Almacenar los datos de todos los eventos "data" para luego agregarlos los resultados antes de imprimirlos por consola. 
  Puedes usar el evento "end" para saber cuando terminas de recibir datos.  
   
  2) Usa un paquete de terceros para evitar los problemas de almacenar el stream completo de datos. 
  Por ejemplo, tienes a disposición: bl (BufferList) o concat-stream.

- Para instalar alguno de estos paquetes usa Node Package Manager npm de la siguiente forma: 
  `$ npm install bl` 
  // or 
  `$ npm install concat-stream`

- Npm descargará el paquete e instalará la última versión disponible en la carpeta node_modules. 
  Todos los paquetes instalados ahí pueden cargarse desde tu programa usando require sin prefijo: `const bl = require('bl')`
  Node busca primero en su núcleo de módulos y si no lo encuentra busca en node_modules.
  En caso de no tener conexión a Internet, simplemente crea una carpeta node_modules y 
  copia el paquete desde el directorio de instalación de learnyounode.

- Ambos paquetes pueden usar un stream piped para capturar los datos. 
  Una vez que se acaba el stream se dispara un callback con todos los datos:
     `response.pipe(bl(function (err, data) { /* ... */ }))`
     // or
     `response.pipe(concatStream(function (data) { /* ... */ }))`

- Recuerda hacer data.toString() para convertir al Buffer de Node a String.
```

- **SOLUCIÓN:**
  - Usando el paquete 'bl':
```javascript
// program.js
const http = require('http');
const bl = require('bl');

const url = process.argv[2];

http.get(url, (response) => {

  response.pipe(bl((err, data) => {
    
    if (err) return console.error(err);

    const str = data.toString();
    console.log(str.length);
    console.log(str);
  }));
});

```
- **SOLUCIÓN:**
  - Usando el paquete 'concat-stream':
```javascript
// program.js
const http = require('http');
const concatStream = require('concat-stream');

const url = process.argv[2];

http.get(url, (response) => {
response.pipe(concatStream(data => {
    
    const str = data.toString();

    console.log(str.length);
    console.log(str);
  }));
});
```
- **SOLUCIÓN:**
  - Sin usar paquetes de terceros:
```javascript
// program.js
const http = require('http');

const url = process.argv[2];

http.get(url, (response) => {
  response.setEncoding('utf8');
  let data = '';

  response.on('data', (chunk) => { data += chunk; });

  response.on('end', () => {
    console.log(data.length);
    console.log(data);
  });

  response.on('error', (error) => { console.error(error); });
});
```
---
<br>


### 3.9. Malabares con asincronismo
```javascript
// ENUNCIADO:
Este ejercicio es similar al anterior puesto que debes usar http.get().  
Sin embargo, esta vez tu programa recibirá tres URLs como argumentos.  
   
Tu programa deberá imprimir el contenido de cada una de las URLs en consola en el mismo orden que fueron recibidos los argumentos. 
No deberás imprimir el largo, solo el contenido como String, pero debes respetar el orden de llegada de los argumentos.

// PISTA:
- Como las llamadas a las URLs son asíncronas, 
  es probable que no recibas las respuestas en orden por lo que no puedes imprimir las respuestas a medida que llegan.

- Tendrás que encolar los resultados y 
  mantener un contador de cuántas peticiones han sido recibidas de modo que al llegar al final puedas imprimir los resultados.

- En la vida real, utilizar `async` o `run-parallel` facilitaría la continuación de los callbacks. 
  Pero para el alcance de este ejercicio se debería realizar sin utilizarlo.
```

- **SOLUCIÓN:**
  - Usando arrays para almacenar las respuestas:
```javascript
// program.js
const http = require('http');
const bl = require('bl');

const urls = process.argv.slice(2);
const responses = [];
let count = 0;

urls.forEach((url, index) => {
  http.get(url, (response) => {

    // Almacenar la respuesta en un array en el orden correcto
    response.pipe(bl((err, data) => {
      if (err) return console.error(err);
      responses[index] = data.toString();
      count++;

      // Imprimir el resultado en el orden correcto
      if (count === urls.length) responses.forEach((response) => console.log(response));
    }));
  })
});
```
- **SOLUCIÓN:**
  - Usando promesas:
```javascript
// program.js
const urls = process.argv.slice(2);

const fetchUrl = (url) => {
  return new Promise((resolve, reject) => {
    http.get(url, (response) => {
      response.pipe(concatStream((err, data) => {
        if (err) { reject(err) }
        else { resolve(data.toString()) }
      }));
    });
  });
};

Promise.all(urls.map(fetchUrl))
  .then((results) => { results.forEach((result) => console.log(result)) })
  .catch((err) => console.error(err));
```
---
<br>


### 3.10. Servidor de  tiempo
```javascript
// ENUNCIADO:
¡Crea un Servidor de tiempo y hora TCP!

El servidor debe escuchar conexiones TCP en el puerto indicado por el primer argumento del programa. 
Para cada conexión debes escribir la fecha actual y 
la hora en formato 24hs del siguiente modo: "AAAA-MM-DD hh:mm" seguido por un carácter newline('\n'). 
Tanto el mes, el día como la hora y minuto deben tener un 0 para ocupar 2 espacios, por ejemplo: "2013-07-06 17:42"

// PISTA:
- Para este ejercicio crearemos un servidor TCP 
  en lugar de usar el módulo HTTP usaremos el módulo net del núcleo de Node que tiene funcionalidades de red.

- El módulo net tiene un método `net.createServer()` que recibe un callback. 
  A diferencia de otros callbacks en Node, el callback createServer() se llama una vez por cada conexión entrante.
  La firma es la siguiente: `function callback (socket) { /* ... */ }`

- `net.createServer()` devuelve una variable instancia de server. 
  Para iniciar la escucha del servicio hay que llamar a `server.listen(portNumber)`.
  Un ejemplo de un servidor Node típico es como sigue:
    const net = require('net')
    const server = net.createServer(function (socket) {
      /// manejo del socket
    })
    server.listen(8000)

- Recuerda usar el puerto recibido por argumento.

- El objeto socket contiene información sobre la conexión y es un Stream duplex, es decir que se puede escribir y leer a la vez.

- Puedes usar `socket.write(data)` para escribir en el socket y luego `socket.end()` para cerrar el socket. Alternativamente, 
  el método end() puede recibir un objeto de datos socket.end(data).

- Para calcular la fecha puedes usar `new Date()` y luego llamar a algunos métodos específicos:
  date.getFullYear()
  date.getMonth()   // empieza en 0
  date.getDate()    // devuelve día del mes, empieza en 1
  date.getHours()
  date.getMinutes()

- Otra opción más intrépida es usar el paquete strftime disponible en npm.
  La función strftime(formato, fecha) recibe un formato de fecha similar al date de UNIX.
```

- **SOLUCIÓN:**
```javascript
// program.js
const net = require('net');

const port = process.argv[2];

const createSpecialDate = () => {

  const date = new Date();
  const year = date.getFullYear();
  const month = (date.getMonth() + 1).toString().padStart(2, '0');
  const day = date.getDate().toString().padStart(2, '0');
  const hours = date.getHours().toString().padStart(2, '0');
  const min = date.getMinutes().toString().padStart(2, '0');

  return `${year}-${month}-${day} ${hours}:${min}`;
};

const server = net.createServer((socket) => {
  //socket.write("Hello, I'm the server!\n");
  socket.end(createSpecialDate() + '\n');
});


server.listen(port);

// Comprobación:
// $ tesnet localhost 8000
```
---
<br>

### 3.11. Servidor de archivos
```javascript
// ENUNCIADO:
Escribe un servidor HTTP que sirva un mismo archivo de texto para todas las peticiones que reciba.  
   
El servidor deberá escuchar en un puerto cuyo número será el primer argumento del programa. 
Como segundo argumento recibirá la ruta a la ubicación del archivo. 
Debes usar `fs.createReadStream()` para servir como stream los contenidos del archivo en la respuesta del servicio.

// PISTA:
- En este ejercicio debes crear un servidor HTTP en lugar de un servidor TCP. 
  Usa el módulo http de Node para ello que tiene un método `http.createServer()` para servir peticiones HTTP.  
   
- http.createServer() espera de parámetro un callback a invocar cuando se reciba una petición HTTP. 
  La firma de dicho callback es la siguiente: `function callback (request, response) { /* ... */ }`  
   
- Los parámetros request y response son los objetos que representan la petición y su respuesta respectivamente. 
  La petición provee propiedades, como ser el encabezado y los parámetros de la misma. 
  La respuesta permite devolverle al cliente encabezados y un cuerpo (body).  
   
- ¡Ten en cuenta que ambos request y response son streams de Node!
  Por lo tanto puedes usar APIs de streaming para simplificar el envío de datos.  
   
- La llamada a `http.createServer()` devuelve una instancia del server. 
  Debes llamar a `server.listen(portNumber)` para comenzar la escucha en un puerto particular:
    const http = require('http')  
    const server = http.createServer(function (req, res) {
      // manejar cada petición aquí.
    })
    server.listen(8000)

- Recuerda que el módulo fs tiene APIs para streaming de archivos. 
  Debes usar `fs.createReadStream()` para crear un stream que represente el archivo de entrada. 
  Luego puedes concatenar el stream con pipe src.pipe(dst) para pasar los datos del stream src al stream writer de salida dst. 
  Es decir puedes conectar un filesystem stream a un HTTP response stream.
```
- **SOLUCIÓN:**
```javascript
// program.js
const http = require('http');
const fs = require('fs');

const port = process.argv[2];
const path = process.argv[3];

const server = http.createServer((req, res) => {

  const file = fs.createReadStream(path);
  file.pipe(res);
});


server.listen(port);

// Comprobación:
// $ curl http://localhost:8000
```
---
<br>


### 3.12. Transformador a mayúsculas HTTP
```javascript
// ENUNCIADO:
Escribe un servidor HTTP que reciba sólo peticiones POST y convierta los caracteres del cuerpo de la petición a mayúsculas y 
lo devuelva al cliente.  
   
El servidor deberá escuchar en un puerto cuyo número será el primer argumento del programa.

// PISTA:
- Para resolver el ejercicio es conveniente usar las capacidades de streaming de los objetos request y response pero no obligatorio.  
   
- Hay muchos paquetes en el registro de npm que permiten "transformar" streams. 
  Para este ejercicio sugerimos usar `through2-map` pues su API es simple.  

- `through2-map` te permite crear un transform stream que recibe un chunk data y lo devuelve modificado.
  Funciona como `Array#map()` pero se aplica a streams:  
    const map = require('through2-map')  
    inStream.pipe(map(function (chunk) {  
      return chunk.toString().split('').reverse().join('')  
    })).pipe(outStream)  
   
- En el ejemplo inStream se convierte a String luego se inverten los the caracteres y el resultado se concatena al outStream. 
  Básicamente es un inversor de caracteres. 
  Recuerda que el tamaño del chunk se determina al principio (up-stream) y 
  no hay mucho control del tamaño de los datos recibidos por el servidor.  
   
- Para instalar through2-map escribe en la consola: `$ npm install through2-map`

- En caso de no tener conexión a Internet, simplemente crea una carpeta node_modules y 
  copia el paquete desde el directorio de instalación de learnyounode.
```

- **SOLUCIÓN:**
```javascript
// program.js
const http = require('http');
const map = require('through2-map');

const port = process.argv[2];

const server = http.createServer((req, res) => {

  if (req.method === 'POST') {
    req.pipe(map(chunk => chunk.toString().toUpperCase())).pipe(res);
  } else {
    res.writeHead(405);
    res.end('Method Not Allowed');
  }
});

server.listen(port);

// Comprobación:
// $ curl -X POST --data "hello" http://localhost:8000
```
---
<br>

### 3.13. API JSON en el servidor HTTP
```javascript
// ENUNCIADO:
Escribe un servidor de HTTP que sirva datos en formato JSON cuando reciba una petición GET con la ruta (endpoint) '/api/parsetime'. 
Asume que la petición tiene un parámetro 'iso' cuyo valor es un fecha hora en formato ISO:
`/api/parsetime?iso=2013-08-10T12:10:15.474Z`  
   
La respuesta JSON debe contener únicamente los propiedades 'hour', 'minute' y 'second' correspondientes a la fecha recibida:  
  {  
    "hour": 14,  
    "minute": 23,  
    "second": 15  
  }  
   
Luego, agrega un segundo endpoint con ruta '/api/unixtime' que reciba los mismos parámetros que la anterior 
pero que devuelva la fecha en formato UNIX:  
  {  
      "unixtime": 1376136615474  
  }  
   
El servidor deberá escuchar en un puerto cuyo número será el primer argumento del programa.

// PISTA:
- El objeto request de HTTP tiene un atributo `url` que deberás usar para distinguir las "routes" de cada endpoint.

- Puedes parsear la URL y los parámetros usando el módulo url de Node, 
  `new URL(request.url)` parsea y devuelve un objeto con atributos pertinentes:
  `$ node -pe "new URL('/test?q=1', 'http://example.com')"`

- Para enviar la respuesta del servidor en formato JSON puedes usar el método `JSON.stringify()`. 
  Asimismo convendría que en la misma le agregaras un encabezado 'Content-Type' adecuado:
  `res.writeHead(200, { 'Content-Type': 'application/json' })`

- Por último ten en cuenta el objeto JavaScript Date que permite imprimir fechas en formato ISO format: `new Date().toISOString()`.
  También parsea dicho formato cuando se lo pasa por parámetro al constructor Date. Revisa también el uso de `Date#getTime()`.
```

- **SOLUCIÓN:**
```javascript
// program.js
const http = require('http');

const port = process.argv[2];

const server = http.createServer((req, res) => {

  // Parseamos la URL para obtener el pathname y el query string
  const parsedUrl = new URL(req.url, `http://localhost:${port}`);

  // Extraemos el pathname y el parámetro iso del query string
  const pathname = parsedUrl.pathname;
  const iso = parsedUrl.searchParams.get('iso');

  // Convertimos el parámetro iso a un objeto Date
  const date = new Date(iso);

  // Si el pathname es /api/parsetime devolvemos la hora, minuto y segundo
  if (pathname === '/api/parsetime') {
    const time = {
      hour: date.getHours(),
      minute: date.getMinutes(),
      second: date.getSeconds()
    };
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify(time));
  } else if (pathname === '/api/unixtime') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ unixtime: date.getTime() }));
  } else {
    res.writeHead(404);
    res.end();
  }
});

server.listen(port);

// Comprobación:
// $ curl "http://localhost:8000/api/parsetime?iso=2013-08-10T12:10:15.474Z"
```
---
<br><br><br>

## *[volver al índice](../README.md)*