# IJCCRL Windows Launcher (WinBoard + TLCS)

## Ubicación de archivos
- Coloca `server.ini` en la misma carpeta que `start-winboard-tlcs.bat` (parte desde `server.ini.example`).
- Los logs se guardan en `logs/` (se crea automáticamente).
- `winboard.debug` se escribe en `logs/winboard.debug` desde WinBoard.

## Cómo ejecutar
1. Ajusta `TLCS_EXE` y `WINBOARD_EXE` en `start-winboard-tlcs.bat` si están en otra ruta.
2. Abre el bat con doble clic o consola (cmd) y espera unos segundos.
3. TLCS se lanza primero con `server.ini`; luego WinBoard se conecta vía ICS a `127.0.0.1:16000`.

## Verificar conexión
- En la ventana de TLCS, busca la línea `Client Connection Table: 1` para confirmar que WinBoard está conectado.
- Abre `logs/winboard.debug` y comprueba que las jugadas se generan sin errores.
- Abre el visor: `https://<tu-dominio>/ijccrl-viewer.html?port=16000` y confirma que llegan jugadas en tiempo real.

## Consejos
- Si no ves `Client Connection Table: 1`, revisa el puerto en `server.ini` y en los parámetros `/icsport` del bat.
- Evita rutas con espacios para simplificar.
- Mantén TLCS y WinBoard en la misma carpeta que este launcher para evitar problemas de rutas relativas.
