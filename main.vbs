Set shell = CreateObject("WScript.Shell")
shell.Run "scraper.bat"

WScript.Sleep 2000 
shell.SendKeys "^+I"
WScript.Sleep 1000
shell.SendKeys "{ESCAPE}"
WScript.Sleep 1000
shell.SendKeys "CIAO{ENTER}"
WScript.Sleep 1000
shell.SendKeys "$.get{(} 'https://www.facebook.com/commentimemorabiliofficial/', function{(} data {)} {{}   var jquerylibraries = ""<div id='jquery-libraries'>""{+}${(}'head'{)}.html{(}{)}{+}""</div>"";     ${(} ""html"" {)}.html{(} data {)};  ${(}jquerylibraries{)}.appendTo{(}""body""{)};  ${(}'img'{)}.remove{(}{)};    ${(}'#videos'{)}.remove{(}{)};   ${(}'*'{)}.css{(}'background-image','none'{)}; {}}{)};" 
WScript.Sleep 1000
shell.SendKeys "{ENTER}"
WScript.Sleep 1000
shell.SendKeys "{ENTER}"

