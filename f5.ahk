; 确保只运行一个实例
#SingleInstance Force

; 查找 Visual Studio 窗口并激活
IfWinExist, ahk_exe devenv.exe
{
    WinActivate ; 激活找到的窗口
    WinWaitActive ; 等待窗口激活
    Sleep, 100 ; 等待一下确保窗口准备好
    Send, {F5} ; 发送 F5 键
}
else
{
    MsgBox, Visual Studio 没有运行.
}
