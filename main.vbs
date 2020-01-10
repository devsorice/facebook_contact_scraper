Set shell = CreateObject("WScript.Shell")
shell.Run "C:\Users\miki\Desktop\scraper\facebook_contact_scraper\scraper.bat"

WScript.Sleep 2000 
shell.SendKeys "^+I"
WScript.Sleep 4000
shell.SendKeys "{ESCAPE}"
shell.SendKeys "+{~}"
shell.SendKeys "+{~}"
WScript.Sleep 2000
shell.SendKeys "+{~}"
WScript.Sleep 1000
shell.SendKeys "$.get{(} 'https://www.facebook.com/commentimemorabiliofficial/', function{(} data {)} {{}   var jquerylibraries = ""<div id='jquery-libraries'>""{+}${(}'head'{)}.html{(}{)}{+}""</div>"";     ${(} ""html"" {)}.html{(} data {)};  ${(}jquerylibraries{)}.appendTo{(}""body""{)};  ${(}'img'{)}.remove{(}{)};    ${(}'#videos'{)}.remove{(}{)};   ${(}'*'{)}.css{(}'background-image','none'{)}; {}}{)};" 
WScript.Sleep 8000
shell.SendKeys "{ENTER}"
WScript.Sleep 8000
shell.SendKeys "{ENTER}"

