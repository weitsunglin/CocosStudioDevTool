@echo off
REM Author: weitsunglin

set /p userInput="input ALL or module name: "

echo Start building cocos resources...

"F:\Cocos\Cocos Studio\Cocos.Tool.exe" publish -d Serializer_FlatBuffers -f "F:\_project\TMD\CocosStudio_Inanna\CocoStudioProject\Inanna\Inanna.ccs" -o res > nul 2>&1

echo Start copy  resources...

if %ERRORLEVEL% equ 0 (
    echo Success

    if /i "%userInput%"=="ALL" (
        rmdir /s /q "F:\_project\TMD\Inanna\InannaResource\Inanna\"
        xcopy "F:\_project\TMD\CocosStudio_Inanna\CocoStudioProject\Inanna\res\*" "F:\_project\TMD\Inanna\InannaResource\Inanna\" /e /i /y
    ) else (
        rmdir /s /q "F:\_project\TMD\Inanna\InannaResource\Inanna\%userInput%"
        xcopy "F:\_project\TMD\CocosStudio_Inanna\CocoStudioProject\Inanna\res\%userInput%" "F:\_project\TMD\Inanna\InannaResource\Inanna\%userInput%" /e /i /y
    )

    call start_ffs_batch.bat
) else (
    echo Failed
)