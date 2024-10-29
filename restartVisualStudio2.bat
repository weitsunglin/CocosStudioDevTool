@echo off
setlocal


tasklist | findstr /I "SouthPark.exe" > nul
echo %ERRORLEVEL%  - ERRORLEVEL after checking for SouthPark.exe
if %ERRORLEVEL% == 0 (
    echo SouthPark.exe is running...
	start "" "F:\_project\CocosStudio_DevTool\ctrl_shift_f5.ahk"
) else (
    echo SouthPark.exe is not running...
	start "" "F:\_project\CocosStudio_DevTool\f5.ahk"
)

endlocal