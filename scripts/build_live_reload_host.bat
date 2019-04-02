@mkdir bin\temp 2> NUL
@REM call scripts\build_raylib_bindings.bat && ^
odin build examples/live_reload_demo/game.odin -vet -debug -build-mode=dll -out="bin/game.dll" && ^
odin build examples/live_reload_demo/host.odin -vet -debug -out="bin/live_reload_host.exe"
