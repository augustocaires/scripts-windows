Set WshNetwork = CreateObject("WScript.Network")
WshNetwork.AddWindowsPrinterConnection "\\servidor\Impressora01"
WshNetwork.AddWindowsPrinterConnection "\\servidor\Impressora02"

wscript.quit

Set WshNetwork = CreateObject("WScript.Network")

WshNetwork.SetDefaultPrinter "Impressora01"

wscript.quit
