#cs ----------------------------------------------------------------------------
 AutoIt Version: 3.3.16.0
 Author:         #IAmMajor
 Script Function:
	autoClick while mouse color is on toggle.
#ce ----------------------------------------------------------------------------

$color = getColor()
$pause = True
HotKeySet("{end}", "stop")
HotKeySet("{pause}", "pause")

Func pause()
	If ($pause) Then
		$color = getColor()
		$pause = False
	Else
		$pause = True
	EndIf
EndFunc   ;==>pause

Func stop()
	Exit
EndFunc   ;==>stop

Func getColor()
	Local $aPos = MouseGetPos()
	Return PixelGetColor($aPos[0], $aPos[1])
EndFunc   ;==>getColor

Func setColor()
	Local $aPos = MouseGetPos()
	$color = PixelGetColor($aPos[0], $aPos[1])
	Return PixelGetColor($aPos[0], $aPos[1])
EndFunc   ;==>setColor


While 1
	If (Not $pause) Then
		If (getColor() == $color) Then
			MouseClick("Primary")
		Else
			Sleep(10)
		EndIf
	Else
		Sleep(1000)
	EndIf
WEnd
