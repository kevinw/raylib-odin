@mkdir bin\temp 2> NUL
call build_bindings.bat && ^
odin build src/game.odin -vet -debug -build-mode=dll -out="bin/game.dll" && ^
odin build src/host.odin -vet -out="bin/host.exe"
