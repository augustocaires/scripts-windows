Const ForReading = 1
Const ADS_SCOPE_SUBTREE = 2

Set objConnection = CreateObject("ADODB.Connection")
Set objCommand =   CreateObject("ADODB.Command")
objConnection.Provider = "ADsDSOObject"
objConnection.Open "Active Directory Provider"
Set objCommand.ActiveConnection = objConnection

objCommand.Properties("Page Size") = 1000
objCommand.Properties("Searchscope") = ADS_SCOPE_SUBTREE



nome =     InputBox("Coloque o nome do usuario" & _
    vbCrLf & "(Ex: Joao)", , "Joao")

If nome = "" Then WScript.Quit(1)       
   objCommand.CommandText = _
       "SELECT name,distinguishedname,instanceType FROM 'LDAP://dc=domain,dc=local ' " & _
       "WHERE objectCategory='user' AND Name = '*" & nome & "*'"  

   Set objRecordSet = objCommand.Execute

   Do Until objRecordSet.EOF
      wscript.echo objRecordSet.Fields("distinguishedname").Value
      objRecordSet.MoveNext
   Loop