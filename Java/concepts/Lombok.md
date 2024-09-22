# Lombok

## 1. ¿Qué es Lombok?
Lombok es una biblioteca de Java que permite reducir la cantidad de código boilerplate que se necesita escribir en las clases gracias a sus anotaciones.

---
<br>

## 2. Anotaciones:
```java
import lombok.Getter;                  // Getters para todos los atributos.
import lombok.Setter;                  // Setters para todos los atributos.
import lombok.RequiredArgsConstructor; // Genera automáticamente un constructor con todos los atributos que son `final` o `@NonNull`.
import lombok.ToString;                // Genera automáticamente el método `toString()`.
import lombok.EqualsAndHashCode;       // Genera automáticamente los métodos `equals()` y `hashCode()`.
import lombok.Data;                    // Combina las anotaciones `@Getter`, `@Setter`, `@RequiredArgsConstructor`, `@ToString` y `@EqualsAndHashCode`.
import lombok.AllArgsConstructor;      // Genera automáticamente un constructor con todos los atributos.
import lombok.NoArgsConstructor;       // Genera automáticamente un constructor vacío.
import lombok.NonNull;                 // Marca un atributo como no nulo.

@Getter
@Setter
@RequiredArgsConstructor
@ToString
@EqualsAndHashCode
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Persona {
    @NonNull
    private String nombre;
    @NonNull
    private int edad;
}
```
---
<br>

## 3. Dependencia Maven:
```xml
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>1.18.34</version>
    <scope>provided</scope>
</dependency>
```
---
<br><br><br>

## *[volver al índice](../../README.md)*