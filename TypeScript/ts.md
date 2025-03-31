# TypeScript
TypeScript es un lenguaje de programación de código abierto basado en JavaScript (ES6+), desarrollado por Microsoft.  
Añade tipado estático, interfaces, clases, módulos, genéricos, y otras características orientadas a mejorar el desarrollo a gran escala.


## 1. Instalación, compilación y uso ⚙️
```bash
npm install -g typescript # Instala TypeScript
npm install -g ts-node    # ts-node es un ejecutor de TypeScript (para desarrollo)

tsc archivo.ts            # Compila el archivo
tsc --watch archivo.ts    # Compila automáticamente al guardar cambios

ts-node archivo.ts        # Ejecuta el archivo (en desarrollo)
```
---
<br>


## 2. Tipos de datos 🧮
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


## 3. Interfaces y Type 📚
Las interfaces son un tipo de dato que define la estructura de un objeto:
```typescript
interface Persona {
    nombre: string;
    edad: number;
}

const persona: Persona = { nombre: 'Juan', edad: 30 };
```

Type es una forma de definir un tipo de dato personalizado:
```typescript
type Persona = {
    nombre: string;
    edad: number;
}

const persona: Persona = { nombre: 'Juan', edad: 30 };
```

| Característica                     | TYPE                                     | INTERFACE                               |
|------------------------------------|------------------------------------------|-----------------------------------------|
| Definición de tipos primitivos     | ✅ Sí                                    | ❌ No                                  |
| Composición                        | ✅ Con operadores (`&`, `\|`)            | ✅ Con `extends`                       |
| Extensión de otros tipos           | ✅ Puede extender `type` o `interface`   | ✅ Puede extender `interface` o `type` |
| Implementación en clases           | ✅ Sí                                    | ✅ Sí                                  |
| Declaración múltiple (merge)       | ❌ No (genera error o sobrescribe)       | ✅ Sí (se fusionan propiedades)        |
| Más adecuada para                  | Tipos complejos, uniones y utilidades    | Modelar objetos y estructuras de datos  |
| Inferencia de tipo                 | ✅ Sí                                    | ✅ Sí                                  |
| Compatibilidad con utilidades TS   | ✅ Sí (Pick, Omit, etc.)                 | ✅ Sí                                  |
| Legibilidad en objetos grandes     | ✅ Buena                                 | ✅ Buena                               |
| Creación de alias para funciones   | ✅ Sí                                    | ❌ No directamente                     |

---
<br>


## 4. Uniones de tipos 🔗 
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


## 5.  Narrowing (discriminación de tipos) 🎯
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

// Con la palabra clave 'in' se puede discriminar el tipo de la variable (Type Guards)
function salute(person: Person) {
    if ('role' in person) {
        console.log(`Hola ${person.role}`)
    } else {
        console.log(`Hola ${person.occupation}`)
    };
}

// Con la palabra clave 'is' se puede discriminar el tipo de la variable (Type Predicates)
function isAdmin(person: Person): person is Admin {
    return person.type === 'admin';
}

function isUser(person: Person): person is User {
    return person.type === 'user';
}

// Se puede usar la discriminación de tipos en los argumentos de la función (Function Overloads)
function filterPersons(persons: Person[], personType: 'user', criteria: Partial<Omit<User, 'name'>>): User[];
function filterPersons(persons: Person[], personType: 'admin', criteria: Partial<Omit<Admin, 'name'>>): Admin[];

function filterPersons(persons: Person[], personType: 'user' | 'admin', criteria: Partial<Omit<User, 'name'>> | Partial<Omit<Admin, 'name'>>): Person[] {
    return persons.filter(person => {
        if (personType === 'user') {
            return isUser(person) && Object.keys(criteria).every(key => person[key] === criteria[key]);
        } else {
            return isAdmin(person) && Object.keys(criteria).every(key => person[key] === criteria[key]);
        }
    });
}
```
---
<br>


## 6. Partial y Omit ✂️
- **Partial:** Convierte todas las propiedades de un tipo en opcionales.
- **Omit:** Elimina una o más propiedades de un tipo.
```typescript
interface User {
    name: string;
    age: number;
    occupation: string;
}

type PartialUser = Partial<User>;
//Equivalent to:
type PartialUser = {
    name?: string | undefined;git 
    age?: number | undefined;
    occupation?: string | undefined;
}
type OmitUser = Omit<User, 'occupation'>;
//Equivalent to:
type OmitUser = {
    name: string;
    age: number;
}

const user: PartialUser = { name: 'Juan' };
const user2: OmitUser = { name: 'Juan', age: 30 };

// Se pueden combinar ambas
type PartialOmitUser = Partial<Omit<User, 'occupation'>>;
const user3: PartialOmitUser = { name: 'Juan' };
```
---
<br>


## 7. Genéricos 🧩
Permite crear componentes reutilizables que trabajan con varios tipos de datos.
```typescript
function identity<T>(arg: T): T {
    return arg;
}

let output = identity<string>('Hola');
let output2 = identity<number>(10);

// Se puede omitir el tipo de dato y TypeScript lo infiere automáticamente
let output3 = identity('Hola');

// Se pueden usar genéricos en interfaces
interface Pair<T, U> {
    first: T;
    second: U;
}

// Se podría incluso intercambiar los tipos
function swap<T, U>(primero:T, segundo:U):[U, T] {
    return [segundo, primero];
}
```
---
<br>


## 8. Intersección de tipos 🤝
Permite combinar dos o más tipos en uno solo.  
***Si la intersección de tipos tiene propiedades con el mismo nombre pero con tipos diferentes, el tipo resultante será never.*
```typescript
interface User {
  type: 'user';
  name: string;
  age: number;
  occupation: string;
}

interface Admin {
  type: 'admin';
  name: string;
  age: number;
  role: string;
}

type PowerUser = Omit<User, 'type'> & Omit<Admin, 'type'> & { type: 'powerUser' };
```
---
<br>


## 9. Módulos 📦
Permite organizar el código en archivos separados.
```typescript
// archivo1.ts
export const PI = 3.14;
export function sumar(a: number, b: number): number {
    return a + b;
}
export class Persona {
    constructor(public nombre: string, public edad: number) {}
}

// archivo2.ts
import { PI, sumar, Persona } from './archivo1';

const resultado = sumar(10, 20);
const persona = new Persona('Juan', 30);
```

Si las importaciones no tinenen tipo puedes declararlos tu mismo en un archivo `.d.ts` (declaración de módulos).
```typescript
// archivo1.d.ts
declare module 'archivo1' {
    const PI: number;
    function saludar(): void;
    interface Persona { nombre: string; edad: number; }
}

// archivo2.ts
import 'path/archivo1';

console.log(PI);
saludar();
let persona: Persona = { nombre: 'Juan', edad: 30 };
```

Si las importaciones no están en la misma ruta hay que indicarlo en el typeRoots (tsconfig.json):
```json
{
  "compilerOptions": {
    "typeRoots": [
      "./node_modules/@types",
      "./src/declarations"
    ]
  }
}
```
<br><br><br>

## *[volver al índice](../README.md)*