@echo off
setlocal

:: Apagar chaves do MountPoints2 em HKCU
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f

:: Apagar chaves do MountPoints2 em HKU
for /F "tokens=*" %%G in ('reg query "HKEY_USERS"') do (
    reg delete "%%G\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f
)

echo Registros do MountPoints2 apagados com sucesso.
endlocal
pause
