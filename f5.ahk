; 確保只運行一個實例
#SingleInstance Force

; 查找 Visual Studio 視窗並激活
IfWinExist, ahk_exe devenv.exe
{
    WinActivate ; 激活找到的視窗，使其位於前台
    WinWaitActive ; 等待視窗完全激活，以便後續操作
    Sleep, 100 ; 等待 100 毫秒，確保視窗已準備好接收按鍵
    Send, {F5} ; 發送 F5 鍵，用於 Visual Studio 中的啟動或繼續調試
}
else
{
    MsgBox, Visual Studio 沒有運行. ; 若找不到 Visual Studio 視窗，顯示提示訊息
}
