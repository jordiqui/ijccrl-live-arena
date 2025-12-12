# Troubleshooting

## 502 Bad Gateway (Nginx)
- **Síntoma:** `502 Bad Gateway` al abrir el visor.
- **Causa común:** `proxy_pass` apunta a `http://127.0.0.1:3000` en lugar de `http://127.0.0.1:8080`.
- **Solución:** edita `nginx/live.ijccrl.com.conf` para usar `127.0.0.1:8080`, ejecuta `sudo nginx -t` y luego `sudo systemctl reload nginx`.

## Connected but no moves
- **Síntoma:** el visor muestra conectado pero no llegan jugadas.
- **Checklist:**
  - TLCS no está recibiendo partidas (WinBoard no conectado o puerto errado).
  - `Client Connection Table` no muestra el cliente de WinBoard (revisa `/icsport` en el bat y `port` en `server.ini`).
  - El puerto TLCS está bloqueado en Windows Firewall.
  - WinBoard no tiene motores cargados o la partida no inició.
  - Node no está suscrito al puerto correcto (consulta `?port=` en la URL).

## Verificación rápida del visor
- Ejecuta:
```bash
curl -I http://127.0.0.1:8080/ijccrl-viewer.html
```
- Debe responder `200 OK`. Si falla, confirma que el servicio Node sirve el archivo estático y que Nginx (si aplica) tiene permisos de lectura.

## WebSockets sin upgrade
- **Síntoma:** la página carga pero el socket no se conecta.
- **Checklist:**
  - En Nginx, asegúrate de tener `proxy_set_header Upgrade $http_upgrade;` y `Connection "upgrade";` en `/socket.io/`.
  - Comprueba que el backend Node esté escuchando en `127.0.0.1:8080`.

## Logs útiles
- `logs/winboard.debug` (WinBoard)
- `logs/tlcs.log` (TLCS, según `server.ini`)
- Registros del servicio Node (PM2 o systemd)
- `/var/log/nginx/error.log`
