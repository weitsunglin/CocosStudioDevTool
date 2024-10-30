@echo off
setlocal

REM Set paths for Visual Studio and project solution
set "visualStudioPath=F:\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"
set "projectSolution=F:\_project\TMD\SouthPark\ClientCocos\proj.win32\ClientCocos.sln"
set "f5ScriptPath=F:\_project\CocosStudio_DevTool\f5.ahk"

REM Check if Visual Studio is running
tasklist | findstr /I "devenv.exe" > nul
echo %ERRORLEVEL% - ERRORLEVEL after checking for Visual Studio
if %ERRORLEVEL% == 0 (
    REM If Visual Studio is running, call the restart script
    echo Visual Studio is running, calling restartVisualStudio2.bat...
    call restartVisualStudio2.bat
) else (
    REM If Visual Studio is not running, start it and load the project solution
    echo Visual Studio is not running, starting Visual Studio and loading solution...
    start "" "%visualStudioPath%" "%projectSolution%"
    REM Wait a few seconds to allow Visual Studio to start fully
    timeout /t 5 > nul
    REM Run the F5 script to start or continue debugging
    echo Running f5.ahk script...
    start "" "%f5ScriptPath%"
)

endlocal