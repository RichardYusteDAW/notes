# String()

## Métodos:
```java
.length()                       //Devuelve la cantidad de caracteres cadena.
.charAt(int i)                  //Devuelve el carácter en la posición i (la primera posición es la 0).
.substring(int i, int j)        //Devuelve la subcadena desde el carácter en la posición i hasta la posición j. (Si no se pasa el parámetro j, se devuelve la subcadena hasta el final de la cadena)
.indexOf(String s, int i)       //Devuelve el índice de la primera aparición de la subcadena s empezando por el índice i especificado. (Si no se pasa el parámetro i, empieza por el principio de la cadena)
.toUpperCase()/toLowerCase()    //Devuelve la cadena con todas las letras en mayúsculas/minúsculas.
.equals()                       //Compara dos cadenas y devuelve true si son iguales o false en caso contrario.
.trim()                         //Elimina los espacios en blanco.
.replace()                      //Reemplaza todos los caracteres de una cadena por otro carácter.
.split()                        //Divide una cadena en subcadenas.				

String saludo = "Hola mundo";
String saludo2 = "   Hola mundo   ";

saludo.length()                 //10
saludo.charAt(3)                //a
saludo.substring(0,4)           //Hola
saludo.indexOf("mundo")         //5
saludo.toUpperCase()            //HOLA MUNDO
saludo.equals(saludo2)          //false 
saludo2.trim()                  //Hola mundo
saludo.replace('o', 'a')        //Hala munda
saludo.split(" ")[0]            //Hola
saludo.split(" ")[1]            //mundo
```

## Especificadores de formato:
```java
d       //Número entero decimal.
f       //Número decimal con coma flotante.
e       //Número decimal con coma flotante en notación científica.
g       //Número decimal con coma flotante, en notación decimal o científica según sea necesario.
s       //Cadena de texto.
b       //Booleano.
c       //Caracter.
x       //Número entero hexadecimal.
o       //Número entero octal.
t       //fecha

String.format("%d", 10)         //10
String.format("%f", 10.5)       //10.500000
String.format("%e", 10.5)       //1.050000e+01
String.format("%g", 10.5)       //10.5
String.format("%s", "Hola")     //Hola
String.format("%b", true)       //true
String.format("%c", 'a')        //a
String.format("%x", 10)         //a
String.format("%o", 10)         //12

Date fecha = new Date();
String.format("%tD", fecha)	//2023-11-05

//Fomatos de fecha:
%tA     //Día de la semana en formato completo.
%tB     //Mes en formato completo.
%tC     //Año con cuatro dígitos.
%tD     //Fecha en formato dd/MM/yyyy.
%tE     //Día de la semana en formato abreviado.
%tF     //Fecha y hora en formato dd/MM/yyyy HH:mm:ss.
%tH     //Hora en formato de 24 horas.
%tI     //Hora en formato de 12 horas.
%tM     //Minutos.
%tS     //Segundos.
%tT     //Fecha y hora en formato HH:mm:ss.
%tY     //Año con dos dígitos.

//FLAGS:
-:      //Alineación a la izquierda.
.:      //Mostrarán decimales.
+:      //Mostrará el signo del número, incluso si es positivo.
0:      //Espacios vacíos se rellenarán con ceros.
,:      //Mostrarán los separadores de miles.
#:      //Mostrarán los ceros a la izquierda de los números enteros.
"'":    //Los caracteres se mostrarán entre comillas simples.

String.format("%-10d", 10)      //10
String.format("%.2f", 10.5)     //10.50
String.format("%+d", 10)        //+10
String.format("%010d", 10)      //0000000010
String.format("%,d", 1000000)   //1,000,000
String.format("%#d", 10)        //00010
String.format("'%s'", "Hola")   //'Hola'
```

### Colores:
```java
static String blue = "\u001B[34m";
static String green = "\u001B[32m";
static String red = "\u001B[31m";
static String resetColor = "\u001B[0m";
```
<br><br><br>

## *[volver al índice](../index.md)*