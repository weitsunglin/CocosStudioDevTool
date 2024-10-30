@echo off
setlocal

REM Set paths for resources and batch scripts
set "ffsBatchScript=inanna.ffs_batch"
set "restartScript=F:\_project\CocosStudio_DevTool\restartVisualStudio.bat"

echo Starting to copy resources...

REM Run the ffs batch script and wait for it to finish
start /wait "" "%ffsBatchScript%"

echo Starting Visual Studio restart...

REM Run the restartVisualStudio script
"%restartScript%"

endlocal