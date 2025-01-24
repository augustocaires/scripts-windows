@echo off
set /p c= Gostaria de iniciar um serviço [Y/N]?
  if /I "%c%" EQU "Y" goto :1
  if /I "%c%" EQU "N" goto :2
    :1  
    set /p var= Nome do serviço: 
:2 
set /p c= Gostaria de interromper um serviço[Y/N]?
  if /I "%c%" EQU "Y" goto :3
  if /I "%c%" EQU "N" goto :4
    :3  
    set /p var1= Nome do serviço:
:4
set /p c= Gostaria de desativar um serviço [Y/N]?
  if /I "%c%" EQU "Y" goto :5
  if /I "%c%" EQU "N" goto :6
    :5  
    set /p var2= Nome do serviço:
:6 
set /p c= Gostaria de definir um serviço como Automático [Y/N]?
  if /I "%c%" EQU "Y" goto :7
  if /I "%c%" EQU "N" goto :10
    :7  
    set /p var3= Nome do serviço:
:10
sc start %var%
sc stop %var1%
sc config %var2% start=disabled
sc config %var3% start=auto