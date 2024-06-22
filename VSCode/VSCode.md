# VISUAL STUDIO CODE

## 1. Extensions
### 1.1. Guardar
- Con PowerShell o Bash:
```
code --list-extensions > extensions.txt
```
### 1.2. Instalar
- Con PowerShell:
```powershell
cat extensions.txt | % { code --install-extension $_ }
# Forma larga:
# Get-Content extensions.txt | ForEach-Object { code --install-extension $_ }
```

- Con Bash:
```bash
cat extensions.txt | xargs -L 1 code --install-extension
```
---
<br>

## 2. Snippets
- Los snippets son fragmentos de código que se pueden insertar en el editor mediante una combinación de teclas.

### 2.1. Crear snippets
1. Ir a `Archivo` > `Preferencias` > `Fragmentos de código del usuario`.
2. Seleccionar el lenguaje en el que se quiere crear el snippet.
3. Crear un nuevo snippet o editar uno existente.
4. Guardar el archivo.

### 2.2. Sintanxis
```json
{
    "Print": {                                           // Nombre del snippet
        "prefix": "print",                               // Palabra clave que se debe escribir para que aparezca el snippet
        "description": "Print statement",                // Descripción
        "body": [                                        // Cuerpo del snippet
            "System.out.println(\"${1:Hello World}\");"  // Fragmento de código
        ]
    }
}
```

### 2.3 Opciones
- `${1:variable}`: Selecciona la variable 1.
- `${1:variable|valor1,valor2,valor3}`: Selecciona la variable 1 y muestra los valores que puede tomar.
- `${1|valor1,valor2,valor3}`: Muestra los valores que puede tomar la variable 1.
- `${1:variable}${2:variable}`: Selecciona la variable 1 y luego la variable 2.
---
<br>

## 3. Atajos de teclado
|  **Acción**                        | **Shortcout**                |
|------------------------------------|------------------------------|
|  Abrir pestana                     |  `Ctrl + Shif + T`           |
|  Cerrar pestana                    |  `Ctrl + W`                  |
|  Moverse entre pestañas            |  `Ctrl + Tab`                |
|  Abrir/Cerrar barra lateral        |  `Ctrl + B`                  |
|  Abrir/Cerrar terminal             |  `Ctrl + Ñ`                  |
|  Abrir/Cerrar paleta de comandos   |  `Ctrl + Shift + P`          |
|  Buscar en archivos                |  `Ctrl + P`                  |
|  Puntero múltiple                  |  `Ctrl + Alt + Arriba/Abajo` |
|------------------------------------|------------------------------|
|  **SELECTOR**                      |  **SELECTOR**                |
|  Selección múltiple                |  `Alt + Click`               |
|  Selección múltiple al final       |  `Ctrl + Doble Click`        |
|  Seleccionar todas las ocurrencias |  `Ctrl + Shift + L`          |
|  Seleccionar todas las ocurrencias |  `Ctrl + D`                  |
|  Seleccionar letra por letra       |  `Shift + Flechas`           |
|  Seleccionar palabra               |  `Ctrl + Shift + Flechas`    |
|  Seleccionar línea                 |  `Ctrl + L`                  |
|  Mover entre palabras              |  `Ctrl + Flechas`            |
|  Mover al principio de la línea    |  `Fn + Inicio`               |
|  Mover al final de la línea        |  `Fn + Fin`                  |
|  Ordenar líneas                    |  `Ctrl + Shift + P` -> order |
|------------------------------------|------------------------------|
|  **COMENTARIO**                    |  **COMENTARIO**              |
|  Comentar línea                    |  `Ctrl + K + C`              |
|  Descomentar línea                 |  `Ctrl + K + U`              |
|  Comentar/descomentar línea        |  `Ctrl + Ç`                  |
|  Comentar bloque                   |  `Shift + Alt + A`           |
|------------------------------------|------------------------------|
|  **EMMET WRAP**                    |  **EMMET WRAP**              |
|  div.class>p>span                  |  `Ctrl + Shift + P` -> wrap  |

<br><br><br>

## *[volver al índice](../index.md)*