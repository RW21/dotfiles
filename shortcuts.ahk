

;quit software
^!SC010::Send, !{SC03E}


;+PgUp::Send {WheelUp}

;+PgDn::Send {WheelDown}

^!SC023::
WinActivate, % WinGetAtCoords(100,0)
return

^!SC024::
WinActivate, % WinGetAtCoords(1800,0)
return

^!SC025::
WinActivate, % WinGetAtCoords(2100,0)
return

^!SC026::
WinActivate, % WinGetAtCoords(3800,0)
return


WinGetAtCoords(x,y,what="Title") {     ; by SKAN and Learning one
	; Returns Title/ID/Class/PID of window at given coordinates 
    WinID := DllCall( "GetAncestor", UInt      ; by SKAN
           ,DllCall( "WindowFromPoint", Int,X, Int,Y )
           , UInt, GA_ROOT := 2)
	if (what = "Title" or what = "T") {
		WinGetTitle, WinTitle, ahk_id %WinID%
		Return WinTitle
	}
	else if (what = "ID" or what = "I")
		Return WinID
	else if (what = "Class" or what = "C") {
		WinGetClass, WinClass, ahk_id %WinID%
		Return WinClass
	}
	else if (what = "PID" or what = "P") {
		WinGet, WinPID, PID, ahk_id %WinID%
		Return WinPID
	}
}	; http://www.autohotkey.com/forum/viewtopic.php?p=341120#341120


#IfWinActive

return
