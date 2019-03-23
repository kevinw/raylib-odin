package bridge_demo

using import "./raylib_types"
using import "./raylib_bridge"

@(export)
on_load :: proc(bridge: ^raylib_Funcs) {
    bridge_init(bridge);
    scarfy = load_texture("resources/scarfy.png");
}

@(export)
on_unload :: proc() {
    bridge_deinit();
    unload_texture(scarfy);
}

scarfy : Texture;

@(export)
update_and_draw :: proc() {
    begin_drawing();
    defer end_drawing();

    clear_background(BLUE);
    draw_texture(scarfy, 20, 60, WHITE);
}
