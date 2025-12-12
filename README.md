# IJCCRL LIVE ARENA

Infraestructura oficial para transmitir partidas de motores de ajedrez desde **WinBoard + TLCS** hacia un visor web moderno servido detrás de **Nginx + SSL**. Este repositorio incluye el visor HTML final, lanzadores de Windows, configuración de Nginx y guías de instalación.

## Quickstart
1. **Windows (TLCS + WinBoard):** coloca `windows/server.ini` a partir de `windows/server.ini.example`, ejecuta `windows/start-winboard-tlcs.bat` y confirma que TLCS muestra `Client Connection Table: 1`.
2. **VPS (Node):** instala Node 18+, clona este repo, instala dependencias del servidor (`npm install` en `server/`, no expongas puertos) y ejecuta el servicio en `127.0.0.1:8080`.
3. **Nginx + SSL:** usa `nginx/live.ijccrl.com.conf` y la guía `docs/02-vps-install-node-nginx-ssl.md` para publicar sólo por HTTPS.
4. **Verifica el visor:** `curl -I http://127.0.0.1:8080/ijccrl-viewer.html` debe responder `200 OK`; abre `https://<tu-dominio>/ijccrl-viewer.html?port=<PUERTO_TLCS>`.

## Arquitectura
- **Windows:** WinBoard conecta al **TLCS** (servidor ICS) y exporta el puerto que consumirá Node.
- **VPS:** un servicio Node lee TLCS, encapsula las jugadas y las sirve vía Socket.IO en `127.0.0.1:8080`.
- **Nginx:** termina TLS, redirige `80 → 443`, hace proxy (incluyendo WebSockets) hacia `127.0.0.1:8080` y sirve el visor estático.
- **Web:** `web/ijccrl-viewer.html` consume Socket.IO desde la misma ruta (`/socket.io`) usando el host recibido por Nginx (cabeceras Host intactas).

## Seguridad
- **No expongas los puertos TLCS** (ni 16000 ni el que uses): sólo deben ser accesibles localmente por WinBoard/Node.
- El backend Node queda en `127.0.0.1:8080`; sólo se publica por **HTTPS** mediante Nginx.
- Activa UFW permitiendo únicamente `80/tcp` y `443/tcp` y bloquea el resto.
- Certificados con Let’s Encrypt y renovación automática (`certbot`).

## Licencias / terceros
- Este repositorio **no incluye** binarios de **TLCS** ni **WinBoard**; debes obtenerlos de sus fuentes originales y respetar sus licencias.
- El visor y la configuración son de IJCCRL; revísalos antes de redistribuir.

## B. Subir tu visor
- El visor final está en `web/ijccrl-viewer.html` e incluye PV, clocks estimados y estilo IJCCRL.
- Usa rutas relativas (ej. `/socket.io/socket.io.js`) para funcionar detrás de Nginx sin depender de hostnames externos.
- Compatible con cabeceras `Host` preservadas por el reverse proxy.

## C. Subir tu launcher Windows
- `windows/start-winboard-tlcs.bat`: lanza WinBoard y TLCS con las opciones recomendadas (ICS, log `winboard.debug`).
- `windows/server.ini.example`: base para configurar puerto, motores y log sin rutas personales.
- `windows/README-windows.md`: explica dónde colocar `server.ini`, dónde se escribe `winboard.debug` y cómo validar conexión y jugadas en el visor.

## D. Subir Nginx + SSL
- `nginx/live.ijccrl.com.conf`: redirección `80 → 443`, proxy a `127.0.0.1:8080` con soporte WebSockets y archivos estáticos.
- `docs/02-vps-install-node-nginx-ssl.md`: comandos exactos para UFW, Certbot, pruebas (`nginx -t`) y recargas.

## E. Subir troubleshooting
- `docs/03-troubleshooting.md`: cubre `502 Bad Gateway` (upstream erróneo), conexiones sin jugadas (TLCS/puertos/WinBoard) y verificación con `curl -I http://127.0.0.1:8080/ijccrl-viewer.html`.

## F. Etiquetar release
Cuando todo esté listo, etiqueta el repositorio como **`v1.0-live-subdomain`** y prepara el despliegue en tu VPS.
