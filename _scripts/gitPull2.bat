@echo off
setlocal

REM Obtener el nombre del equipo (`hostname` en CMD nos dice el nombre del equipo)
for /f "tokens=*" %%i in ('hostname') do set "hostname=%%i"

REM Establecer el path dependiendo del nombre del equipo
if "%hostname%"=="Win10" (
    set "daw=I:\DAW"
) else if "%hostname%"=="Win11" (
    set "daw=F:\DAW"
) else if "%hostname%"=="LAPTOP-G7BU4PTR" (
    set "daw=C:\Users\Richard\Desktop\DAW"
)

REM Hacer git pull en la subcarpeta DAW\WEBS\notes
< NUL set /p ="Second: "
git -C "%daw%\second" pull

REM Hacer git pull en la subcarpeta DAW\WEBS\notes
< NUL set /p ="Notes: "
git -C "%daw%\notes" pull


endlocal

REM Evitamos que se cierre el CMD:
pause