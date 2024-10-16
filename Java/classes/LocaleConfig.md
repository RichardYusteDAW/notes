# LocaleConfig

## 1. ¿Qué es LocaleConfig?
Es una clase personalizada que extiende de `WebMvcConfigurer` y se utiliza para configurar la internacionalización en una aplicación Spring Boot.

---
<br>

## 2. Ejemplo de uso:
- `LocaleResolver`: Configura el idioma predeterminado.
- `LocaleChangeInterceptor`: Configura el interceptor de cambio de idioma.
- `addInterceptors`: Agrega el interceptor de cambio de idioma.
```java
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

import java.util.Locale;

@Configuration
public class LocaleConfig implements WebMvcConfigurer{

    @Bean // Configura el idioma predeterminado
    public LocaleResolver localeResolver() {
        AcceptHeaderLocaleResolver localeResolver = new AcceptHeaderLocaleResolver();
        localeResolver.setDefaultLocale(Locale.of("es"));
        return localeResolver;
    }

    @Bean // Configura el interceptor de cambio de idioma
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("Accept-Language");
        return localeChangeInterceptor;
    }

    @Override // Agrega el interceptor de cambio de idioma
    public void addInterceptors(InterceptorRegistry registry) {
        // registry.addInterceptor(localeChangeInterceptor());
        registry.addInterceptor(new CustomLocaleChangeInterceptor()); // Interceptor personalizado
    }
}
```
---
<br>

## 3. Interceptor personalizado:
```java
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

import java.util.Locale;

public class CustomLocaleChangeInterceptor extends LocaleChangeInterceptor {

    @Value("${spring.mvc.locale}")
    private String defaultLocale;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {
        String lang = request.getHeader("Accept-Language"); // Obtiene el idioma del header
        // String lang = request.getParameter("locale");    // Obtiene el idioma de la url
        Locale locale = lang != null ? Locale.forLanguageTag(lang) : Locale.getDefault();
        
        // Establece el idioma actual en un hilo local a través de una clase personalizada.
        LanguageUtils.setCurrentLocale(locale);
        
        // Llama al método preHandle de la superclase para continuar con la ejecución del interceptor.
        return super.preHandle(request, response, handler);
    }
}
```
---
<br>

## 4. LanguageUtils:
```java
import java.util.Locale;

public class LanguageUtils {

    private static final ThreadLocal<Locale> currentLocale = new ThreadLocal<>();

    public static String getCurrentLocale() {
        return currentLocale.get().getLanguage();
    }

    public static void setCurrentLocale(Locale locale) {
        currentLocale.set(locale);
    }
}
```
---

<br><br><br>

## *[volver al índice](../../README.md)*