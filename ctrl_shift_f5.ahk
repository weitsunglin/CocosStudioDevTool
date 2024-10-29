; 確保窗口在前景
WinActivate, ahk_exe devenv.exe
Sleep, 1000 ; 等待 1 秒
Send, ^+{F5} ; 發送 Ctrl + Shift + F5
