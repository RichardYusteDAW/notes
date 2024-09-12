# JAVA

## 1º INSTALAR JAVA: 
[https://www.oracle.com/java/technologies/downloads](https://www.oracle.com/java/technologies/downloads)
<br><br>

## 2º CONFIGURAR VARIABLES DE ENTORNO:
BUSCAR >> VARIABLES DE ENTORNO >> RUTA DEL BIN EN ARCHIVOS DE PROGRAMA
```
JAVA_HOME = C:\Program Files\Java\jdk-17
JRE_HOME  = C:\Program Files\Java\jre-1.8
```

Añadir al PATH de Windows: `%JAVA_HOME%\bin`
<br><br>

## 3º COMPILAR Y EJECUTAR:
COMPILA: `javac file.java`  --> crea un archivo: *file.class*  
EJECUTA: `java file`  
EJECUTA COMPILANDO AL VUELO: `java file.java` --> NO crea un archivo: file.class
<br><br>

## DOCUMENTACION JAVA: 
[https://docs.oracle.com/en/java/javase/17/docs/api/](https://docs.oracle.com/en/java/javase/17/docs/api/)
<br><br>

## 5º DECLARACIÓN DE VARIABLES:
```java
boolean a;
byte b;
char c;
double d;
float e;
int f;
long g;
short h;

int a, b, c;    //Declaramos varias variables con el mismo tipo;
int a = 1;      //Se puede declarar y asignar valor en una sola sentencia;
var a = 1;      //Java 10 reconoce el tipo;
```
<br><br>

## 6º CASTEAR VARIABLES:
```java
int a = 1;
float b = (float)a;             //Castea de int a float.
String b = Integer.toString(a); //Castea de int a String --> También se podría con: String.valueOf(a);


String c = "1";			
int d = Integer.parseInt(c);    //Castea de String a int.
```
<br><br>

## 7º PALABRAS RESERVADAS:
```java
abstract    continue    for         new         switch
assert      default     goto        package     synchronized
boolean     do          if          private     this
break       double      implements  protected   throw
byte        else        import      public      throws
case        enum        instanceof  return      transient
catch       extends     int         short       try
char        final       interface   static      void
class       finally     long        strctfp     volatile
const       float       native      super       while
```
<br><br>

## 8º CONSTANTES:
```java
final float PI = 3.14f; //"final" al inicio de la sentencia y la constante en mayúculas;
```
<br><br>

## 9º MOSTRAR POR SALIDA PREDETERMINADA:
```java
System.out.print("Escribe sin salto de línea");
System.out.println("Escribe con salto de línea");
```
<br><br>

## 10º RECOGER DATOS DE ENTRADA:
```java
import java.util.Scanner;
class EntradaSalida {
    public static void main(String[] args) {
        Scanner reader = new Scanner(System.in);
		
		System.out.println("Introduce tu nombre: ");
        String nombre = reader.nextLine();

        System.out.println("Hola, " + nombre + "!");

		reader.close();
    }
}

nextLine()      //Obtiene una nueva línea de entrada.
nextInt()       //Se salta los espacios dejados en blanco hasta que encuentra un valor de tipo int y devuelve ese valor.
nextLong()      //Igual con valores de tipo long.
nextFloat()     //Igual con valores de tipo float.
nextDouble()    //Igual con valores de tipo double.
```
<br><br>

## 11º OPERADORES ARITMETICOS:
```java
+	//suma
-	//resta
*	//multiplicación
/	//división
%	//resto o modulo

+=	//Suma el operando izquierdo con el operando derecho y asigna el resultado a la variable de la izquierda.
–=	//Resta el operando izquierdo con el operando derecho y asigna el resultado a la variable de la izquierda.
*=	//Multiplica el operando izquierdo con el operando derecho y asigna el resultado a la variable de la izquierda.
/=	//Divide el operando izquierdo con el operando derecho y asigna el resultado a la variable de la izquierda.
%=	//Calcula el módulo del operando izquierdo con el operando derecho y asigna el resultado a la variable de la izquierda.
```
<br><br>

## 12º OPERADORES UNARIOS:
```java
-	//Multiplicar el valor por -1.
+	//Multiplica el valor por +1.
++	//Incrementa el valor en una unidad. Si se utiliza delante de la variable, primero aumenta el valor y luego se calcula el resultado. De lo contrario, primero se calcula el resultado y luego se incrementa la variable.
–	//Decrementa el valor en una unidad. Si se utiliza delante de la variable, primero decrementa el valor y luego se calcula el resultado. De lo contrario, primero se calcula el resultado y luego se decrementa la variable.
!	//Niega el valor (usado sobre operadores lógicos).
```
<br><br>

## 13º OPERADORES RELACIONALES:
```java
==	//Devuelve true si los operandos son iguales.
!=	//Devuelve true si los operandos son diferentes.
<	//Devuelve true si el primer operando es menor que el segundo.
>	//Devuelve true si el primer operando es mayor que el segundo.
<=	//Devuelve true si el primer operando es menor o igual que el segundo.
>=	//Devuelve true si el primer operando es mayor o igual que el segundo.
```
<br><br>

## 14º OPERADORES LOGICOS:
```java
&&	//AND lógico.
||	//OR lógico.
!	//NOT lógico.
```
<br><br>

## 15º CONDICIONALES:
```java
//if
if(condition1){
	
} else if (condition2) {
    
} else {
    
}

//switch
switch (key) {
    case value1:
                 
        break;
	case value2:
                 
        break;
         
    default:
        break;
}

//switch con flechas
switch (key) {
	case value1 -> System.out.println("El número es 1");
	case value2 -> System.out.println("El número es 2");
	case value3 -> System.out.println("El número es 3");
	default -> System.out.println("El número no está entre 1 y 10");
}

//ternarios:
condicion ? valor_verdadero : valor_falso;
```
<br><br>

## 16º BUCLES:
```java
//while
while (condition) {
	System.out.println("Hello");
}

//doWhile
do {
	System.out.println("Hello");
} while (condition);

//for
for (int i = 1; i<10; i++) {
	System.out.println(i);
	
	if(i==4){
		continue;
	}
}
```
<br><br>

## 17º FUNCIONES:
```java
//Procedimientos (No devuelven ningún valor):
static void myFunction()		

//Funciones normales (devuelven un valor):
static int add(int number1, int number2) {
	return number1 + number2;
}

//Llamadas de funciones:
add(1,2);

//Variables globales (al principio del código): 
static int resultado = 10;

//Parámetros de longitud variable:
static void showNum(int... numeros) {
	for (int numero : numeros) {
	System.out.println(numero);
	}
}
showNum(1, 2, 3, 4, 5);

//Sobrecarga de métodos (funciones con el mismo nombre pero diferentes parámetros):
static void myFunction(int a) {
	System.out.println("Parámetro de tipo entero");
}

static void myFunction(float a) {
	System.out.println("Parámetro de tipo float");
}

static void myFunction(int a, int b) {
	System.out.println("Dos parámetros de tipo entero");
}

//Recursividad (funciones que se llaman a sí mismas):
static int factorialRecursivo(int number) {
if (number == 1) {
	return 1;
} else {
	return (number * factorialRecursivo(number-1));
}

```
<br><br>

## 18º ARRAYS:
```java
//Declaración:
int[] numbers;
numbers = new int[10];

int[] numbers = new int[10];

int[] numbers = {1, 3, 312, 15, 69, 7, 8, 9, 0, 1};

//Multidimensionales:
int[][] matriz = new int[5][5];

int[][] matriz = {
	{1, 2, 3}, {4, 5, 6}, {7, 8, 9}
};

//Recorrer arrays:
	//Usando un bucle for tradicional:
	for(int i = 0; i < numbers.length; i++) {
		System.out.println(numbers[i]);
	}

	//Usando un bucle for-each
	for(int numero : numbers) {
		System.out.println(numero);
	}

	//Bucles bidimensionales:
	for(int i = 0; i < matriz.length; i++) { // Este bucle recorre las filas
		for(int j = 0; j < matriz[i].length; j++) { // Este bucle recorre las columnas
			System.out.print(matriz[i][j] + " ");
		}
		System.out.println(); // Salto de línea para separar las filas
	}
```
<br><br>

## 19º COLECCIONES:
```java
.size()             //Número de elementos de la colección.
.isEmpty()          //TRUE si la colección está vacía.
.contains(element)  //TRUE si la colección contiene el elemento.
.add(element)       //Añade elementos a la colección.
.remove(element)    //Elimina elementos de la colección.
.toArray()          //Convierte la colección a un array de objetos tipo Object.
.clear()            //Vacía la colección.
```
### CONJUNTOS:
```java
// No admiten duplicados
HashSet<Integer> conjunto = new HashSet<>();
Set<Integer> conjunto = new HashSet<>();

Set<Integer> conjunto = Set.of(2, 10, 3, 23, 99);
```	

### LISTAS:
```java
// Admiten duplicados
List<Integer> lista = new ArrayList<>();
List<Integer> lista = List.of(1, 3, 5, 67);

List<Integer> subList(index, index)	//Genera una sublista (una vista parcial de la lista) con los elementos comprendidos entre la posición inicial (from, incluida) y la posición final (to, no incluida).

.get(index)             //Obtiene un elemento partiendo de su posición (index).
.set(index,element)     //Cambia el elemento almacenado en una posición de la lista (index), por otro (element).
.add(index,element)     //Inserta un elemento (element) en la lista en una posición concreta (index), desplazando los existentes. Si le pasamos solo el elemento (element) la inserción la hará al final de la lista.
.remove(index)          //Elimina un elemento indicando su posición (index) en la lista.
.addAll(index,lista)    //Inserta una colección pasada por parámetro en una posición de la lista, desplazando el resto de elementos.
.indexOf(element)       //Devuelve la posición (índice) de un elemento en la lista o -1 si el elemento no está en la lista.
.lastIndexOf(index)     //Devuelve la última ocurrencia del objeto en la lista (dado que la lista si puede almacenar duplicados) o -1 si el elemento no está en la lista.
```

### MAPAS:
```java
// Clave/valor
Map<String, Integer> diccionario = new HashMap<>();
Map<String, Integer> diccionario = Map.of("edad", 18, "año", 2022);

Set<String> keys = diccionario.keySet(); //Devuelve un conjunto con las claves contenidas en el map.

.put(key,value)         //Asocia el valor (value) con la clave (key) en el map. Si la clave no existe en el map crea un nuevo par clave-valor. Si ya existe, reemplazará el valor.
.get(key)               //Obtiene el valor asociado a una clave (key) ya almacenada en el mapa. Si no existe la clave, retornará null.
.remove(key)            //Elimina la clave (key) y el valor (value) asociado. Retorna el valor asociado a la clave, o null, si la clave no existe.
.containsKey(key)       //Devuelve true si el map tiene almacenada la clave (key).
.containsValue(value)   //Devuelve true si el map tiene almacenada el valor (value).
.size()                 //Devuelve el número de pares clave-valor almacenado en el map.
.isEmpty()              //Devuelve true si el map está vacío.
.clear()                //Vacía el map.		
```
<br><br>

## 20º CLASES:
```java
//El nombre de la clase debe empezar por mayúscula y tener el mismo nombre que el archivo.

//Las clases en JAVA solo pueden ser public o package:
public class Clase {
	// ...
}

//Las PROPIEDADES y los MÉTODOS de las clases pueden ser public, private, package o protected:
public class Clase {
	public	  int propiedad; //Es accesible desde cualquier clase.
	private   int propiedad; //Es accesible solo desde dentro de la clase.
	package   int propiedad; //Solo es accesible a nivel de paquete.
	protected int propiedad; //Solo es accesible desde las clases hijas. También lo es desde la propia clase.
	
	public void metodo() {
		// ...
	}
	
	private void metodo() {
		// ...
	}
	
	package void metodo() {
		// ...
	}
	
	protected void metodo() {
		// ...
	}
}

//El CONSTRUCTOR es un método que posee la clase que se iniciará al crear una nueva instancia de dicha clase:
public class Clase {
	public Clase(){
		System.out.println("Acabas de instanciar la clase");
	}
}

//Getters y Setters:
public class Persona {
	private String nombre;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre; //this se utiliza para referirse al nombre de la PROPIEDAD cuando el PARÁMETRO se llama igual.
	}
}
```
<br><br>

## 21º OBJETOS:
```java
//Creación:
Clase objeto = new Clase();

//Llamar y setear propiedades (tienen que ser públicas las propiedades):
objeto.nombre = "Pepe";
System.out.println(objeto.nombre);

//Llamar y setear a través de getters y setters (cuando las propiedades no son públicas):
objeto.setNombre("Pepe");
objeto.getNombre();

//static: Se pueden llamar a métodos sin la necesidad de instanciar la clase:
public class Calculadora {
	private static int a = 1;
	private static int b = 2;
	
	public static int suma() { //Un método static solo podrá acceder a las propiedades si son estáticas
		return a + b;
	}
}
System.out.println(Calculadora.suma());
```
<br><br>

## 22º HERENCIA (es un ...):
```java
public class Coche extends Vehiculo{ //extends se utiliza para que el hijo herede las propiedades y los métodos del padre.
	public Coche(String marca, String modelo, int velocidad, float[] presionRuedas) {
		
		super(marca, modelo, velocidad, presionRuedas); //super() llama al constructor del padre.
		super.acelerar(); //super. se utiliza para llamar a una propiedad o un método del padre.
		
		acelerar(){ //Este método sobreescribiría el método del padre.
			velocidad ++;
		}
	} 
}
```
<br><br>

## 23º POLIMORFISMO:
```java
Vehiculo coche = new Coche(); //Puedes asignar una instancia de una subclase a una referencia de su superclase.
```
<br><br>
	
## 24º COMPOSICIÓN (tiene un ...):
```java
class Motor{
	//...
}
class Coche{ //La clase Coche está compuesta por otra clase (Motor).
	private Motor motor;
	
	Coche(){
		motor = new Motor();
	}
}
```
<br><br>

## 25º ENUMERADOS:
```java
enum MarcasCoche {
	SEAT, FORD, RENAULT, PEUGEOT, CITROEN
}

class Main {
	public static void main(String[] args) {
		System.out.println(MarcasCoche.SEAT);
	}
}
```
### ENUMERADOS CON PROPIEDADES:
```java
enum MarcasCoche {
	SEAT("Ibiza"), 
	FORD("Fiesta"), 
	RENAULT("Clio"), 
	PEUGEOT("208"), 
	CITROEN("C3");
	
	private String modelo;
	
	MarcasCoche(String modelo){
		this.modelo = modelo;
	}
	
	public String getModelo(){
		return modelo;
	}
}

class Main {
	public static void main(String[] args) {
		System.out.println(MarcasCoche.SEAT.getModelo());
	}
}
```
<br><br>

## 26º LIBRERIAS:
```java
import java.util.Scanner; //Importa la clase Scanner de la librería java.util.
import java.util.*;       //Importa todas las clases de la librería java.util.
```
Las utlizamos de la siguiente manera:
```java
Scanner reader = new Scanner(System.in);
java.util.Scanner scanner = new java.util.Scanner(System.in); //Si no importamos la librería.
```
<br><br>

## 27º CLASES ABSTRACTAS:
```java
abstract class Vehiculo { //Clase abstracta que no se puede instanciar.
	abstract void acelerar(); //Método abstracto que no tiene cuerpo.

	void frenar() { //Método normal.
		System.out.println("Frenando el vehículo");
	}
}

class Coche extends Vehiculo { //Si heredamos de una clase abstracta, estamos obligados a implementar sus métodos abstractos.
	void acelerar() {
		System.out.println("Acelerando el coche");
	}

	void frenar() { //Sobreescribimos el método frenar aunque no sea obligatorio.
		System.out.println("Frenando el coche");
	}
}
```
<br><br>

## 28º INTERFACES:
```java
interface Vehiculo { //Las interfaces no se pueden instanciar.
	void acelerar(); //Los métodos de una interfaz no tienen cuerpo.
	void frenar();
}

class Coche implements Vehiculo { //Si implementamos una interfaz, estamos obligados a implementar sus métodos.
	public void acelerar() {
		System.out.println("Acelerando el coche");
	}
	
	public void frenar() { 
		System.out.println("Frenando el coche");
	}
}
```
<br><br>

## 29º INYECCIÓN DE DEPENDENCIAS:
```java
class Motor{
	//...
}

class Coche{ 
	private Motor motor; //No se instancia la clase Motor.
	
	Coche(Motor motor){ //Se inyecta la dependencia Motor.
		this.motor = motor;
	}
}

class Main {
	public static void main(String[] args) {
		Motor motor = new Motor();
		Coche coche = new Coche(motor);
	}
}
```
<br><br>

## 30º INVERSIÓN DE CONTROL:
```java
class Motor{
	//...
}

class Coche{ 
	private Motor motor; //No se instancia la clase Motor.
	
	Coche(){ //Se inyecta la dependencia Motor a través de un contenedor IoC.
		this.motor = CocheIoCContainer.getMotor();
	}
}

class CocheIoCContainer{
	private static Motor motor = new Motor();

	public static Coche getCoche(){
		return new Coche(motor);
	}
}
```
<br><br>

## 31º PROGRAMACIÓN FUNCIONAL:
### FUNCIONES LAMBDA:
```java
(parametros) -> { cuerpo de la función }
```

### INTERFACES FUNCIONALES:
```java
// Son interfaces que tienen un único método abstracto.
@FunctionalInterface
interface Operacion {
	int calcular(int a, int b);
}

class Main {
	public static void main(String[] args) {
		Operacion suma = (a, b) -> a + b;
		System.out.println(suma.calcular(1, 2));
	}
}

// Interfaces funcionales predefinidas:
Consumer<T>     //Acepta un argumento  -> NO devuelve nada.
Predicate<T>    //Acepta un argumento  -> devuelve un booleano.
Function<T, R>  //Acepta un argumento  -> devuelve un resultado.
Supplier<T>     //NO acepta argumentos -> devuelve un resultado.
```

### CLASE STREAM:
- Es una secuencia de elementos que soporta operaciones secuenciales y paralelas
- Métodos:
```java
List<String> lista = Arrays.asList("uno", "dos", "tres", "cuatro", "cinco");

// Intermedios:
Stream<String> listaFiltrada = lista.stream().filter(s -> s.length() > 3);       //Filter:    Filtra los elementos de la lista.
Stream<String> listaOrdenada = lista.stream().sorted();                          //Sorted:    Ordena los elementos de la lista.
Stream<String> listaMapeada = lista.stream().map(s -> s.toUpperCase());          //Map:       Transforma los elementos de la lista.
Stream<String> listaLimitada = lista.stream().limit(2);                          //Limit:     Limita el número de elementos de la lista.
Stream<String> listaSaltada = lista.stream().skip(2);                            //Skip:      Salta los primeros elementos de la lista.

// Terminales:
lista.stream().forEach(s -> System.out.println(s));                            //ForEach:   Ejecuta una acción para cada elemento de la lista.
List<String> listaFinal = lista.stream().toList();                             //ToList:    Convierte la lista en una lista. 
String[] array = lista.stream().toArray(String[]::new);                        //ToArray:   Convierte la lista en un array.
long  cantidad = lista.stream().count();                                       //Count:     Devuelve el número de elementos de la lista.
Optional<String> listaReducida = lista.stream().reduce((s1, s2) -> s1 + s2);   //Reduce:    Reduce los elementos de la lista a un solo valor.
Optional<String> primero = lista.stream().findFirst();                         //FindFirst: Devuelve el primer elemento de la lista.
Optional<String> ultimo = lista.stream().findAny();                            //FindAny:   Devuelve cualquier elemento de la lista.
boolean existe = lista.stream().anyMatch(s -> s.startsWith("c"));              //AnyMatch:  Devuelve true si algún elemento cumple la condición.
boolean todos = lista.stream().allMatch(s -> s.length() > 3);                  //AllMatch:  Devuelve true si todos los elementos cumplen la condición.
boolean ninguno = lista.stream().noneMatch(s -> s.startsWith("c"));            //NoneMatch: Devuelve true si ningún elemento cumple la condición.
```

### CLASE OPTIONAL:
- Es un contenedor que puede o no contener un valor.
- Métodos:
```java
Optional<String> optional = Optional.of("Hola");              //Crea un Optional con un valor.
Optional<String> optional = Optional.ofNullable(null);        //Crea un Optional con un valor que puede ser nulo.
Optional<String> optional = Optional.empty();                 //Crea un Optional vacío.

boolean presente = optional.isPresent();                      //Devuelve true si el valor está presente.
optional.ifPresent(s -> System.out.println(s));               //Ejecuta una acción si el valor está presente.
String valor = optional.orElse("Valor por defecto");          //Devuelve el valor si existe, si no, devuelve el valor por defecto.
String valor = optional.orElseGet(() -> "Valor por defecto"); //Devuelve el valor si existe, si no, devuelve el valor por defecto.
String valor = optional.orElseThrow(() -> new Exception());   //Devuelve el valor si existe, si no, lanza una excepción.
String valor = optional.get();                                //Devuelve el valor si existe, si no, lanza una excepción.
```
<br><br><br>

## *[volver al índice](../../index.md)*