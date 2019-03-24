@mkdir generated\raylib_bindings 2> NUL
@mkdir generated\raylib_bridge 2> NUL
@mkdir generated\raylib_types 2> NUL

odin build src/generate_bindings.odin -out="bin/generate_bindings.exe" && ^
bin\generate_bindings
