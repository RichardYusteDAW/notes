# Lorenzo Flow

## Pasos
### 1. Actualizar todas las ramas
`git fetch --prune && git switch develop && git merge --ff-only origin/develop && git switch release && git merge --ff-only origin/release && git switch master && git merge --ff-only origin/master`
```bash
git fetch --prune                   # Actualiza todas las ramas y borra las que ya no existen en el remoto
git switch develop                  # Cambia a la rama develop y mergea con el remoto
git merge --ff-only origin/develop 
git switch release                  # Cambia a la rama release y mergea con el remoto
git merge --ff-only origin/release 
git switch master                   # Cambia a la rama master y mergea con el remoto
git merge --ff-only origin/master
```
<br>


### 2. Obtener última versión de la rama develop
```bash
git switch lorenzo_45
git merge --ff-only develop
```
<br>


### 3. Crear microCommits
```bash
git commit -m "micro-commit1"
git commit -m "micro-commit2"
git commit -m "micro-commit3"
git commit -m "micro-commit4"
git push
```
<br>

### 4. Actualizar la rama develop
```bash
git switch develop
git merge --squash lorenzo_45
git commit -am "feat(#45):Crear la pantalla de login"
git push

# Si falla el push
git fetch --prune
git rebase origin/develop
git push

# Eliminar las ramas (local y remoto)
git branch -d lorenzo_45
git push origin --delete lorenzo_45
```
<br><br><br>

## *[volver al índice](../README.md)*