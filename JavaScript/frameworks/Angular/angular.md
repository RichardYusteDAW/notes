# Angular
Es un framework de código abierto desarrollado por Google para crear aplicaciones web SPA (Single Page Application) en TypeScript.

## 1. Web Site 🌐
[Angular](https://angular.io/)

---
<br>


## 2. Instalación 🛠️
```bash
npm install -g @angular/cli
```
---
<br>


## 3. Comandos ng 🖥️
```bash
ng --version              # Muestra la versión de Angular CLI
ng new <nombre-proyecto>  # Crea un nuevo proyecto
ng serve                  # Inicia el servidor de desarrollo (--open para abrir el navegador)
ng build                  # Compila la aplicación
ng lint                   # Analiza el código en busca de errores
ng test                   # Ejecuta las pruebas unitarias
ng e2e                    # Ejecuta las pruebas end-to-end

ng generate module <nombre-modulo>         # Crea un nuevo módulo (ng g m mymodule)
ng generate component <nombre-componente>  # Crea un nuevo componente (ng g c mycomponent)
ng generate interface <nombre-interfaz>    # Crea una nueva interfaz (ng g i myinterface)
ng generate service <nombre-servicio>      # Crea un nuevo servicio (ng g s myservice)
```
- Preguntas durante la creación de un nuevo proyecto:
  - 1ª. ¿Te gustaría habilitar la **autocompletación**?
  - 2ª. ¿Te gustaría compartir datos de uso **pseudónimos** sobre este proyecto con el equipo de Angular en Google bajo la Política de Privacidad de Google_
  - 3ª. ¿Qué formato de **hoja de estilos** te gustaría usar? (CSS, SCSS, SASS, LESS, Stylus).
  - 4ª. ¿Quieres habilitar el **renderizado** del lado del servidor (SSR) y la generación de sitios estáticos (SSG/Prerendering)?
---
<br>


## 4. Estructura 🏗️
```java
/ANGULAR-PROJECT
└─ /.vscode  -- -- -- -- -- -- -- -- -- -- -- - // Configuraciones para Visual Studio Code.
└─ /node_modules  -- -- -- -- -- -- -- -- -- -- // Módulos de Node.js.
└─ /src
|    └─ /app  -- -- -- -- -- -- -- -- -- -- --  // Raíz de los componentes y servicios de Angular.
|    |    └─ /components  -- -- -- -- -- -- --  // Componentes de la aplicación.
|    |    |    └─ navbar  -- -- -- -- -- -- --  // Componente de barra de navegación.
|    |    |    |     └─ navbar.component.ts
|    |    |    |     └─ navbar.component.html
|    |    |    |     └─ navbar.component.scss
|    |    |    |
|    |    |    └─ footer  -- -- -- -- -- -- --  // Componente de pie de página.
|    |    |          └─ footer.component.ts
|    |    |          └─ footer.component.html
|    |    |          └─ footer.component.scss
|    |    |
|    |    └─ /services  -- -- -- -- -- -- -- -- // Servicios para manejar la lógica de negocio.
|    |    |    └─ book.service.ts  -- -- -- --  // Servicio para manejar operaciones de libros.
|    |    |
|    |    └─ /models  -- -- -- -- -- -- -- -- - // Modelos para representar estructuras de datos.
|    |         └─ book.model.ts  -- -- -- -- -- // Modelo de datos para un libro.
|    |
|    └─ /assets  -- -- -- -- -- -- -- -- -- --  // Recursos estáticos como imágenes y estilos.
|
└─ /public
|    └─ /index.html  -- -- -- -- -- -- -- -- -- // Página principal de entrada a la aplicación.
|
└─ /angular.json  -- -- -- -- -- -- -- -- -- -- // Configuración de Angular CLI.
└─ /package.json  -- -- -- -- -- -- -- -- -- -- // Dependencias y scripts de Node.js.
└─ /tsconfig.json  -- -- -- -- -- -- -- -- -- - // Configuración de TypeScript.
└─ /README.md  -- -- -- -- -- -- -- -- -- -- -- // Documentación inicial del proyecto.
└─ /.gitignore  -- -- -- -- -- -- -- -- -- -- - // Archivo para ignorar archivos en git.
└─ /.editorconfig  -- -- -- -- -- -- -- -- -- - // Configuración de estilo de código.
```
---
<br>


## 5. Scripts en package.json 📜
```json
"scripts": {
  "start": "ng serve",
  "build": "ng build",
  "watch": "ng build --watch --configuration development",
   "lint": "ng lint",
   "test": "ng test",
    "e2e": "ng e2e"
}
```
---
<br>


## 6. Módulos 📦
- Es una clase con el decorador `@NgModule`.
- Se utilizaba en versiones anteriores a la 17 para definir los elementos del proyecto (componentes, directivas, pipes, servicios, etc.).
- Se creaba automáticamente el archivo `app.module.ts` al crear un nuevo proyecto.
```typescript
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';

@NgModule({
  declarations: [AppComponent],  // Componentes, directivas y pipes.
  imports: [BrowserModule],      // Módulos que necesitamos.
  providers: [],                 // Servicios.
  bootstrap: [AppComponent]      // Componente principal.
})
export class AppModule { }
```
---
<br>


## 7. Componentes 🧩
- Es una clase con el decorador `@Component`.
- Se utiliza para definir la lógica de la vista.
- Se crea automáticamente el archivo `app.component.ts` al crear un nuevo proyecto.
- Se pueden crear tantos como sea necesario.
```typescript
import { Component } from '@angular/core';      // Clase base de los componentes.
import { RouterOutlet } from '@angular/router'; // Clase que se utiliza para mostrar las vistas de las rutas.

@Component({
  selector: 'app-root',                         // Nombre que se usa en el HTML.
  imports: [RouterOutlet],                      // Módulos que necesitamos en el componente.
  templateUrl: './app.component.html',          // Vista del componente.
  styleUrl: './app.component.css'               // Estilos del componente.
})
export class AppComponent {
  title = 'myproject';                          // Propiedad del componente.
}
```
Ciclo de vida de un componente:
1. `ngOnChanges`: Se ejecuta cuando un valor de entrada cambia.
2. `ngOnInit`: Se ejecuta después de que Angular haya mostrado los datos por primera vez.
3. `ngDoCheck`: Se ejecuta cuando Angular comprueba los datos.
4. `ngAfterContentInit`: Se ejecuta después de que Angular haya proyectado el contenido en la vista.
5. `ngAfterContentChecked`: Se ejecuta después de que Angular haya comprobado el contenido proyectado.
6. `ngAfterViewInit`: Se ejecuta después de que Angular haya inicializado la vista.
7. `ngAfterViewChecked`: Se ejecuta después de que Angular haya comprobado la vista.
8. `ngOnDestroy`: Se ejecuta antes de que Angular destruya el componente.
---
<br>


## 8. Data binding 📊
- Es la sincronización de datos entre el modelo y la vista.
```typescript
@Component({
  selector: 'app-root',
  imports: [RouterOutlet, FormsModule], // Importar el módulo FormsModule para poder usar ngModel.
  templateUrl: './app.component.html'
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'myproject';
  url = 'https://example.com';
  name = '';
  handler() {
    console.log('Button clicked');
  }
}
```
```html
<p>{{ title }}</p>                             <!-- Interpolación -->
<img [src]="url">                              <!-- Property binding -->
<button (click)="handler()">Click me</button>  <!-- Event binding -->
<input [(ngModel)]="name">                     <!-- Two-way binding (Requiere importar FormsModule) -->
```
---
<br>


## 9. Directivas 📏
### 9.1. Directivas de atributo
- Son instrucciones en el DOM que cambian el comportamiento de un elemento (ngClass, ngStyle, ngModel).
  - `ngClass`: Añade o elimina clases de un elemento ([ngClass]="{class-name: condition}").
  - `ngStyle`: Añade o elimina estilos de un elemento ([ngStyle]="{style: condition ? value-if-true : value-if-false}").
  - `ngModel`: Enlaza el valor de un input con una propiedad del componente ([(ngModel)]="property").
```html
<!-- ngClass -->
<p [ngClass]="{ 'text-danger': isError, 'text-success': !isError }">Texto</p>

<!-- ngStyle -->
<p [ngStyle]="{ 'color': isError ? 'red' : 'green' }">Texto</p>

<!-- ngModel -->
<input [(ngModel)]="name">
```

### 9.2. Directivas estructurales
- Son instrucciones en el DOM que cambian la estructura del DOM (if, else, switch, for).
- `ng-template`: Es una directiva estructural que se utiliza para definir un bloque de código que se puede reutilizar. Por defecto no se renderiza en el DOM.
- `ng-container`: Es una directiva estructural que se utiliza para agrupar elementos sin añadir un elemento adicional al DOM.
```html
<!-- *ngIf -->
<p *ngIf="isLogged; else noLogged">El usuario está logueado</p>
<ng-template #noLogged>
  <p>El usuario no está logueado</p>
</ng-template>

<!-- @if -->
@if(isLogged) {
  <p>El usuario está logueado</p>
} @else {
  <p>El usuario no está logueado</p>
}

<!-- *ngSwitch -->
<div [ngSwitch]="color">
  <p *ngSwitchCase="'red'">El color es rojo</p>
  <p *ngSwitchCase="'blue'">El color es azul</p>
  <p *ngSwitchDefault>El color es otro</p>
</div>

<!-- @switch -->
@switch(color) {
  @case('red') {
    <p>El color es rojo</p>
  }
  @case('blue') {
    <p>El color es azul</p>
  }
  @default {
    <p>El color es otro</p>
  }
}

<!-- *ngFor -->
<ul>
  <ng-container *ngFor="item of items">
    <li>{{ item.name }}</li>
  </ng-container>
</ul>

<!-- @for -->
<ul>
  @for(item of items; track item.id) {
    <li>{{ item.name }}</li>
  }
  @empty {
    <li>No hay elementos</li>
  }
</ul>
```
---
<br>

## 10. Instalar Bootstrap 🎨
```bash
npm install bootstrap jquery @popperjs/core
```
- Añadir las rutas de los archivos CSS y JS en el archivo `angular.json`.
```json
"styles": [
  "node_modules/bootstrap/dist/css/bootstrap.min.css",
  "src/styles.css"
],
"scripts": [
  "node_modules/jquery/dist/jquery.min.js",
  "node_modules/@popperjs/core/dist/umd/popper.min.js",
  "node_modules/bootstrap/dist/js/bootstrap.min.js"
]
```
---
<br>


## 11. Comunicación entre componentes 📡
### 11.1. De padre a hijo (@Input)
```typescript
// PADRE
import { Component } from '@angular/core';

@Component({
  selector: 'app-father',
  templateUrl: './father.component.html'
})
export class FatherComponent {
  titleFather = 'myproject';
}
```
```typescript
// HIJO
import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-child',
  templateUrl: './child.component.html'
})
export class ChildComponent {
  @Input() titleFromFather: string;
}
```
```html
<!-- PADRE -->
<app-child [titleFromFather]="titleFather"></app-child>

<!-- HIJO -->
<p>{{ titleFromFather }}</p>
```

### 11.2. De hijo al padre (@Output)
```typescript
// PADRE
import { Component } from '@angular/core';

@Component({
  selector: 'app-father',
  templateUrl: './father.component.html'
})
export class FatherComponent {
  title = 'myproject';
  saludarDesdeElPadre(saludo: string) {
    console.log(saludo);
  }
}
```
```typescript
// HIJO
import { Component, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-child',
  templateUrl: './child.component.html'
})
export class ChildComponent {
  @Output() eventoSaludo = new EventEmitter<string>();
  saludarDesdeElHijo() {
    this.eventoSaludo.emit('Hola desde el hijo');
  }
}
```
```html
<!-- PADRE -->
<app-child (eventoSaludo)="saludarDesdeElPadre($event)"></app-child>

<!-- HIJO -->
<button (click)="saludarDesdeElHijo()">Saludar</button>
```

### 11.3. Desde cualquier componente 
#### 11.3.1. Servicios
- `@Injectable`: Se utiliza para inyectar un servicio en un componente.
```typescript
// SERVICIO
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  data = 'Hola desde el servicio';
}
```
```typescript
// COMPONENTE
import { Component } from '@angular/core';
import { DataService } from './data.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent {
  constructor(private dataService: DataService) {}

  ngOnInit() {
    console.log(this.dataService.data);
  }
}
```
<br>

#### 11.3.2. Observables (RxJS)
- El patrón Observer es una forma de comunicación entre componentes en Angular:
  - El Subject emite los valores.
  - El Observable actúa como intermediario entre el Subject y los Observers, emitiendo los valores de forma segura.
  - Los Observers reciben los valores emitidos por el Observable.

![Observer](../../../_img/observer.png)

- Definiciones:
  - `Observable`: Clase de RxJS que permite trabajar con flujos de datos asíncronos o basados en eventos.
  - `Subject`: Es un tipo de Observable que también actúa como Observer. Permite emitir valores a múltiples observadores.
  - `BehaviorSubject`: Variante de Subject que almacena el último valor emitido y lo proporciona a nuevos suscriptores.
- Métodos:
  - Métodos de Emisión:
     - `next(value: T)`: Emite un valor a los suscriptores.
     - `error(error: Error)`: Emite un error y termina la secuencia.
     - `complete()`: Finaliza la secuencia de emisiones desde el observable.
  - Métodos de Suscripción:
      - `subscribe({next, error, complete}): Subscription`: Suscribe un observador a un observable y devuelve un objeto de tipo **Subscription**.
      - `unsubscribe()`: Cancela la suscripción desde el observador.
  - Métodos de Transformación, Combinación y Filtrado:
      - `pipe(operators)`: Aplica operadores a un observable (map, filter, reduce, scan, switchMap, mergeMap, concatMap, catchError).

```typescript
// SERVICIO
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class MsgService {

  private message = new BehaviorSubject<string>('Hola desde el servicio'); // Valor inicial
  message$ = this.message.asObservable();                                  // Observable

  setMessage(text: string) {
    if (text === '') {
      this.message.error('Error: El mensaje no puede estar vacío');        // Emite un error y cancela el observable
    }else{
      this.message.next(text);
    }
  }

  complete() {
    this.message.complete();
  }
}
```
```typescript
// COMPONENTE
import { Component } from '@angular/core';
import { MsgService } from './msg.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})

export class AppComponent {

 private subscription: Subscription;

 constructor(private msgService: MsgService) {}

  ngOnInit() {
    this.subscription = this.msgService.message$.subscribe({
      next: (msg) => console.log(msg),
      error: (err) => console.log(err),
      complete: () => console.log('Completado')
    });
  }

  changeMessage() {
    this.msgService.setMessage('Hola desde el componente');
  }

  finalize() {
    this.msgService.complete();
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }
}
```
```html
<!-- HMTL -->
<button (click)="changeMessage()">Cambiar mensaje</button>
<button (click)="finalize()">Finalizar</button>
```
```bash
# CONSOLA
Hola desde el servicio
Hola desde el componente
Completado
```
---
<br><br><br>

## *[volver al índice](../../../README.md)*