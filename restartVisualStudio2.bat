@echo off
setlocal

REM Set paths for ahk scripts
set "ctrlShiftF5Script=F:\_project\CocosStudio_DevTool\ctrl_shift_f5.ahk"
set "f5Script=F:\_project\CocosStudio_DevTool\f5.ahk"

REM Check if SouthPark.exe is running
tasklist | findstr /I "SouthPark.exe" > nul
echo %ERRORLEVEL% - ERRORLEVEL after checking for SouthPark.exe
if %ERRORLEVEL% == 0 (
    REM If SouthPark.exe is running, execute ctrl_shift_f5.ahk
    echo SouthPark.exe is running...
    start "" "%ctrlShiftF5Script%"
) else (
    REM If SouthPark.exe is not running, execute f5.ahk
    echo SouthPark.exe is not running...
    start "" "%f5Script%"
)

endlocal
