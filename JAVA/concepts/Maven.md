# Maven

## 1. ¿Qué es Maven?
Maven es una herramienta de gestión y construcción de proyectos de software. Se basa en el concepto de un proyecto de software y sus dependencias. Maven utiliza un archivo XML llamado `pom.xml` para describir el proyecto y sus dependencias. Maven proporciona una forma de construir proyectos de software de manera consistente y reproducible.
<br><br>

## 2. Instalación:
1. Descargar el binario: [apache-maven-3.9.6-bin](https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip)
2. Extraer el directorio del zip
3. Mover ese directorio a "C:\Program Files"
4. Crear las variables de entorno: `M2_HOME = "C:\Program Files\apache-maven-3.9.6"`
5. Añadirlo al PATH: `%M2_HOME%\bin`
<br><br>

## 3. Comandos:
```bash
mvn compile         #Compila el código fuente del proyecto desde el directorio raíz.
mvn clean           #Limpia el proyecto eliminando el directorio 'target'.
mvn test            #Ejecuta las pruebas unitarias utilizando frameworks como JUnit.
mvn package         #Compila el código fuente, ejecuta pruebas unitarias y empaqueta el resultado en un archivo JAR o WAR.
mvn install         #Realiza el proceso de 'package' e instala el paquete en el repositorio local de Maven.
mvn clean install   #Limpia el proyecto y luego ejecuta 'install'.
mvn clean package   #Limpia el proyecto y luego ejecuta 'package'.
mvn validate        #Verifica que el proyecto sea válido y que todas las dependencias estén disponibles.
mvn verify          #Ejecuta todas las fases hasta 'package' y añade verificaciones adicionales (pruebas de integración y validaciones de rendimiento)
mvn deploy          #Copia el paquete final al repositorio remoto.
```
<br>

## 4. Testing con Maven:
### 4.1. JUnit:
1. Añadir el motor de ejecución para pruebas escritas con la API de JUnit Jupiter en el `pom.xml`:
```xml
<dependency>
    <groupId>org.junit.jupiter</groupId>
    <artifactId>junit-jupiter-engine</artifactId>
    <version>5.9.0</version>
    <scope>test</scope>
</dependency>
```
2. Añadir el plugin de JUnit5 a la versión 2.22.0 en el archivo `pom.xml`:
```xml
<groupId>com.fpmislata</groupId>
<artifactId>maven-surefire-plugin</artifactId>
<version>1.0</version>
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-surefire-plugin</artifactId>
            <!-- JUnit 5 requires Surefire version 2.22.0 or higher -->
            <version>2.22.0</version>
        </plugin>
    </plugins>
</build>
```
<br><br><br>

## *[volver al índice](../../index.md)*