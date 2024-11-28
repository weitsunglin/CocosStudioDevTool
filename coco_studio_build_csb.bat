@echo off
REM Author: weitsunglin

REM Set project root directory and resource paths
set "projectRoot=F:\_project\TMD"
set "cocosStudioPath=%projectRoot%\CocosStudio_Inanna\CocoStudioProject\Inanna"
set "outputPath=%projectRoot%\Inanna\InannaResource\Inanna"

REM Get user input to determine the scope of resources to process
set /p userInput="input ALL or module name: "

echo Starting to build cocos resources...
"F:\Cocos\Cocos Studio\Cocos.Tool.exe" publish -d Serializer_FlatBuffers -f "%cocosStudioPath%\Inanna.ccs" -o res > nul 2>&1

echo Starting to copy resources...

REM Determine the next steps based on the build result and user input
if %ERRORLEVEL% equ 0 (
    echo Build succeeded
    if /i "%userInput%"=="ALL" (
        echo Copying all resources...

        REM Remove old Inanna resources and copy all new content
        rmdir /s /q "%outputPath%\"
        xcopy "%cocosStudioPath%\res\*" "%outputPath%\" /e /i /y
        xcopy "%cocosStudioPath%\cocosstudio\*" "%outputPath%\" /e /i /y

        REM Delete unnecessary files
        del /s /q "%outputPath%\*.csd"
        del /s /q "%outputPath%\*.udf"
		del /s /q "%outputPath%\*.csi"
    ) else (
        echo Copying specific module resources...

        REM Remove old module resources and copy specified module content
        rmdir /s /q "%outputPath%\%userInput%"
        xcopy "%cocosStudioPath%\res\%userInput%" "%outputPath%\%userInput%" /e /i /y
        xcopy "%cocosStudioPath%\cocosstudio\%userInput%\*" "%outputPath%\%userInput%\" /e /i /y
		
        REM Delete unnecessary files in the specified module
        del /s /q "%outputPath%\%userInput%\*.csd"
        del /s /q "%outputPath%\%userInput%\*.udf"
		del /s /q "%outputPath%\%userInput%\*.csi"
    )

    REM Run the next batch file
    call start_ffs_batch.bat
) else (
    echo Build failed
)

if exist "%cocosStudioPath%\res" (
    echo Cleaning past cocos resources...
    rd /S /Q "%cocosStudioPath%\res"
) else (
    echo No previous cocos resources found.
)