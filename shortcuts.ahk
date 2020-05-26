#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;volume
!SC057::SoundSet, -1
!SC058::SoundSet, +1
!SC043::SoundSet, -4
!SC044::SoundSet, +4

;pause
^SC043::Media_Prev
^SC044::Media_Play_Pause
^SC057::Media_Next


;quit software
^!SC010::Send, !{SC03E}


+PgUp::Send {WheelUp}

+PgDn::Send {WheelDown}


#IfWinActive

return


