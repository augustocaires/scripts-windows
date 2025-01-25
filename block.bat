@echo off

:restart

psexec -s -i \\192.168.100.150 rundll32.exe user32.dll LockWorkStation -u administrador -p senha@123

timeout 05
goto restart