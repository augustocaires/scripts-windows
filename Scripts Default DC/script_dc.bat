@ECHO OFF

REM ============================================================
REM AGUARDA RESPOSTA DO PING ANTES DE CONTINUAR
REM ============================================================
REM :CHECKPING
REM cls
REM echo ******************************************************************
REM echo Aguardando conexão com o Controlador de Domínio (Testando 192.100.10.2)
REM echo ******************************************************************
REM ping -n 1 192.100.10.2 | find "TTL=" >nul
REM 
REM IF ERRORLEVEL 1 (
REM     timeout /t 5 >nul
REM     GOTO CHECKPING
REM )
REM 
REM cls
REM echo ******************************************************************
REM echo Conexão com êxito!
REM echo ******************************************************************
REM echo.

REM ============================================================
REM SCRIPT ORIGINAL CONTINUA DAQUI
REM ============================================================

REM echo *************************************************************************************
REM echo ***** Por favor, não feche esta janela, minimize e ela encerrará automaticamente.****
REM echo *************************************************************************************

NET time \\domain.local /set /yes

REM NET use n: /d

NET USE N: \\domain.local\global /y

REM cscript \\domain.local\NETLOGON\VBS\add_print.vbs

REM "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://intranet.local.com/

REM powershell \\domain.local\NETLOGON\tec_psw.ps1

echo *************************************************************************************
echo ***** Por favor, não feche esta janela, minimize e ela encerrará automaticamente.****
echo *************************************************************************************

REM CRIAÇÃO PASTA DC_UTIL
IF NOT EXIST "c:\dc_util" md "c:\dc_util"

REM ATUALIZAÇÃO WALLPAPER
IF NOT EXIST "C:\dc_util\Wallpaper" md "C:\dc_util\Wallpaper"
IF EXIST "C:\dc_util\Wallpaper\new_wallpaper.jpg" del /q "C:\dc_util\Wallpaper\new_wallpaper.jpg"
copy "\\domain.local\NETLOGON\Wallpaper\new_wallpaper.jpg" "C:\dc_util\Wallpaper\"

IF NOT EXIST "C:\dc_util\soft_default.zip" copy "\\domain.local\NETLOGON\programas\soft_default" "C:\dc_util\"

IF NOT EXIST "C:\dc_util\Wallpaper\wallpaper_login.ps1" copy "\\domain.local\NETLOGON\Wallpaper\wallpaper_login.ps1" "C:\dc_util\Wallpaper\"

Powershell.exe -executionpolicy remotesigned -File "C:\d_util\Wallpaper\wallpaper_login.ps1"

REM DISABLE IPV6
netsh interface teredo set state disabled
netsh interface ipv6 6to4 set state state=disabled undoonstop=disabled
netsh interface ipv6 isatap set state state=disabled

gpupdate /force

CLS
exit
