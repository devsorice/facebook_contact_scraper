Function CompileJSC(str)
    Set re = New RegExp
    re.Pattern = "^\s+|\s+$"
    re.Global  = True
    str = re.Replace(str, "")
    re.Pattern = "\t+"
    str = re.Replace(str, "")
    str = Replace(str,"{","j")
	str = Replace(str,"}","g")
    str = Replace(str,"(","{(}")
	str = Replace(str,")","{)}")
	str = Replace(str,"  "," ")
	str = Replace(str,"""","1")
	str = Replace(str, vbCrlf,"")
	CompileJSC = str
End Function

Set wShell=CreateObject("WScript.Shell")
Set oExec=wShell.Exec("mshta.exe ""about:<input type=file id=FILE><script>FILE.click();new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);close();resizeTo(0,0);</script>""")
filename = oExec.StdOut.ReadLine

Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.OpenTextFile(filename)

Dim mystring

Do Until f.AtEndOfStream  
  mystring = mystring & f.ReadLine
Loop

mystring = CompileJSC(mystring)

Set objFSO=CreateObject("Scripting.FileSystemObject")

' How to write file
outFile=filename & ".jsc"
Set objFile = objFSO.CreateTextFile(outFile,True)
objFile.Write mystring
objFile.Close