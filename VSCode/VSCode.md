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
<br><br>

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


<br><br><br>

## *[volver al índice](../index.md)*