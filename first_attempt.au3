#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
;#include <plink_wrapper.au3>
#include <Array.au3>

Global $uchwyt_command_lina = Run(@ComSpec & " /c " & 'reg query HKLM\HARDWARE\DEVICEMAP\SERIALCOMM', "", @SW_HIDE, $STDOUT_CHILD)

Global $port_list = []

While 1
    $line = StdoutRead($uchwyt_command_lina)
    If @error Then ExitLoop

	if(StringInStr($line,"COM") And StringInStr($line,"COMM")==0) Then
	$pozycja_stringu = StringInStr($line,"COM")
	$line =  StringTrimLeft($line,$pozycja_stringu-1)
	ConsoleWrite($line & " " & StringLen($line)& @CRLF)
    _ArrayAdd($port_list,StringStripWS ( $line, $STR_STRIPALL))
	EndIf
Wend

ConsoleWrite("List contain: " &UBound($port_list)& " elements" &@CRLF)
ConsoleWrite("Wydruk z konsoli " & @CRLF)

for $port in $port_list
	if(StringLen($port)<>0) Then
	ConsoleWrite($port & " " & StringLen($port)&  @CRLF)
	EndIf
	Next