psexec -s -i \\host-pc005 "%windir%\system32\cmd.exe" /c cscript //B "%windir%\system32\slmgr.vbs" -ipk XXXXX-XXXXX-XXXXX-XXXXX-XXXXX

 -U administrador -P senha@123

psexec -s -i \\192.168.100.63 "%windir%\system32\cmd.exe" /c slmgr.vbs /ato
