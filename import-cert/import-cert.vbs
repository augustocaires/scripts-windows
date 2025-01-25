Set oShell = CreateObject ("Wscript.Shell")
Dim strArgs
strArgs = "cmd /c \\servidor\SYSVOL\domain.local\scripts\import-cert.bat"
oShell.Run strArgs, 0, false
