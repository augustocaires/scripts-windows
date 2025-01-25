strComputer = "."
nCont = 0
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
Set colPings = objWMIService.ExecQuery ("Select * From Win32_PingStatus where Address = '192.168.0.222'")
Do
   For Each objStatus in colPings
       If IsNull(objStatus.StatusCode) _
          or objStatus.StatusCode<>0 Then
       nCont = nCont + 1
       End If
       if nCont >= 3 Then
           WScript.Echo "Não está pingando"
       nCont = 0
       End if
   Next
 'EXECUTAR A CADA 5 SEGUNDOS
  wscript.sleep (5000)
Loop