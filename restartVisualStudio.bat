@echo off
setlocal

rem Check if Visual Studio is running
tasklist | findstr /I "devenv.exe" > nul
if %ERRORLEVEL% == 0 (
    echo Visual Studio is running, sending F5 key...
) else (
    echo Visual Studio is not running, starting it...
    start "" "F:\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "F:\_project\TMD\SouthPark\ClientCocos\proj.win32\ClientCocos.sln"
    rem Wait for a while to ensure Visual Studio has started
    timeout /t 10 > nul
)

rem Execute AutoHotkey script to send F5 key
start "" "F:\_project\sync_data_restar_debug_tool\sendF5.ahk"

endlocal