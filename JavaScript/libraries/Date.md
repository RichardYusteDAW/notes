# Date

## Methods
```javascript
let date = new Date();
let date2 = new Date("2021-12-25T12:00:00Z");    // Fecha y hora en formato ISO 8601.
let date3 = new Date(2021, 11, 25, 12, 0, 0, 0); // Año, mes, día, hora, minuto, segundo, milisegundo.

// Getters
date.getFullYear();        // Año (2024).
date.getMonth();           // Mes (0-11).
date.getDate();            // Día del mes (1-31).
date.getDay();             // Día de la semana (0-6).
date.getHours();           // Hora (0-23).
date.getMinutes();         // Minutos (0-59).
date.getSeconds();         // Segundos (0-59).
date.getMilliseconds();    // Milisegundos (0-999).
date.getTime();            // Tiempo en milisegundos desde 1970.

date.getTimezoneOffset();  // Diferencia en minutos entre la hora local y UTC.
date.getUTCFullYear();     // Año en UTC.
date.getUTCMonth();        // Mes en UTC.
date.getUTCDate();         // Día del mes en UTC.
date.getUTCDay();          // Día de la semana en UTC.
date.getUTCHours();        // Hora en UTC.
date.getUTCMinutes();      // Minutos en UTC.
date.getUTCSeconds();      // Segundos en UTC.
date.getUTCMilliseconds(); // Milisegundos en UTC.

date.toString();           // Fecha y hora en formato local.
date.toUTCString();        // Fecha y hora en formato UTC.
date.toISOString();        // Fecha y hora en formato ISO 8601.
date.toDateString();       // Fecha en formato local.
date.toTimeString();       // Hora en formato local.
date.toUTCString();        // Fecha y hora en formato UTC.
date.toLocaleString();     // Fecha y hora en formato local.
date.toLocaleDateString(); // Fecha en formato local.
date.toLocaleTimeString(); // Hora en formato local.

date.valueOf();            // Tiempo en milisegundos desde 1970.

// Setters
date.setFullYear(2024);
date.setMonth(11);
date.setDate(25);
date.setDay(5);
date.setHours(12);
date.setMinutes(0);
date.setSeconds(0);
date.setMilliseconds(0);
date.setTime(0);

date.setUTCFullYear(2024);
date.setUTCMonth(11);
date.setUTCDate(25);
date.setUTCDay(5);
date.setUTCHours(12);
date.setUTCMinutes(0);
date.setUTCSeconds(0);
date.setUTCMilliseconds(0);
```
<br><br><br>

## *[volver al índice](../../README.md)*