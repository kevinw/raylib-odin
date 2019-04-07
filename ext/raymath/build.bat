@setlocal
@set OUTPUT_FILE=..\lib\raymath.lib
@echo.
@echo Compiling...
@echo.
cl /nologo /I. /I ..\..\..\raylib\src /c raymath.c && lib /nologo raymath.obj /out:"%OUTPUT_FILE%"
@echo.
@echo Created "%OUTPUT_FILE%"

