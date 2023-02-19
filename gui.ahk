#NoEnv
#SingleInstance force
#MaxThreadsBuffer on
SendMode Input
SetWorkingDir %A_ScriptDir%
DetectHiddenWindows On
SetTitleMatchMode RegEx
if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%" 
    ExitApp
}
Gosub, IniRead

; global variable

; Convert sens to sider format
sider_sen := sens * 10

; GUI
SetFormat, float, 0.1
Gui, Font, S30 CDefault Bold, Verdana
Gui, Add, Text, x71 y-1 w330 h50 , Apex-无后压枪
Gui, Font, ,
Gui, Add, GroupBox, x11 y69 w450 h130 , 设置
Gui, Font, S10 Bold, 
Gui, Add, Text, x162 y89 w50 h30 , 灵敏度:
Gui, Add, Slider, x212 y89 w100 h30 vsider_sen gSlide range0-50 tickinterval1 AltSubmit, %sider_sen%
if (ads_only == "1") {
    Gui, Add, CheckBox, x220 y125 w110 h30 vads_only Checked, ADS模式
} else {
    Gui, Add, CheckBox, x220 y125 w110 h30 vads_only, ADS模式
}
Gui, Add, Text, x162 y160 w120 h30 , 分辨率:
Gui, Font, S10, 
if (resolution == "3840x2160") 
{
    Gui, Add, DropDownList, x225 y155 vresolution, 1280x720|1366x768|1600x900|1680x1050|1728x1080|1920x1080|1920x1200|2560x1440|3840x1440|3840x1600|3840x2160|
} 
else if (resolution == "3840x1600") 
{
    Gui, Add, DropDownList, x225 y155 vresolution, 1280x720|1366x768|1600x900|1680x1050|1728x1080|1920x1080|1920x1200|2560x1440|3840x1440|3840x1600|3840x2160|
} 
else if (resolution == "3840x1440") 
{
    Gui, Add, DropDownList, x225 y155 vresolution, 1280x720|1366x768|1600x900|1680x1050|1728x1080|1920x1080|1920x1200|2560x1440|3840x1440|3840x1600|3840x2160|
} 
else if (resolution == "2560x1440") 
{
    Gui, Add, DropDownList, x225 y155 vresolution, 1280x720|1366x768|1600x900|1680x1050|1728x1080|1920x1080|1920x1200|2560x1440|3840x1440|3840x1600|3840x2160|
} 
else if (resolution == "1920x1200") 
{
    Gui, Add, DropDownList, x225 y155 vresolution, 1280x720|1366x768|1600x900|1680x1050|1728x1080|1920x1080|1920x1200|2560x1440|3840x1440|3840x1600|3840x2160|
} 
else if (resolution == "1920x1080") 
{
    Gui, Add, DropDownList, x225 y155 vresolution, 1280x720|1366x768|1600x900|1680x1050|1728x1080|1920x1080|1920x1200|2560x1440|3840x1440|3840x1600|3840x2160|
} 
else if (resolution == "1728x1080") 
{
    Gui, Add, DropDownList, x225 y155 vresolution, 1280x720|1366x768|1600x900|1680x1050|1728x1080|1920x1080|1920x1200|2560x1440|3840x1440|3840x1600|3840x2160|
} 
else if (resolution == "1680x1050") 
{
    Gui, Add, DropDownList, x225 y155 vresolution, 1280x720|1366x768|1600x900|1680x1050|1728x1080|1920x1080|1920x1200|2560x1440|3840x1440|3840x1600|3840x2160|
} 
else if (resolution == "1600x900") 
{
    Gui, Add, DropDownList, x225 y155 vresolution, 1280x720|1366x768|1600x900|1680x1050|1728x1080|1920x1080|1920x1200|2560x1440|3840x1440|3840x1600|3840x2160|
} 
else if (resolution == "1366x768") 
{
    Gui, Add, DropDownList, x225 y155 vresolution, 1280x720|1366x768|1600x900|1680x1050|1728x1080|1920x1080|1920x1200|2560x1440|3840x1440|3840x1600|3840x2160|
} 
else
{
    Gui, Add, DropDownList, x225 y155 vresolution, 1280x720|1366x768|1600x900|1680x1050|1728x1080|1920x1080|1920x1200|2560x1440|3840x1440|3840x1600|3840x2160|
} 
Gui, Font, S18 Bold, 
Gui, Add, Button, x142 y215 w190 h40 gbtSave, 保存并运行!
Gui, Font, , 
Gui, Add, Link, x180 y265 w400 h18 , 访问 : <a href="https://www.steamcom.cn/">96辅助游戏论坛</a>
ActiveMonitorInfo(X, Y, Width, Height)
xPos := Width / 2 - 477 / 2
yPos := Height / 2 - 335 / 2
Gui, Show, x%xPos% y%yPos% h300 w477, Apex无后压枪脚本 %script_version%
Return

Slide:
    Gui,Submit,NoHide
    sens := sider_sen/10
    tooltip % sens
    SetTimer, RemoveToolTip, 500
return

RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return

IniRead:
    IfNotExist, settings.ini
    {
        MsgBox, Couldn't find settings.ini. I'll create one for you.

        IniWrite, "1920x1080"`n, settings.ini, screen settings, resolution
        IniWrite, "5.0", settings.ini, mouse settings, sens
        IniWrite, "1.0", settings.ini, mouse settings, zoom_sens
        IniWrite, "0"`n, settings.ini, mouse settings, ads_only
        if (A_ScriptName == "gui.ahk") {
            Run "gui.ahk"
        } else if (A_ScriptName == "gui.exe") {
            Run "gui.exe"
        }
    }
    Else {
        IniRead, resolution, settings.ini, screen settings, resolution
        IniRead, sens, settings.ini, mouse settings, sens
        IniRead, ads_only, settings.ini, mouse settings, ads_only
    }
return

btSave:
    Gui, submit
    IniWrite, "%resolution%", settings.ini, screen settings, resolution
    IniWrite, "%sens%", settings.ini, mouse settings, sens
    IniWrite, "%ads_only%", settings.ini, mouse settings, ads_only
    if (A_ScriptName == "gui.ahk") {
        CloseScript("ApexRW16.ahk")
        Run "ApexRW16.ahk"
    } else if (A_ScriptName == "gui.exe") {
        CloseScript("ApexRW16.exe")
        Run "ApexRW16.exe"
    }
ExitApp

CloseScript(Name) {
	DetectHiddenWindows On
	SetTitleMatchMode RegEx
	IfWinExist, i)%Name%.* ahk_class AutoHotkey
		{
		WinClose
		WinWaitClose, i)%Name%.* ahk_class AutoHotkey, , 2
		If ErrorLevel
			return "Unable to close " . Name
		else
			return "Closed " . Name
		}
	else
		return Name . " not found"
	}

ActiveMonitorInfo(ByRef X, ByRef Y, ByRef Width, ByRef Height)
{
    CoordMode, Mouse, Screen
    MouseGetPos, mouseX, mouseY
    SysGet, monCount, MonitorCount
    Loop %monCount% {
        SysGet, curMon, Monitor, %a_index%
        if ( mouseX >= curMonLeft and mouseX <= curMonRight and mouseY >= curMonTop and mouseY <= curMonBottom ) {
            X := curMonTop
            y := curMonLeft
            Height := curMonBottom - curMonTop
            Width := curMonRight - curMonLeft
            return
        }
    }
}

GuiClose:
ExitApp