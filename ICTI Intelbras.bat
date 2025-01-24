@echo off

wmic service get name,state | find /i "ICTI Intelbras"
pause

NET START | FINDSTR "ICTI Intelbras"

if %ERRORLEVEL% == 1 goto stopped
if %ERRORLEVEL% == 0 goto started
echo comando desconhecido
goto end    
:started
NET STOP "ICTI Intelbras"
goto end
:stopped
NET START "ICTI Intelbras"
goto end
:end