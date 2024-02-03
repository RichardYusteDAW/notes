# Instalar MAVEN
1. Descargar el binario: [apache-maven-3.9.6-bin](https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip)
2. Extraer el directorio del zip
3. Mover ese directorio a "C:\Program Files"
4. Crear las variables de entorno: `M2_HOME = "C:\Program Files\apache-maven-3.9.6"`
5. Añadirlo al PATH: `%M2_HOME%\bin`
6. Comandos Maven:
```bash
mvn compile         #Compila el código fuente del proyecto desde el directorio raíz.
mvn clean           #Limpia el proyecto eliminando el directorio 'target'.
mvn test            #Ejecuta las pruebas unitarias utilizando frameworks como JUnit.
mvn package         #Compila el código fuente, ejecuta pruebas y empaqueta el resultado en un archivo JAR o WAR.
mvn install         #Realiza el proceso de 'package' e instala el paquete en el repositorio local de Maven.
mvn clean install   #Limpia el proyecto y luego ejecuta 'install'.
mvn clean package   #Limpia el proyecto y luego ejecuta 'package'.
mvn validate        #Verifica si el proyecto es correcto y toda la información necesaria está disponible.
mvn deploy          #Copia el paquete final al repositorio remoto.
```
<br>
<br><br><br>

## *[volver al índice](../index.md)*