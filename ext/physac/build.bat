@setlocal
@set INPUT_FILE=physac.c
@set OUTPUT_FILE=..\lib\physac.lib
@echo.
@echo Compiling...
@echo.
cl /nologo /I. /I ..\..\..\raylib\src /O2 /c physac.c && lib /nologo physac.obj /out:"%OUTPUT_FILE%" || exit /b 1
@echo.
@echo Created "%OUTPUT_FILE%"

