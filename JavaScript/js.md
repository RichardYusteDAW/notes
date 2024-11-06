# JavaScript

## 1. Diferencia entre var, let y const
`var`

- Alcance: Function scope (o global si se declara fuera de una función).
- Declaración: Sí
- Reasignación: Sí

```javascript
var x = 1;
if (true) {
  var x = 2;      // Esta es la misma variable x, redeclarada.
  // x = 2;       // Esta es la misma variable x, reasignada.
  console.log(x); // 2
}
console.log(x);   // 2
```

`let`

- Alcance: Block scope.
- Declaración: Sí, pero no puede ser redeclarada en el mismo bloque.
- Reasignación: Sí

```javascript
let x = 1;
if (true) {
  let x = 2;      // Esta es una nueva variable x, solo accesible dentro del bloque.
  // x = 2;       // Esta es la misma variable x, reasignada.
  console.log(x); // 2
}
// let x = 3;     // Error: Identifier 'x' has already been declared.
console.log(x);   // 1
```

`const`

- Alcance: Block scope.
- Declaración: Sí, pero no puede ser redeclarada en el mismo bloque.
- Reasignación: No

```javascript
const x = 1;
if (true) {
  const x = 2;    // Esta es una nueva variable x, solo accesible dentro del bloque.
  // x = 2;       // Error: Assignment to constant variable.
  console.log(x); // 2
}
// const x = 3;   // Error: Identifier 'x' has already been declared.
console.log(x);   // 1
```

---

<br>

## 2. Template literals
```javascript
let nombre = "Ana";
let saludo = `Hola, ${nombre}!`; // "Hola, Ana!"

let multiLinea = `
  Hola,
  ${nombre}!
`; // "Hola,\nAna!"
```

---

<br>

## 3. Comentarios
```javascript
// Comentario de una línea

/*
  Comentario
  de
  varias
  líneas
*/
```

---

<br>

## 4. Operadores
### 4.1. Aritméticos
```javascript
| Operator | Description                       | Example                          |
|----------|-----------------------------------|----------------------------------|
| +        | Addition                          | 25 + 5 = 30                      |
| -        | Subtraction                       | 25 - 5 = 20                      |
| *        | Multiplication                    | 10 * 20 = 200                    |
| /        | Division                          | 20 / 2 = 10                      |
| %        | Modulus                           | 56 % 3 = 2                       |
| ++       | Increment                         | var a = 10; a++; Now a = 11      |
| --       | Decrement                         | var a = 10; a--; Now a = 9       |
```

### 4.2. Incremento y decremento
```javascript
| Operator | Description                       | Example                          | Result             |
|----------|-----------------------------------|----------------------------------|--------------------|
| var++    | Post Increment                    | var a = 0, b = 10;  a = b++;     | a == 10 and b == 11|
| ++var    | Pre Increment                     | var a = 0, b = 10;  a = ++b;     | a == 11 and b == 11|
| var--    | Post Decrement                    | var a = 0, b = 10;  a = b--;     | a == 10 and b == 9 |
| --var    | Pre Decrement                     | var a = 0, b = 10;  a = --b;     | a == 9  and b == 9 |
```

### 4.3. Asignación
```javascript
| Operator | Example                           | Is equivalent to                 |
|----------|-----------------------------------|----------------------------------|
| =        | x = y                             | x = y                            |
| +=       | x += y                            | x = x + y                        |
| -=       | x -= y                            | x = x - y                        |
| *=       | x *= y                            | x = x * y                        |
| /=       | x /= y                            | x = x / y                        |
| %=       | x %= y                            | x = x % y                        |
```

### 4.4. Comparación
```javascript
| Operator | Description                       | Example                          |
|----------|-----------------------------------|----------------------------------|
| ==       | Equal to                          | 5 == 10  false                   |
| ===      | Identical (equal and of same type)| 5 === 10 false                   |
| !=       | Not equal to                      | 5 != 10 true                     |
| !==      | Not Identical                     | 10 !== 10 false                  |
| >        | Greater than                      | 10 > 5 true                      |
| >=       | Greater than or equal to          | 10 >= 5 true                     |
| <        | Less than                         | 10 < 5 false                     |
| <=       | Less than or equal to             | 10 <= 5 false                    |
```

### 4.5 Lógicos o booleanos
```javascript
| Operator | Description                       | Example                          |
|----------|-----------------------------------|----------------------------------|
| &&       | Returns true if boths are true    | true && false = false            |
| ||       | Returns true if one is true       | true \|\| false = true           |
| !        | Returns true if it is false       | !true = false                    |
```

### 4.6. Ternario
```javascript
let edad = 25;
let mensaje = edad >= 18 ? "Eres mayor de edad." : "Eres menor de edad.";

console.log(mensaje); // "Eres mayor de edad."
```
---
<br>

## 5. Arrays
```javascript
let articulos = ["zapatillas", "camisa", "calcetines", "chaqueta"];
let articulos = new Array("zapatillas", "camisa", "calcetines", "chaqueta");

articulos.length;                      // Tamaño del array.
articulos[1];                          // Segundo campo del array.
articulos.push("balón");               // Agrega un campo al FINAL del array.
articulos.pop();                       // Elimina el ÚLTIMO campo del array.
articulos.push("balón", "raqueta");    // Agrega VARIOS campos al FINAL del array.
articulos.unshift("balón");            // Agrega un campo al INICIO del array.
articulos.shift();                     // Elimina el PRIMER campo del array.
articulos.unshift("balón", "raqueta"); // Agrega VARIOS campos al INICIO del array.
```

<br><br>

### 5.1. Otros métodos
```javascript
let frutas = ["manzana", "pera", "naranja", "plátano", "fresa"];
```

#### 5.1.1. from()
- Crea un nuevo array a partir de un objeto iterable.

```javascript
let frutasArray = Array.from("frutas");

console.log(frutasArray); // ["f", "r", "u", "t", "a", "s"]
```

#### 5.1.2. concat()
- Combina dos o más arrays.

```javascript
let verduras = ["zanahoria", "calabacín", "lechuga"];
let alimentos = frutas.concat(verduras);

console.log(alimentos); // ["fresa", "manzana", "naranja", "pera", "plátano", "zanahoria", "calabacín", "lechuga"]
```

#### 5.1.3. fill()
- Rellena los elementos de un array con un valor estático.

```javascript
frutas.fill("uva", 2, 4); // Rellena desde el índice 2 hasta el 4 (sin incluirlo) con "uva".

console.log(frutas);      // ["manzana", "pera", "uva", "uva", "fresa"]
```

#### 5.1.4. includes()
- Comprueba si un array contiene un elemento.

```javascript
let contienePlatano = frutas.includes("plátano");

console.log(contienePlatano); // true
```

#### 5.1.5. indexOf() y lastIndexOf()
- Devuelve el índice de la primera ocurrencia de un elemento en el array.

```javascript
let indice = frutas.indexOf("naranja");

console.log(indice); // 2

// lastIndexOf() devuelve el índice de la última ocurrencia de un elemento en el array.
```

#### 5.1.6. join()
- Une todos los elementos de un array en un string.

```javascript
let frutasString = frutas.join(", ");

console.log(frutasString); // "fresa, plátano, naranja, pera, manzana"
```

#### 5.1.7. reverse()
- Invierte el orden de los elementos de un array.

```javascript
frutas.reverse();

console.log(frutas); // ["fresa", "plátano", "naranja", "pera", "manzana"]
```

#### 5.1.8. slice()
- Copia una parte de un array y devuelve un nuevo array.

```javascript
let frutas2 = frutas.slice(1, 3); // Desde el índice 1 hasta el 3 (sin incluirlo).

console.log(frutas2);             // ["pera", "naranja"]
```

#### 5.1.9. splice()
- Añade o elimina elementos de un array.

```javascript
frutas.splice(1, 3, "uva", "sandía"); // Desde el índice 1, elimina 3 elementos y añade "uva" y "sandía".

console.log(frutas); // ["manzana", "uva", "sandía", "fresa"]
```

#### 5.1.10. split()
- Divide un string en un array de substrings.

```javascript
let manzana = "manzana";
let letras = manzana.split("");

console.log(letras); // ["m", "a", "n", "z", "a", "n", "a"]
```

#### 5.1.11. sort()
- Ordena los elementos de un array.

```javascript
// Ordena alfabéticamente.
frutas.sort((a,b)=>{
  if(a<b) return -1;
  if(a>b) return 1;
  return 0;
})
frutas.sort(); // Manera abreviada de ordenar alfabéticamente.
console.log(frutas); // ["fresa", "manzana", "naranja", "pera", "plátano"]

// Ordena alfabéticamente en orden inverso.
frutas.sort((a, b) => b.localeCompare(a));
console.log(frutas); // ["plátano", "pera", "naranja", "manzana", "fresa"]

// Ordena numéricamente.
let numeros = [3, 5, 2, 4, 1];
numeros.sort((a, b) => a - b);
console.log(numeros); // [1, 2, 3, 4, 5]

// Ordena numéricamente en orden inverso.
numeros.sort((a, b) => b - a);
console.log(numeros); // [5, 4, 3, 2, 1]
```

<br><br>

### 5.2. Métodos para recorrer arrays
```javascript
let colores = ["rojo", "verde", "azul", "amarillo", "naranja"];
```

#### 5.2.1. forEach()
- Ejecuta una función por cada elemento del array.

```javascript
colores.forEach((color, index) => {
  console.log(`${index + 1}. ${color}`);
});
// "1. rojo", "2. verde", "3. azul", "4. amarillo", "5. naranja"
```

#### 5.2.2. map()
- Crea un nuevo array con los resultados de la función aplicada a cada elemento del array.

```javascript
let coloresMayusculas = colores.map((color) => color.toUpperCase());

console.log(coloresMayusculas); // ["ROJO", "VERDE", "AZUL", "AMARILLO", "NARANJA"]
```

#### 5.2.3. filter()
- Crea un nuevo array con los elementos que cumplen la condición.

```javascript
let coloresCortos = colores.filter((color) => color.length <= 4);
console.log(coloresCortos); // ["rojo", "azul"]
```

#### 5.2.4. find()
- Devuelve el primer elemento que cumple la condición.

```javascript
let color = colores.find((color) => color === "verde");

console.log(color); // "verde"
```

#### 5.2.5. findIndex()
- Devuelve el índice del primer elemento que cumple la condición.

```javascript
let indice = colores.findIndex((color) => color === "verde");

console.log(indice); // 1
```

#### 5.2.6. reduce()
- Aplica una función acumuladora a cada elemento del array, de izquierda a derecha, para reducirlo a un único valor.

```javascript
let numeros = [1, 2, 3, 4, 5];
let suma = numeros.reduce((total, num) => total + num, 0);

console.log(suma); // 15
```

#### 5.2.7. some()
Comprueba si al menos un elemento cumple la condición.

```javascript
let contieneAzul = colores.some((color) => color === "azul");

console.log(contieneAzul); // true
```

---

<br>

## 6. Objetos
```javascript
let persona = {
  nombre: "Ana",
  edad: 25,
  ciudad: "Madrid",
};

persona.nombre = "María";    // Añade el campo "nombre" al objeto y si ya existe lo sobreescribe.
persona["nombre"] = "María"; // Añade el campo "nombre" al objeto y si ya existe lo sobreescribe.
```

---

<br>

## 7. Destructuring
```javascript
// Destructuring de arrays
let colores = ["rojo", "verde", "azul"];
//let rojo = colores[0];
//let verde = colores[1];
//let azul = colores[2];
let [rojo, verde, azul] = colores;

console.log(rojo);   // "rojo"
console.log(verde);  // "verde"
console.log(azul);   // "azul"

// Destructuring de objetos
let persona = { nombre: "Ana", edad: 25 };
//let nombre = persona.nombre;
//let edad   = persona.edad;
let { nombre, edad } = persona;

console.log(nombre); // "Ana"
console.log(edad);   // 25
```

---

<br>

## 8. Spread operator
Se utiliza para expandir elementos de un array u objeto en otro array u objeto.

```javascript
// Spread operator en arrays
let colores = ["rojo", "verde", "azul"];
let colores2 = ["amarillo", "naranja", ...colores];

console.log(colores2); // ["amarillo", "naranja", "rojo", "verde", "azul"]

// Spread operator en objetos
let persona = { nombre: "Ana", edad: 25 };
let persona2 = { ...persona, ciudad: "Madrid" };

console.log(persona2); // { nombre: "Ana", edad: 25, ciudad: "Madrid" }
```

---

<br>

## 9. Rest parameter
Permite a una función aceptar un número indefinido de argumentos como un array.

```javascript
function sumar(a, b, ...numeros) {
  return numeros.reduce((total, num) => total + num, 0);
}

console.log(sumar(1, 2, 3, 4, 5)); // 12
```

---

<br>

## 10. For...in & For...of
- **For...in**: Itera sobre las propiedades de un objeto.
- **For...of**: Itera sobre los elementos de cualquier objeto iterable(array, string, map, set, etc.).

```javascript
// For...in
let colores = ["rojo", "verde", "azul"];
for (let index in colores) {
  console.log(colores[index]);
}

// For...of
let colores = ["rojo", "verde", "azul"];
for (let color of colores) {
  console.log(color);
}
```

---

<br>

## 11. Arrow functions
```javascript
// Función tradicional
function sumar(a, b) {
  return a + b;
}

// Arrow function
let sumar = (a, b) => a + b;
```

---

<br>

## 12. Synchronous vs Asynchronous
```javascript
/* Synchronous: El código se ejecuta en secuencia, línea por línea,
asegurando que cada operación se complete antes de que comience la siguiente.*/
console.log("Primero");
console.log("Segundo");
console.log("Tercero");

/* Asynchronous: El código asíncrono permite que ciertas operaciones se inicien 
y se completen en el futuro, sin bloquear la ejecución del código que sigue. */
console.log("Primero");
setTimeout(() => console.log("Tercero"), 1000);
console.log("Segundo");
```

| **Synchronous**                                                                | **Asynchronous**                                                                            |
| ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------- |
| Operaciones aritméticas                                                        | Timers (`setTimeout`, `setInterval`)                                                        |
| Operaciones de asignación                                                      | Operaciones de I/O (como acceso a archivos en Node.js)                                      |
| Operaciones lógicas                                                            | Solicitudes de red (`fetch`, `XMLHttpRequest`, AJAX)                                        |
| Acceso a propiedades de objetos                                                | Eventos de DOM (`addEventListener`, `onclick`, `onchange`)                                  |
| Manipulación de arrays (`map`, `filter`, `reduce`)                             | Promesas (`Promise`, `then`, `catch`, `finally`)                                            |
| Manipulación de strings (`split`, `replace`, `substring`)                      | Funciones `async/await`                                                                     |
| Operaciones en estructuras de control (`for`, `while`, `if-else`)              | APIs del navegador que son asincrónicas (como `Geolocation API`, `WebSocket`, `IndexedDB`)  |
| Funciones de fechas sincrónicas (`Date.now`, `Date.prototype.getFullYear`)     | Operaciones de DB en entornos que soportan I/O asincrónico (Node.js con `mongodb`, `mysql`) |
| Llamadas a funciones sincrónicas que no implican operaciones de I/O ni eventos | Animaciones (`requestAnimationFrame`)                                                       |
|                                                                                |                                                                                             |

- **¿Cuando se utiliza el código asíncrono?**
  - En operaciones que implican espera, como cargar datos desde una red o acceder a recursos lentos.
  - Para mejorar la eficiencia de la aplicación, permitiendo que múltiples operaciones sucedan al mismo tiempo sin detener la ejecución principal.<br><br>
- **¿Cómo se maneja el código asíncrono?**
  - Callbacks
  - Promesas
  - Async/await<br><br>
- **Event Loop:**
  - JavaScript tiene un modelo de concurrencia basado en un "event loop", que permite realizar operaciones de alta intensidad o larga duración sin bloquear el hilo principal.
    - **Event Loop**: Supervisa la pila de ejecución, la cola de tareas pendientes y la cola de callbacks. Mueve los callbacks listos de la cola de callbacks a la pila de ejecución cuando esta última está vacía.
    - **Pila de Callbacks**: También conocida como cola de mensajes, es donde se almacenan los callbacks DE OPERARICONES ASÍNCRONAS hasta que se puedan ejecutar. Los callbacks se ejecutan en el orden en que se completaron, asegurando que el código no se ejecute antes de que se complete la operación a la que está vinculado.
    - **Heap**: Espacio de memoria compartido donde se almacenan los objetos y variables.
    - **Web APIs**: Conjunto de funciones y métodos que permiten realizar operaciones asíncronas, como temporizadores, eventos de usuario, peticiones HTTP, etc.<br><br>
- **Secuencia de eventos**:
  1. Se ejecuta el código sincrónico sin interrupciones.
  2. Las APIs gestionan las operaciones asíncronas en segundo plano (fetch, setTimeout, etc.)
  3. Se añaden a la cola de eventos (callback queue) las operaciones asíncronas que han finalizado.
  4. El Event Loop supervisa constantemente la pila de ejecución (Call Stack) para verificar si está vacía, ya que debe estarlo para poder pasar al siguiente paso.
  5. Si la pila de ejecución está vacía, el Event Loop mueve el primer callback de la cola de eventos a la pila de ejecución y lo ejecuta.
  6. Se repite el proceso hasta que la cola de eventos esté vacía.

![Event Loop](./img/eventLoop.png)

---

<br>

## 13. Callbacks
- Un callback es una función que se pasa (sin paréntesis) como argumento a otra función y se ejecuta después de que ésta termine su ejecución.
- Se utilizan para ejecutar código después de que se haya completado una tarea asíncrona.

```javascript
function saludar(nombre, callback) {
  let edad = callback(1996, 2021);
  console.log(`Hola ${nombre}, tienes ${edad} años.`);
}

function age(birthYear, currentYear) {
  return currentYear - birthYear;
}

saludar("Ana", age); // "Hola Ana, tienes 25 años."
```

---

<br>

## 14. Promesas
- Una promesa es un objeto que representa la finalización o el fracaso de una operación asíncrona.
- Se resuelve con un valor o se rechaza con un error.
- `resolve` y `reject` son sustitutos de return y throw.

```javascript
let promesa = new Promise((resolve, reject) => {
  let exito = true;
  if (exito) {
    resolve("La operación se ha completado con éxito.");
  } else {
    reject("La operación ha fallado.");
  }
});

promesa
  .then((mensaje) => console.log(mensaje))
  .catch((error) => console.error(error));
```

- Es posible llamar a varias promesas en paralelo y esperar a que todas se resuelvan.
- Se reduce el tiempo de espera total al tiempo de espera de la promesa más larga.

```javascript
let promesa1 = new Promise((resolve, reject) => {
  setTimeout(() => resolve("Primera promesa"), 1000);
});

let promesa2 = new Promise((resolve, reject) => {
  setTimeout(() => resolve("Segunda promesa"), 2000);
});

Promise.all([promesa1, promesa2])
  .then((resultados) => console.log(resultados))
  .catch((error) => console.error(error));
```

---

<br>

## 15. Async/await
- `async` declara una función asíncrona y la convierte en una promesa.
- `await` pausa la ejecución de la función asíncrona hasta que la promesa se resuelva, pero no detiene la ejecución del hilo principal.

```javascript
// let obtenerDatos = async () => {}
async function obtenerDatos() {
  try {
    let datos = await fetch("https://jsonplaceholder.typicode.com/posts");
    let json = await datos.json(); // Se espera a que se resuelva la promesa.
    return json;
  } catch (error) {
    throw error;
  }
}

obtenerDatos()
  .then((json) => console.log("Datos obtenidos.", json))
  .catch((error) => console.error(error));
```

<br><br><br>

## *[volver al índice](../README.md)*
