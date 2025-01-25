# Spring Boot Starter Validation

## 1. ¿Qué es? 🤔
Spring Boot Starter Validation es una dependencia de Spring Boot que proporciona soporte para la validación de datos en aplicaciones web.

---
<br>

## 2. Dependencia: 📦
```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-validation</artifactId>
</dependency>
```
---
<br>

## 3. Anotaciones de Validación: 📝
- Todas las anotaciones poseen la opción `.List` (por ejemplo, `@Null.List`), que permite definir múltiples instancias de la misma anotación sobre un único elemento.
- [Ver Todas](https://jakarta.ee/specifications/bean-validation/3.0/apidocs/jakarta/validation/constraints/package-summary)

| Anotación          | Descripción                                                                              |
|--------------------|------------------------------------------------------------------------------------------|
| `@AssertFalse`     | El elemento anotado debe ser falso.                                                      |
| `@AssertTrue`      | El elemento anotado debe ser verdadero.                                                  |
| `@DecimalMax`      | El elemento anotado debe ser un número menor o igual al máximo especificado.             |
| `@DecimalMin`      | El elemento anotado debe ser un número mayor o igual al mínimo especificado.             |
| `@Digits`          | El elemento anotado debe ser un número dentro del rango aceptado.                        |
| `@Email`           | La cadena debe ser una dirección de correo electrónico bien formada.                     |
| `@Future`          | El elemento anotado debe ser una fecha u hora futura.                                    |
| `@FutureOrPresent` | El elemento anotado debe ser una fecha u hora en el presente o futuro.                   |
| `@Max`             | El elemento anotado debe ser un número menor o igual al máximo especificado.             |
| `@Min`             | El elemento anotado debe ser un número mayor o igual al mínimo especificado.             |
| `@Negative`        | El elemento anotado debe ser un número estrictamente negativo.                           |
| `@NegativeOrZero`  | El elemento anotado debe ser un número negativo o 0.                                     |
| `@NotBlank`        | El elemento anotado no debe ser nulo y debe contener al menos un carácter no blanco.     |
| `@NotEmpty`        | El elemento anotado no debe ser nulo ni vacío.                                           |
| `@NotNull`         | El elemento anotado no debe ser nulo.                                                    |
| `@Null`            | El elemento anotado debe ser nulo.                                                       |
| `@Past`            | El elemento anotado debe ser una fecha u hora pasada.                                    |
| `@PastOrPresent`   | El elemento anotado debe ser una fecha u hora en el pasado o presente.                   |
| `@Pattern`         | La secuencia de caracteres anotada debe coincidir con la expresión regular especificada. |
| `@Positive`        | El elemento anotado debe ser un número estrictamente positivo.                           |
| `@PositiveOrZero`  | El elemento anotado debe ser un número positivo o 0.                                     |
| `@Size`            | El tamaño del elemento anotado debe estar entre los límites especificados (incluidos).   |
---
<br>

## 4. Personalizadas: 🎨
```java
// YearValidator.java

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

// La interfaz 'ConstraintValidator' recibe 2 parámetros: la ANOTACIÓN personalizada y el TIPO de dato a validar.
public class YearValidator implements ConstraintValidator<ValidYear, Integer> {
    @Override
    public void initialize(ValidYear constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation); // (Opcional) Llamada al método de la superclase por si tuviera lógica de inicialización.
    }

    // isValid recibe 2 parámetros: el valor a validar y el contexto de validación.
    @Override
    public boolean isValid(Integer year, ConstraintValidatorContext context) {
        return (year == null || (year >= 1850 && year <= 9999));
    }
}
```
```java
// ValidYear.java

import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD, ElementType.FIELD})                  // Indica dónde puede aplicarse la anotación (métodos y campos).
@Retention(RetentionPolicy.RUNTIME)                               // Hace que la anotación esté disponible en tiempo de ejecución.
@Constraint(validatedBy = YearValidator.class)                    // Vincula esta anotación con la clase 'YearValidator'.
public @interface ValidYear {
    String message() default "El año debe ser posterior a 1850";  // Mensaje predeterminado si la validación falla.

    Class<?>[] groups() default {};                               // Define grupos de validación para aplicar la anotación.

    Class<? extends Payload>[] payload() default {};              // Usado para proporcionar metadatos adicionales o contexto a la validación.
}
```
```java
// Director.java

public class Director {
    @Nullable
    Integer id;

    @NotBlank(message = "El nombre no puede estar vacío")
    private String name;

    // value: indica el máximo valor con decimales permitido.
    @DecimalMax(value = "99999.99", message = "El salario debe ser menor o igual a 99999.99")
    private Double salary;

    // integer y fraction: indica el número máximo de dígitos enteros y el número máximo de dígitos decimales.
    @Digits(integer = 6, fraction = 0, message = "El número de identificación debe tener hasta 6 dígitos y ningún decimal")
    private String employeeId;

    @Email(message = "Debe ser una dirección de correo electrónico válida")
    private String email;

    // value: indica el valor mínimo permitido.
    @Min(value = 5, message = "Los años de experiencia deben ser al menos 5")
    private Integer experienceYears;

    // min y max: indica el valor mínimo permitido y el valor máximo permitido.
    @Size(min = 10, max = 1000, message = "La biografía debe tener entre 10 y 1000 caracteres")
    private String biography;

    // anotación personalizada (Si la validación evalúa varios campos se debe colocar sobre la clase).
    @ValidYear
    private Integer birthYear;
}
```
---
<br><br><br>

## *[volver al índice](../../README.md)*