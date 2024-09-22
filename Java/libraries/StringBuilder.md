# StringBuilder()

## Métodos:
```java
.append()                               //Añade texto al final.
.insert(int offset, …)                  //Inserta texto en la posición especificada.
.delete(int start, int end)             //Elimina caracteres desde la posición start hasta end.
.deleteCharAt(int i)                    //Elimina el carácter en la posición especificada.
.replace(int start, int end, String s)  //Reemplaza una subcadena por otra cadena.
.toString()                             //Convierte el StringBuilder en un String.
.length()                               //Devuelve la longitud del contenido.
.capacity()                             //Devuelve la capacidad total.
.setLength(int newLength)               //Establece una nueva longitud.
.charAt(int i)                          //Devuelve el carácter en la posición especificada.
.setCharAt(int i, char ch)              //Establece un carácter en la posición dada.
.substring(int start, int end)          //Devuelve una subcadena.

StringBuilder sb = new StringBuilder("Hola mundo");

sb.append("!!!")                        //Hola mundo!!!
sb.insert(5, "planeta ")                //Hola planeta mundo!!!
sb.delete(5, 12)                        //Hola mundo!!!
sb.deleteCharAt(4)                      //Holamundo!!!
sb.replace(4, 9, " planeta")            //Hola planeta!!!
sb.toString()                           //"Hola planeta!!!"
sb.length()                             //15
sb.capacity()                           //32 (depende de las operaciones realizadas)
sb.setLength(10)                        //Hola plane
sb.charAt(3)                            //a
sb.setCharAt(3, 'p')                    //Holp plane
sb.substring(1, 5)                      //olp 	
```
<br><br><br>

## *[volver al índice](../../README.md)*