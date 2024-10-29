@echo off
setlocal

rem Check if Visual Studio is running
tasklist | findstr /I "devenv.exe" > nul
echo %ERRORLEVEL%  - ERRORLEVEL after checking for Visual Studio
if %ERRORLEVEL% == 0 (
    echo Visual Studio is running, sending F5 key...
	call restartVisualStudio2.bat
) else (
    echo Visual Studio is not running, starting it...
    start "" "F:\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "F:\_project\TMD\SouthPark\ClientCocos\proj.win32\ClientCocos.sln"
    timeout /t 5 > nul
	start "" "F:\_project\CocosStudio_DevTool\f5.ahk"
)