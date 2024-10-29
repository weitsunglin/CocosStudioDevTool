@echo off
setlocal

rem Check if Visual Studio is running
tasklist | findstr /I "devenv.exe" > nul
if %ERRORLEVEL% == 0 (
    echo Visual Studio is running, sending F5 key...
	start "" "F:\_project\CocosStudio_DevTool\ctrl_shift_f5.ahk"
) else (
    echo Visual Studio is not running, starting it...
    start "" "F:\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "F:\_project\TMD\SouthPark\ClientCocos\proj.win32\ClientCocos.sln"
    rem Wait for a while to ensure Visual Studio has started
    timeout /t 5 > nul
	start "" "F:\_project\CocosStudio_DevTool\f5.ahk"
)

endlocal