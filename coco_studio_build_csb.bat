@echo off
REM Author: weitsunglin

set /p userInput="input ALL or module name: "

echo clean past cocos resources...

rd /S /Q "F:\_project\TMD\CocosStudio_Inanna\CocoStudioProject\Inanna\res"

echo Start building cocos resources...

"F:\Cocos\Cocos Studio\Cocos.Tool.exe" publish -d Serializer_FlatBuffers -f "F:\_project\TMD\CocosStudio_Inanna\CocoStudioProject\Inanna\Inanna.ccs" -o res > nul 2>&1

echo Start copy  resources...

if %ERRORLEVEL% equ 0 (
    echo Success
    if /i "%userInput%"=="ALL" (
		echo Start copy ALL resources...
        rmdir /s /q "F:\_project\TMD\Inanna\InannaResource\Inanna\"
        xcopy "F:\_project\TMD\CocosStudio_Inanna\CocoStudioProject\Inanna\res\*" "F:\_project\TMD\Inanna\InannaResource\Inanna\" /e /i /y
		xcopy "F:\_project\TMD\CocosStudio_Inanna\CocoStudioProject\Inanna\cocosstudio\*" "F:\_project\TMD\Inanna\InannaResource\Inanna\" /e /i /y
		del /s /q "F:\_project\TMD\Inanna\InannaResource\Inanna\*.csd"
		del /s /q "F:\_project\TMD\Inanna\InannaResource\Inanna\*.udf"
		
    ) else (
		echo Start copy specific resources...
        rmdir /s /q "F:\_project\TMD\Inanna\InannaResource\Inanna\%userInput%"
        xcopy "F:\_project\TMD\CocosStudio_Inanna\CocoStudioProject\Inanna\res\%userInput%" "F:\_project\TMD\Inanna\InannaResource\Inanna\%userInput%" /e /i /y
		xcopy "F:\_project\TMD\CocosStudio_Inanna\CocoStudioProject\Inanna\cocosstudio\%userInput%\*" "F:\_project\TMD\Inanna\InannaResource\Inanna\%userInput%\" /e /i /y
		del /s /q "F:\_project\TMD\Inanna\InannaResource\Inanna\%userInput%\*.csd"
		del /s /q "F:\_project\TMD\Inanna\InannaResource\Inanna\%userInput%\*.udf"
    )
    call start_ffs_batch.bat
) else (
    echo Failed
)
