@echo off

wmic service get name,state | find /i "CommServer"
pause

NET START | FINDSTR CommServer

if %ERRORLEVEL% == 1 goto stopped
if %ERRORLEVEL% == 0 goto started
echo comando desconhecido
goto end    
:started
NET STOP CommServer
goto end
:stopped
NET START CommServer
goto end
:end