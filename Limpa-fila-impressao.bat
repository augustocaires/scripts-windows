echo off

echo -------------------------------------------------------------------------
title LIMPANDO FILA DE IMPRESSAO
echo.
echo PARANDO O SERVICO DE SPOOLER
echo.
net stop spooler

echo ENTRANDO NO DIRETORIO C: E ABRINDO PASTA TEMP DE IMPRESSAO
echo.
cd C:\Windows\System32\spool\PRINTERS

echo.
echo DELETANDO OS ARQUIVOS
echo.
del /f/s *.shd
del /f/s *.spl
del /f/s *.tmp
echo.

echo REINICIANDO OS SERVICOS
echo.
net start spooler

echo LIMPEZA CONCLUIDA!
echo -------------------------------------------------------------------------
Pause