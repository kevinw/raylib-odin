@mkdir raylib_bindings 2> NUL
@mkdir raylib_bridge 2> NUL
@mkdir raylib_types 2> NUL

odin build generator/generate_bindings.odin -out="bin/generate_bindings.exe" && ^
bin\generate_bindings || exit /b 1
