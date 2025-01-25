strcomputer = "." 

Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2") 

Set colItems = objWMIService.ExecQuery("Select * From Win32_NetworkAdapterConfiguration Where IPEnabled = True") 

For Each objitem In colitems 

  strIPAddress = Join(objitem.IPAddress, ",") 

  IP = Split(stripaddress, ",") 

  MsgBox(IP(0)) 

Next 