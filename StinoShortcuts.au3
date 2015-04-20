;#32768

#include <MsgBoxConstants.au3>


Global $g_bPaused = False
Global $monitor = 0
Global $delay = 100

HotKeySet("{PAUSE}", "HotKeyPressed") ;Pause script
HotKeySet("!{F5}", "HotKeyPressed") ;Compile
HotKeySet("!{F6}", "HotKeyPressed") ;Upload
HotKeySet("!{F7}", "HotKeyPressed") ;MonitorToggle
;HotKeySet("!{F8}", "HotKeyPressed")
HotKeySet("!{F8}", "HotKeyPressed") ;End Script
HotKeySet("!{F9}", "HotKeyPressed") ;Source 1
HotKeySet("!{F10}", "HotKeyPressed") ;Source 2

While 1
    Sleep($delay)
WEnd


Func Compile()

	WinActivate("[CLASS:PX_WINDOW_CLASS]")
	sleep($delay)
	Send("!a")
	sleep($delay)
	Send("u")
	sleep($delay)
	;Send("u")
	sleep($delay)
	Send("{UP}")
	sleep($delay)
	Send("{ENTER}")

EndFunc

Func Upload()

	WinActivate("[CLASS:PX_WINDOW_CLASS]")
	sleep($delay)
	Send("!a")
	sleep($delay)
	Send("u")
	sleep($delay)
	;Send("u")
	sleep($delay)
	Send("{ENTER}")

EndFunc

Func MonitorToggle()

	WinActivate("[CLASS:PX_WINDOW_CLASS]")
	sleep($delay)
	Send("!a")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("{RIGHT}")
	sleep($delay)
	Send("{ENTER}")

	;$monitor = 1

EndFunc

Func MonitorSend()

	WinActivate("[CLASS:PX_WINDOW_CLASS]")
	sleep($delay)
	Send("!a")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("{RIGHT}")
	sleep($delay)
	Send("{DOWN}")
	sleep($delay)
	Send("{ENTER}")

	;$monitor = 1

EndFunc


#cs ----------------------------------------------------------------------------

Func MonitorOFF()

	WinActivate("[CLASS:PX_WINDOW_CLASS]")
	sleep($delay)
	Send("!a")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("{RIGHT}")
	sleep($delay)
	Send("{ENTER}")

	$monitor = 0

EndFunc

#ce ----------------------------------------------------------------------------
Func Source1()

	WinActivate("[CLASS:PX_WINDOW_CLASS]")
	sleep($delay)
	Send("!a")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("{RIGHT}")
	sleep($delay)
	Send("{DOWN}")
	sleep($delay)
	Send("{ENTER}")

EndFunc

Func Source2()

	WinActivate("[CLASS:PX_WINDOW_CLASS]")
	sleep($delay)
	Send("!a")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("s")
	sleep($delay)
	Send("{RIGHT}")
	sleep($delay)
	Send("{DOWN}")
	sleep($delay)
	Send("{DOWN}")
	sleep($delay)
	Send("{ENTER}")

EndFunc


Func HotKeyPressed()
    Switch @HotKeyPressed ; The last hotkey pressed.
        Case "{PAUSE}" ; String is the {PAUSE} hotkey.
            $g_bPaused = Not $g_bPaused
            While $g_bPaused
                Sleep($delay)
                ToolTip('Script is "Paused"', 0, 0)
            WEnd
            ToolTip("")

        Case "!{F12}" ; String is the {ESC} hotkey.
            Exit

		Case "!{F5}"
			ToolTip('Compiling', 0, 0)
			Call("Compile")

		Case "!{F6}"
			ToolTip('Uploading', 0, 0)
			Call("Upload")

		Case "!{F7}"
			;if $monitor == 0 Then
				ToolTip('MonitorToggle', 0, 0)
				Call("MonitorToggle")
			;endif

		 Case "!{F8}"
			ToolTip('MonitorSend', 0, 0)
			Call("MonitorSend")

		#cs Case "!{F8}"
			if $monitor == 1 Then
				ToolTip('Monitor OFF', 0, 0)
				Call("MonitorOFF")
		#ce	endif

		Case "!{F9}"
			ToolTip('Source 1', 0, 0)
			Call("Source1")

		Case "!{F10}"
			ToolTip('Source 2', 0, 0)
			Call("Source2")

        ;Case "+!d" ; String is the Shift-Alt-d hotkey.
        ;    MsgBox($MB_SYSTEMMODAL, "", "This is a message.")

    EndSwitch

	ToolTip("")
EndFunc   ;==>HotKeyPressed

