@echo off
setlocal
	if not exist "\\SERVER\NETLOGON\login.bat" exit
	c:\USER\shutdown -s -f -t 600 -c "Confirme que esta utilizando a maquina no Prompt dos para evitar o desligamento do Sistema"
	echo '    Pressione qualquer tecla para evitar o desligamento do computador...
	pause > %tmp%\lixo.stdout
	c:\USER\shutdown -a 

endlocal
goto :EOF
