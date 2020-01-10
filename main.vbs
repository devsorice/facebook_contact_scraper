Set shell = CreateObject("WScript.Shell")
shell.Run "scraper.bat"

WScript.Sleep 1000 
shell.SendKeys "^+I"
WScript.Sleep 500
shell.SendKeys "{ESCAPE}"
WScript.Sleep 1000
shell.SendKeys "CIAO{ENTER}"
WScript.Sleep 1000
shell.SendKeys "$.get"
WScript.Sleep 1000
shell.SendKeys "{(}'https://www.facebook.com/commentimemorabiliofficial/'{)};"
WScript.Sleep 1000
shell.SendKeys "{ENTER}"
WScript.Sleep 1000
shell.SendKeys "{ENTER}"