# Ngrok

## 1. ¿Qué es ngrok?
Ngrok es una herramienta que permite exponer un servidor web local a internet.  
Es muy útil para probar aplicaciones web en desarrollo en dispositivos móviles, compartir un sitio web en desarrollo con un cliente, entre otros.

---
<br>

## 2. Instalación
- Registrarse en: [https://ngrok.com](https://ngrok.com)

- Descargar el archivo **zip** de la página de descargas.

- Generar un token de autenticación:
  - Tunnels -> Add Tunnel Authtoken -> Copiar el token generado.

- Descomprimir el archivo zip.

- Ejecutar el archivo **ngrok.exe**. Es un ejecutabe sin dependencias, por lo que no requiere instalación.

- Añadir token al archivo yml de configuración:
`ngrok config add-authtoken 2k73hQIiBpaoYV8rz5AD1b0bnSW_3pZoBh1H6BGWTwPm7yXc4`

- Arrancar el servicio:
`ngrok http http://localhost:8080`

---
<br><br><br>

## *[volver al índice](../README.md)*