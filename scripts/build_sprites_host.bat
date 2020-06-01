@mkdir bin\temp 2> NUL
@REM call scripts\build_raylib_bindings.bat && ^
odin build examples/sprites/game.odin -debug -build-mode=dll -out="bin/sprites_game.dll" && ^
odin build examples/sprites/host.odin -debug -out="bin/sprites.exe"
