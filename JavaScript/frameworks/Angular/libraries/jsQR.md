# jsQR
Es un decodificador de códigos QR escrito en JavaScript.  
Puede leer códigos QR en imágenes o en un flujo de video en tiempo real.

## 1. Instalar módulo 🔧
```bash
npm install jsqr
```
---
<br>

## 2. Explicación paso a paso📖
- **1º Enciende la cámara:**
  - a Solicita el acceso a la cámara con `navigator.mediaDevices.getUserMedia()`.
  - b Especifica que queremos usar la cámara trasera (`facingMode: "environment"`).
  - c Si el usuario concede acceso, obtiene el `MediaStream`.
  - d Asigna el MediaStream al `<video>`.
  - e Inicia la reproducción automática con `video.play()`.
  - f Llama a `scanQRCode()` para comenzar a analizar el video.
- **2º Escanea el código:**
  - a Captura un frame del video con `canvas.drawImage(video, 0, 0)`.
  - b Extrae los píxeles de la imagen con `canvas.getImageData()`.
  - c Pasa la imagen a `jsQR(imageData.data, imageData.width, imageData.height);`.
  - d Si detecta un código QR, extrae la información.
  - e Si no detecta nada, vuelve a capturar un nuevo frame con `requestAnimationFrame(scan)`.
- **3º Procesa el resultado:**
  - a Si hay un código QR, muestra los datos con `console.log(code.data)`.
  - b Detiene la cámara `video.srcObject.getTracks().forEach(track => track.stop())`.
  - c Oculta el video y el canvas.
  - d Puede redirigir a otra página o ejecutar una acción con los datos escaneados.
---
<br>

## 3. Ejemplo de uso 💡
```html
<!-- app.component.html -->
<video #video autoplay></video>
<canvas #canvas hidden></canvas>

<button (click)="scanQRCode()">Scan QR Code</button>
```
```typescript
// app.component.ts
import { Component, ElementRef, ViewChild } from '@angular/core';

@Component({
  selector: 'app-root',
  imports: [],
  templateUrl: 'app.component.html',
  styleUrl: 'app.component.css'
})
export class AppComponent {

    @ViewChild('video') videoElement: ElementRef<HTMLVideoElement>;
    @ViewChild('canvas') canvasElement: ElementRef<HTMLCanvasElement>;

    constructor() {}
    
    startCamera() {
        navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } })  // Solicita acceso a la cámara.
        .then((stream) => {
            const video = this.videoElement.nativeElement;
            video.srcObject = stream;                      // --------------------------- Asigna el MediaStream al video.
            video.play();                                  // --------------------------- Inicia la reproducción automática.
            this.scanQRCode();                             // --------------------------- Comienza a analizar el video.
        })
        .catch((error) => {
            console.error('Error accessing the camera:', error);
            alert(this.getCameraErrorMessage(error));
        });
    }

    private scanQRCode() {
        const video = this.videoElement.nativeElement;     // --------------------------- Obtiene el video. (El video es un elemento HTML que se utiliza para reproducir videos o secuencias de video.)

        const canvas = this.canvasElement.nativeElement;   // --------------------------- Obtiene el canvas.(El canvas es un elemento HTML que se utiliza para dibujar gráficos, animaciones, etc.)
        if (!canvas) {
          console.log("Canvas not found");
          return;
        }

        const context = canvas.getContext('2d');           // --------------------------- Obtiene el contexto del canvas. (El contexto es el objeto que se utiliza para dibujar en el canvas.)
        if (!context) {
          console.log("Canvas context not found");
          return;
        }

        const scan = () => {
          if (video.readyState === video.HAVE_ENOUGH_DATA) {                           // Comprueba si el video tiene suficientes datos para reproducir.
            canvas.width = video.videoWidth;                                           // Establece el ancho del canvas al ancho del video.
            canvas.height = video.videoHeight;                                         // Establece el alto del canvas al alto del video.
            context.drawImage(video, 0, 0, canvas.width, canvas.height);               // Dibuja el video en el canvas.

            const imageData = context.getImageData(0, 0, canvas.width, canvas.height); // Obtiene los píxeles de la imagen.
            const code = jsQR(imageData.data, imageData.width, imageData.height);      // Pasa la imagen a jsQR.

            if (code) {
              console.log("QR Code Scanned:", code.data);  // --------------------------- Muestra los datos del código QR.
              this.stopScanning();                         // --------------------------- Detiene la cámara.
              return;
            }
          }
          requestAnimationFrame(scan);                     // --------------------------- Captura un nuevo frame.
        };
        
        requestAnimationFrame(scan);                       // --------------------------- Captura un frame del video.
   }

   stopScanning() {
    const video = this.videoElement.nativeElement;         // --------------------------- Obtiene el video.

    if (video.srcObject instanceof MediaStream) {
      video.srcObject.getTracks().forEach(track => track.stop()); // -------------------- Si el video es un MediaStream, obtiene las pistas y las detiene una por una.
    }

    video.srcObject = null;                                // --------------------------- Elimina el MediaStream del video.
  }

  private getCameraErrorMessage(error: any): string {
    if (error.name === "NotAllowedError") {
      return 'Access to the camera is denied. Please enable camera access in your browser settings.';
    } else if (error.name === "NotFoundError") {
      return 'No camera found on this device.';
    } else {
      return 'Error accessing the camera. Please check your camera settings.';
    }
  }
}
```

---
<br><br><br>

## *[volver al índice](../../../../README.md)*