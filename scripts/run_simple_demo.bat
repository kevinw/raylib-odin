@mkdir bin 2> NUL
odin run examples\simple_demo\simple_demo.odin -out="bin/simple_demo.exe" || exit /b 1
