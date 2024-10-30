; 確保只運行一個實例 如果腳本已在運行，則當前的新實例將取代舊的，避免重複執行。
#SingleInstance Force

; 查找 Visual Studio 視窗並激活
IfWinExist, ahk_exe devenv.exe
{
    WinActivate ; 激活找到的視窗，確保它在前台
    WinWaitActive ; 等待視窗激活完成，避免後續指令過早執行
    Sleep, 100 ; 暫停 100 毫秒，確保視窗完全準備好
    Send, ^+{F5} ; 發送 Ctrl+Shift+F5 組合鍵，通常用於在 Visual Studio 中重新啟動調試
}
else
{
    MsgBox, Visual Studio 沒有運行. ; 若找不到 Visual Studio 視窗，顯示消息框提示
}