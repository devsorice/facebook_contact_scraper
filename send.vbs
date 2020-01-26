Sub CopyFileIntoClipboard(filename)
	Set WshShell=CreateObject("WScript.Shell")
	CreateObject("WScript.Shell").Run("notepad.exe " & filename)
	WScript.Sleep 800 
	WshShell.SendKeys "^a" 
	WshShell.SendKeys "^c"
	WScript.Sleep 800 
End Sub

Sub  MacroSendToConsole(str)
	Set shell=CreateObject("WScript.Shell")
	shell.SendKeys "p"
	'Confirm()
	OpenConsoleLongerMethod(shell)
	'Confirm()
	WScript.Sleep 100	
	shell.SendKeys "^v"
	WScript.Sleep 100	
	shell.SendKeys "{ENTER}"
End Sub


Sub OpenConsoleShorterMethod(shell)
	WScript.Sleep 1000 
	shell.SendKeys "^+I"
	WScript.Sleep 1000
	shell.SendKeys "+{~}"
	WScript.Sleep 1000
End Sub


Sub OpenConsoleLongerMethod(shell)
    WScript.Sleep 2000 
    shell.SendKeys "+{F10}"
	WScript.Sleep  1000
	shell.SendKeys "{UP}"
	WScript.Sleep  500
	shell.SendKeys "{ENTER}"
	WScript.Sleep  4000
	shell.SendKeys "+{~}"
	WScript.Sleep  900	
	shell.SendKeys "{ESCAPE}"
	WScript.Sleep  900
	shell.SendKeys "{ESCAPE}"
End Sub


Sub Confirm()
	a = MsgBox("Sei sicuro?",1,"Choose options")
	If a=2 Then
		WScript.Quit
	End If
End Sub

Sub  MacroPaste()
	Set shell=CreateObject("WScript.Shell")
	shell.SendKeys "^v"
	WScript.Sleep 1000
	shell.SendKeys "{ENTER}" 
End Sub


Sub TypeKeys(str)
	Set shell=CreateObject("WScript.Shell")
	Dim i, toSend,specialChar,cur, md
	toSend = ""
	cur = ""
	specialChar = "false"

	For i=1 To Len(str)
		Do
		   md = Mid(str,i,1)
		   If md="j" Then
		   	 shell.SendKeys "{{}"
		   	 toSend=""
		   Exit Do
		   ElseIf md="g" Then
		   	 shell.SendKeys "{}}"
		   	 toSend=""
		   Exit Do
		   ElseIf md="1" Then
		   	 shell.SendKeys """"
		   	 toSend=""
		   Exit Do
		   Else
		   	cur = md
		   End If
		   
		   toSend =  toSend & cur

		   If md="}" Then
		   	specialChar="false"
		   End If
		  
		   If md="{" OR specialChar="true" Then
		   	specialChar="true"
		    Exit Do
		   End If

		   shell.SendKeys toSend
		   toSend=""
		   cur=""
		   WScript.Sleep 60
		   Exit Do
		Loop
	Next 
End Sub


Function LoadFile(flnm)
	If flnm = "" then
		Set wShell=CreateObject("WScript.Shell")
		Set oExec=wShell.Exec("mshta.exe ""about:<input type=file id=FILE><script>FILE.click();new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);close();resizeTo(0,0);</script>""")
		flnm = oExec.StdOut.ReadLine
	End If

	Set osf = CreateObject("Scripting.FileSystemObject")
	Set fl = osf.OpenTextFile(flnm)
	LoadFile= fl.readline
End Function


Dim actionFile 
'actionFile = LoadFile("inject\send.js.jsc")

CopyFileIntoClipboard("E:\scraper\facebook_contact_scraper\inject\send.js")

Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.OpenTextFile("users\facebook_commenti_memorabili")
Dim i,max
i = 0
start = 500
max = 100

Do Until f.AtEndOfStream
  If i < start Then
  	i = i + 1
  	f.ReadLine
  Else
  	Dim mystring
	mystring = "https://www.facebook.com/messages/t/" & f.ReadLine
	CreateObject("WScript.Shell").Run(mystring)
	'CreateObject("WScript.Shell").Run("https://www.facebook.com/messages/t/francesco.sorice.58")
	WScript.Sleep 10000 
	'MacroPaste()
	MacroSendToConsole("")
	'MacroSendToConsole(actionFile)
	i = i + 1

	If i > start+max Then
		WScript.Quit
	End If 
  End If 
Loop
