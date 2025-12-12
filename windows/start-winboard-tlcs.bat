@echo off
REM --- Se asegura de que el directorio actual sea C:\winboard ---
cd /d "C:\winboard"

REM --- Lanza WinBoard con debug y tus dos motores UCI ---
start "" "C:\WinBoard-4.4.0\WinBoard\winboard.exe" ^
  /debug ^
  /fcp "C:\Deepalienist-2.0\Deepalienist-2.30-061225.exe" /fUCI ^
  /scp "C:\revolution-3.50-131125\Revolution-3.80-021225.exe" /sUCI

