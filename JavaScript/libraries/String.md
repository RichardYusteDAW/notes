# String

## Methods
```javascript
let text = "Hola, soy Ana.";

text.length;                  // Longitud del string.
text.charAt(2);               // Devuelve el carácter en la posición 2.
text.charCodeAt(3);           // Devuelve el valor Unicode del carácter en la posición 3.
text.concat(" Ortiz.");       // Devuelve un nuevo string concatenando " Ortiz." al final.
text.startsWith("Hola");      // Devuelve true si el string empieza con "Hola".
text.endsWith("Ana.");        // Devuelve true si el string termina con "Ana.".
text.includes("soy");         // Devuelve true si el string contiene "soy".
text.indexOf("soy");          // Devuelve la posición de la primera ocurrencia de "soy".
text.lastIndexOf("a");        // Devuelve la posición de la última ocurrencia de "a".
text.replace("Ana", "María"); // Reemplaza "Ana" por "María".
text.slice(5, 8);             // Devuelve el substring desde la posición 5 hasta la 8 (sin incluirla).
text.split(",", 5);           // Divide el string en un array de substrings, limitado a los 5 primeros elementos.
text.substr(5, 3);            // Devuelve 3 caracteres a partir de la posición 5.
text.substring(5, 8);         // Devuelve el substring desde la posición 5 hasta la 8 (sin incluirla).
text.toLowerCase();           // Convierte el string a minúsculas.
text.toUpperCase();           // Convierte el string a mayúsculas.
text.trim();                  // Elimina los espacios en blanco al principio y al final del string.
```
<br><br><br>

## *[volver al índice](../../index.md)*