@echo off
setlocal

REM Obtener el nombre del equipo (`hostname` en CMD nos dice el nombre del equipo)
for /f "tokens=*" %%i in ('hostname') do set "hostname=%%i"

REM Establecer el path dependiendo del nombre del equipo
if "%hostname%"=="Win10" (
    set "daw=I:\DAW"
) else if "%hostname%"=="Win11" (
    set "daw=F:\DAW"
) else if "%hostname%"=="2A1PC35" (
    set "daw=C:\Users\11725231\Desktop\DAW"
)

REM Hacer git pull en la carpeta DAW
< NUL set /p ="DAW: "
git -C "%daw%" pull

REM Hacer git pull en la subcarpeta DAW\WEBS\notes
< NUL set /p ="Notes: "
git -C "%daw%\WEBS\notes" pull

REM Hacer git pull en la subcarpeta DAW\ED\Proyectos
< NUL set /p ="YusteRichard-ED: "
git -C "%daw%\ED\Proyectos\YusteRichard-ED" pull

< NUL set /p ="Pruebas: "
git -C "%daw%\ED\Proyectos\pruebas" pull

< NUL set /p ="ASIX: "
git -C "%daw%\ED\Proyectos\ASIX" pull


endlocal

REM Evitamos que se cierre el CMD:
pause