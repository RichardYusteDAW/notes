# GitHub Actions

## 1. ¿Qué es GitHub Actions?
GitHub Actions es una herramienta de CI/CD (Continuous Integration/Continuous Deployment) que permite automatizar tareas de desarrollo de software. GitHub Actions se basa en flujos de trabajo (workflows) que se definen en archivos YAML. Estos flujos de trabajo se pueden configurar para ejecutarse en respuesta a eventos específicos en el repositorio de GitHub.
<br><br>

## 2. Crear un flujo de trabajo (workflow):
- Main Page -> Actions -> Java with Maven -> Configure

- Esta acción crea un archivo YAML en la carpeta .github/workflows/ con el siguiente contenido:
```yaml
# Nombre del Workflow
name: Test Java with Maven

# El evento se desencadena cuando se realiza un push o un pull request en la rama main
on:
  workflow_dispatch:               # workflow_dispatch: Evento que se desencadena manualmente
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:                              # jobs: Trabajos que se ejecutarán
  test:                            # test: es el nombre del trabajo (podría ser cualquier nombre)
    runs-on: ubuntu-latest         # runs-on: espcifica el entorno en el que se ejecutará el trabajo
    steps:                         # steps: Pasos que se ejecutarán en el trabajo
    - uses: actions/checkout@v4    # uses: Acción que se va a ejecutar (clonar el repositorio)
    - name: Set up JDK 17          # name: Nombre del 1º paso
      uses: actions/setup-java@v3  # uses: Acción que se va a ejecutar (configurar la versión de Java)
      with:                        # with: Parámetros de la acción
        java-version: '17'         # Versión de Java
        distribution: 'temurin'    # Distribución de Java
        cache: maven               # Caché de Maven
    - name: Verify with Maven      # name: Nombre del 2º paso
      run: mvn --batch-mode --update-snapshots verify   # run: Comando que se va a ejecutar (ejecutar Maven)
```
<br><br>

## 3. Ejecutar un flujo de trabajo (workflow):
- Main Page -> Actions -> Test Java with Maven -> Run workflow

***Solo se verá el workflow si se ha realizado un push o un pull request en la rama main.*
<br><br><br>

## *[volver al índice](../index.md)*