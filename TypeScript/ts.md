# TypeScript
TypeScript es un lenguaje de programación de código abierto basado en JavaScript (ES6+), desarrollado por Microsoft.  
Añade tipado estático, interfaces, clases, módulos, genéricos, y otras características orientadas a mejorar el desarrollo a gran escala.


## 1. Instalación
```bash
npm install -g typescript
```
---
<br>

## 2. Compilación
```bash
tsc archivo.ts         # Compila el archivo
tsc --watch archivo.ts # Compila automáticamente al guardar cambios
```
---
<br>

## 3. Tipos de datos
- **Primitivos:**
  - `number`: Números enteros y decimales.
  - `string`: Cadenas de texto.
  - `boolean`: Valores lógicos.
  - `null`: Valor nulo.
  - `undefined`: Valor indefinido.
- **Especiales:**
  - `any`: Cualquier tipo de dato.
  - `void`: No retorna ningún valor.
  - `never`: Tipo de dato que nunca ocurre.
- **Compuestos:**
  - `Array`: Arreglo de elementos.
  - `Tuple`: Arreglo de elementos con tipos de datos definidos.
  - `Object`: Objeto.
- **Avanzados:**
  - `Enum`: Conjunto de constantes.
  - `Function`: Función.
  - `Interface`: Interfaz.
  - `Class`: Clase.
  - `Generics`: Genéricos.

```typescript
// Ejemplo de tipos de datos
let numero: number = 10;
let cadena: string = 'Hola';
let logico: boolean = true;
let nulo: null = null;
let indefinido: undefined = undefined;

let cualquiera: any = 'Cualquier cosa';
let saludar: () => void = () => console.log('Hola');
let nunca: never = (() => { throw new Error('Error'); })();

let array: number[] = [1, 2, 3];
let tupla: [string, number] = ['Hola', 10];

enum Dia { Lunes, Martes, Miércoles, Jueves, Viernes, Sábado, Domingo }
let dia: Dia = Dia.Lunes;

let function: Function = function() { console.log('Hola'); };

interface Persona { nombre: string; edad: number; }
let objeto: Persona = { nombre: 'Juan', edad: 30 };

class Clase { 
    nombre: string; 
    edad: number; 
    constructor(nombre: string, edad: number) { 
        this.nombre = nombre; 
        this.edad = edad; 
    }
}
```
---
<br>

## 4. Interfaces
Las interfaces son un tipo de dato que define la estructura de un objeto.
```typescript
interface Persona {
    nombre: string;
    edad: number;
}

const persona: Persona = { nombre: 'Juan', edad: 30 };
```
---
<br>

## 5. Uniones de tipos
Permite definir una variable con más de un tipo de dato.
```typescript
// Con tipos primitivos
let num: number | string = 10;
num = 'Diez';

// Con interfaces
interface User{
    name: string;
    age: number;
    occupation: string;
}

interface Admin{
    name: string;
    age: number;
    role: string;
}

type Person = User | Admin;
```
---
<br>

## 6.  Narrowing (discriminación de tipos)
Permite reducir el tipo de una variable a partir de una condición.
```typescript
interface User{
    name: string;
    age: number;
    occupation: string;
}

interface Admin{
    name: string;
    age: number;
    role: string;
}

type Person = User | Admin;

// Con la palabra clave 'in' se puede discriminar el tipo de la variable
function salute(person: Person) {
    if ('role' in person) {
        console.log(`Hola ${person.role}`)
    } else {
        console.log(`Hola ${person.occupation}`)
    };
}

// Con la palabra clave 'is' se puede discriminar el tipo de la variable
function isAdmin(person: Person): person is Admin {
    return person.type === 'admin';
}

function isUser(person: Person): person is User {
    return person.type === 'user';
}
```
---
<br>

## 7. Partial y Omit
- **Partial:** Convierte todas las propiedades de un tipo en opcionales.
- **Omit:** Elimina una o más propiedades de un tipo.
```typescript
interface User {
    name: string;
    age: number;
    occupation: string;
}

type PartialUser = Partial<User>;
type OmitUser = Omit<User, 'occupation'>;

const user: PartialUser = { name: 'Juan' };
const user2: OmitUser = { name: 'Juan', age: 30 };

// Se pueden combinar ambas
type PartialOmitUser = Partial<Omit<User, 'occupation'>>;
const user3: PartialOmitUser = { name: 'Juan' };
```
---
<br>

<br><br><br>

## *[volver al índice](../README.md)*