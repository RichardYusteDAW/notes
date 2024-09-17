# GIT

## Instalar GIT:
[https://git-scm.com/downloads](https://git-scm.com/downloads)
<br>

## Comprobar version:
```bash
git --version
```
<br>

## Configuración:
```bash
~/.gitconfig                    #Archivo de configuración global de tu usuario.
[user]
	name  = <Your Name>
	email = <your email>
[alias]
	lg1 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset)%C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'
	lg2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset)%C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''%C(white)%s%C(reset) %C(dim white)- %an%C(reset)'
	lg  = !"git lg1"
	lga = !"git lg --all"

git config --global user.name "Usuario"
git config --global user.email "user@hotmail.com"
git config --global http.proxy http://172.16.0.9:8080
git config --global https.proxy http://172.16.0.9:8080
git config --list

~/directory/.git/config         #Archivo de configuración local de tu usuario.
git config --local user.name "Usuario"
git config --local user.email "user@hotmail.com"
git config --local --list
```
<br>


## WORKING DIR >>> STAGING AREA >>> LOCAL REPOSITORY:
```bash
.git/                           #Directorio que contiene el Repositorio Local.
.gitignore                      #Archivo que especifica qué archivos queremos que Git ignore.
	
git init                        #Inicia el repo.
git restore <file>              #Descarta los cambios del WORKING DIR.
git status                      #Muestra el estado del repo.

git add <file>                  #Añade los archivos al STAGING.
git restore --cached <file>     #Descarta los cambios del STAGING.
git rm --catched <file>		    #Elimina el archivo del STAGING.

git commit -m "Commit inicial"  #Pasa los archivos del STAGING al REPOSITORIO.
git commit -am "mensaje"        #Añade y hace commit en un solo paso.
git log                         #Lista los commits.

git diff                        #Muestra los cambios realizados en el WORKING DIR.
git diff <file>                 #Muestra los cambios realizados en el archivo.
git diff <ref>                  #Muestra los cambios realizados en un commit o etiqueta.
git diff --staged               #Muestra los cambios realizados en el STAGING.

git reset --soft <hash>         #Elmina todos los commits posteriores y los cambios se conservan en el STAGING AREA.
git reset --mixed <hash>        #Elmina todos los commits posteriores y los cambios se conservan en el WORKING DIRECTORY.
git reset --hard <hash>         #Elmina todos los commits posteriores y NO conserva los cambios.
--keep                          #No permite realizar el reset en caso de conflicto.

git commit --amend              #Arregla el último commit. (-m para crear un mensaje nuevo)

git revert <hash>               #Revierte los cambios de un commit creando uno nuevo.
git revert --continue           #Continua con el revert tras resolver los conflictos.
git revert -n HEAD~3..HEAD      #Revertirá un rango de commit (desde el HEAD 3 hacia atrás) y no creará ningún commit con -n.
```
<br>

		
## Repositorio remoto:
### HTTPS (Pide user y password):
```bash
git clone "https://github.com/usuario/repositorio.git"
```
### SSH (Settings >> SSH Key (pegar clave pública)):
```bash
git clone "git@github.com:usuario/repositorio.git"
	#Si no poseees clave SSH:
	ssh-keygen -t ed25519 -C "user@hotmail.com" -f ruta/nombre
		#A veces hay que añadir la clave en Windows manualmente:
		eval $(ssh-agent -s)
		ssh-add /c/Users/usuario/.ssh/id_rsa
```
### Enlazar con el repositorio remoto:
```bash
git remote add origin "git@github.com:usuario/repositorio.git"
git remote -v                   #Muestra los repositorios remotos.
git remote set-url origin "git@github.com:usuario/repositorio.git"
```
### Subir y descargar código:
```bash
git push origin main            #Subir. (con la opción -f --force fuerzas la subida).
git pull origin main            #Descargar.
git fetch origin main           #Obtiene los cambios del repo remoto pero no actualiza.
```
<br>

	
## Ramas:
```bash
git branch <$rama>              #Creamos una rama nueva.
git branch -d <$rama>           #Elimina la rama en local.
git branch -a                   #Lista todas las ramas.
git branch -m <$rama>           #Renombra la rama, pero si existe una rama con ese nombre avisará.
git branch -M <$rama>           #Renombra la rama, pero si existe una rama con ese nombre la sobrescribirá (git branch -m -f).

git checkout <$rama>            #Nos cambiamos de rama.
git switch <$rama>              #Nos cambiamos de rama.
git checkout -b <$rama>         #Crea una rama nueva y nos cambiamos a ella.

git push -u origin <$rama>      #Publica la rama nueva (--set-upstream).
git push origin -d <$rama>      #Elimina la rama en remoto.

git merge <$rama>               #Une el codigo de la nueva rama a la main.
git merge --squash <$rama>      #Une toda una rama en un solo commit.
git merge --abort               #Aborta la fusión en caso de conflictos.
git branch --merged             #Lista todas las ramas x unir.

git rebase <$rama>              #Rebasa la rama indicada.
git rebase --abort              #Aborta el rebase en caso de conflictos.
--continue                      #Para continuar con el commit o con rebase en caso de conflictos.

git cherry-pick	<hash>          #Añade al siguiente commit un commit ya existente.
```
<br>

## Etiquetas:
```bash
git tag                         #Muestra todas las etiquetas.
git tag -l "Inici*"             #Muestra todas las etiquetas que empiecen por Inici.
git tag	<$tag>                  #Crea una nueva etiqueta.
git tag <$tag> <hash>           #Crea una nueva etiqueta en el commit concreto.
git tag	<$tag> -f               #Permite poner el nombre a la etiqueta aunque ya exista.
git show <$tag>                 #Muestra la info del commit.

git tag	-a <$tag>               #Crea una nueva etiqueta con anotación (editor de texto).
git tag	-a <$tag> -m "mensaje"  #Crea una nueva etiqueta con anotación (sin editor de texto).
git tag	-d <$tag>               #Elimina la etiqueta.
git push origin --delete <$tag> #Elimina la etiqueta del remoto.

git push origin <$tag>          #Publica una etiqueta en el remoto.
git push --tags                 #Publica todas las etiquetas en el remoto.
```
<br>


## Stash:
```bash
git stash                       #Guarda el working directory o el staging area en el stash.
git stash push -m "mensaje"     #Guarda los cambios y les asigna un mensaje descriptivo.
git stash list                  #Muestra todos los stash (stash@{0},stash@{1},stash@{2})
git stash show <index>          #Muestra los cambios guardados. Con -p muestra todos los detalles.
git stash apply	<index>         #Recupera los cambios.
git stash pop <index>           #Recupera los cambios y los elimina del stash.
git stash drop <index>          #Elimina el stash.
git stash clear                 #Elimina todas las entradas del stash.
```
<br>


## Reflog:
```bash
git reflog                      #Lista todos los reflogs
	#Para eliminar todos los reflogs:
	git reflog expire --expire=now --all
	git gc --prune=now
```
<br><br><br>

## *[volver al índice](../index.md)*