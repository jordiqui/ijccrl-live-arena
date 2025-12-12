@echo off
setlocal

REM === Ajusta estos valores según tu instalación ===
set TLCS_EXE=tlc_server16a.exe
set WINBOARD_EXE=winboard.exe
set SERVER_INI=%~dp0server.ini
set LOG_DIR=%~dp0logs

if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"
set WINBOARD_LOG=%LOG_DIR%\winboard.debug

echo [IJCCRL] Iniciando TLCS con config: %SERVER_INI%
start "TLCS" /D "%~dp0" "%TLCS_EXE%" @"%SERVER_INI%"

timeout /t 3 /nobreak >nul

echo [IJCCRL] Iniciando WinBoard en modo ICS
start "WinBoard" /D "%~dp0" "%WINBOARD_EXE%" ^
  /ics ^
  /icshost=127.0.0.1 ^
  /icsport=16000 ^
  /zippyGameEnd="quit" ^
  /debugfile="%WINBOARD_LOG%" ^
  /zp /zpSetLevel=16000


echo [IJCCRL] TLCS y WinBoard lanzados. Revisa winboard.debug para confirmar conexión.
endlocal
