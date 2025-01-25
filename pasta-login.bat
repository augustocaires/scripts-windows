@echo off
net time \\serv-dominio01 /set /y
mkdir \\192.168.0.100\grupos$\business\%username%
net use B: \\192.168.0.100\grupos$\business\%username%
wuauclt.exe /detectnow
cls
exit