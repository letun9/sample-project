#SingleInstance Force
#Persistent
CoordMode, Mouse, Client
CoordMode, Pixel, Client
s1 := "V8_7600_015_001"
s2 := "V8_7602_012_001"
s3 := "V8_7601_017_001"


		Gui +LastFound
		Gui, Add, Text,, Numpad+:
		Gui, Add, Edit, vA
		Gui, Add, Button, w70 h30, OK
		Gui, Show, w175 h90
		
	return
	
ButtonOK:
		Gui, Submit, nohide
	return
	
NumpadAdd::
		{
			Sleep, 70
			Send %A%
			Return
		}	

PerformAction(title, delay := 100) 
{
    IfWinExist, %title%
    {
        WinActivate
        Sleep, 100
	}
}

F3::
    PerformAction(s1)
			Send, ^g
			Sleep, 50
			Send, E1{Enter}
			Sleep, 50
			Send, {F2}
			Sleep, 50
			Send, ^+{Up}
			Sleep, 50
			Send, ^c
			Sleep, 50
    PerformAction(s2)
			Sleep, 50
			Send, ^g
			Sleep, 50
			Send, E1{Enter}
			Sleep, 50
			Send, {F2}
			Sleep, 50	
			Send, ^+{Up}
			Sleep, 50
			Send, ^v
			Sleep, 50
    PerformAction(s3)
			Sleep, 50
			Send, ^g
			Sleep, 50
			Send, C3{Enter}
			Sleep, 50
			Send, {F2}
			Sleep, 50	
			Send, ^+{Up}
			Sleep, 50
			Send, ^v
			Sleep, 50
			WinActivate, %s1%
			Send, ^g
			Sleep, 50
			Send, F6{Enter}
	
return


F4::
	WinGetTitle, activeWinTitle, A
	If InStr(activeWinTitle, "V8_7600_015_001")
		{
			WinActivate, %s2%
			Send, ^g
			Sleep, 50
			Send, D5
			Send {Enter}
			
		}
	Else If InStr(activeWinTitle, "V8_7602_012_001")
		{
			WinActivate, %s3%
			Send, ^g
			Sleep, 50
			Send, F6
			Sleep, 50
			Send {Enter}
		}
	Else If InStr(activeWinTitle, "V8_7601_017_001")
		{
			WinActivate, %s1%
			Send, ^g
			Send, ^g
			Sleep, 50
			Send, F6
			Sleep, 50
			Send {Enter}
		}
	return
	
PerformClick(x, y) {
    Click, %x%, %y%
    Sleep, 1000
	}

CheckAndPerformAction(x, y, title)
	{
		PixelGetColor, color, %x%, %y%
		WinGetTitle, activeWinTitle, A
		If InStr(activeWinTitle, "V8_7600_015_001")
			{
				PixelGetColor, checkColor, 280, 470
				if (checkColor = 0x00B0F0)
					{
						WinActivate, V8_7600_015_001
						Send, ^{F2}
						Sleep, 2300
						Send, {Enter}
						Sleep, 2000
						PerformClick(420, 420) 		;2V8.7600.015.001(w=831, h=517)
						WinActivate, V8_7602_012_001
						Send, ^g
						Sleep, 50
						Send, D5
						Send {Enter}
					}
			}		
		else if InStr(activeWinTitle, "V8_7602_012_001")
			{
				PixelGetColor, checkColor, 350, 170
				if (checkColor = 0x0070C0)
					{
						WinActivate, V8_7602_012_001
						Send, ^{F2}
						Sleep, 2300
						Send, {Enter}
						Sleep, 2000
						PerformClick(160, 160)		;2V8.7602.012.001(w=831, h=517)
						WinActivate, V8_7601_017_001
						Send, ^g
						Sleep, 50
						Send, F6
						Sleep, 50
						Send {Enter}
					}
			}
		else if InStr(activeWinTitle, "V8_7601_017_001")
			{
				PixelGetColor, checkColor, 380, 350
				if (checkColor = 0x00B0F0)
					{
						WinActivate, V8_7601_017_001
						Send, ^{F2}
						Sleep, 2300
						Send, {Enter}
						Sleep, 2000
						PerformClick(600, 350)		;2V8.7601.017.001(w=831, h=517)
						WinActivate, V8_7600_015_001
						Send, ^g
						Sleep, 50
						Send, E1
						Sleep, 50
						Send {Enter}
						Sleep, 500
						Send, {F2}
					}
			}
	}


return
	
GuiClose:
	ExitApp