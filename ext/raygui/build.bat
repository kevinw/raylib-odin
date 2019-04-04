@setlocal
@set OUTPUT_FILE=..\..\lib\raygui.lib
@echo.
@echo Compiling...
@echo.
cl /nologo /I. /I ..\..\..\raylib\src /c raygui.c && lib /nologo raygui.obj /out:"%OUTPUT_FILE%"
@echo.
@echo Created "%OUTPUT_FILE%"

