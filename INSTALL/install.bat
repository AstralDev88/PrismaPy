@echo off
echo Installing Prismapy (Windows)...
echo.

REM Installationsordner
set INSTALL_DIR=%USERPROFILE%\prismapy

REM GitHub-Download-URL (HIER ANPASSEN!)
set PRISMAPY_URL=https://github.com/DEINNAME/DEINREPO/releases/latest/download/prismapy.exe

REM Ordner erstellen
if not exist "%INSTALL_DIR%" (
    mkdir "%INSTALL_DIR%"
)

REM prismapy.exe herunterladen
echo Downloading prismapy.exe...
powershell -Command "Invoke-WebRequest -Uri '%PRISMAPY_URL%' -OutFile '%INSTALL_DIR%\prismapy.exe'"

REM Prüfen ob Download erfolgreich war
if not exist "%INSTALL_DIR%\prismapy.exe" (
    echo ERROR: prismapy.exe konnte nicht heruntergeladen werden.
    pause
    exit /b 1
)

REM PATH erweitern (user-level)
setx PATH "%PATH%;%INSTALL_DIR%" >nul

echo.
echo Prismapy wurde erfolgreich installiert!
echo Terminal neu öffnen und dann:
echo   prismapy dein_script.prispy
echo.
pause
