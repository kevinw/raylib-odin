package host_demo

using import "../generated/raylib_types"
using import "../generated/raylib_bindings"

import "core:fmt"

using import "./plugin"

main :: proc() {
    screenWidth :i32 = 800;
    screenHeight :i32 = 450;

    set_config_flags(ConfigFlag.FLAG_MSAA_4X_HINT | ConfigFlag.FLAG_VSYNC_HINT);

    init_window(screenWidth, screenHeight, "game");
    set_window_position(40, 40);
    set_target_fps(60);
    init_audio_device();

    plugin_funcs : raylib_types.raylib_Funcs;
    raylib_bindings.get_function_pointers(&plugin_funcs);

    plugin: Plugin;
    if !plugin_load(&plugin, "bin/game.dll", &plugin_funcs) {
        fmt.println("error loading bin/game.dll");
        return;
    }

    for !window_should_close() {
        plugin.update_and_draw_proc();
        plugin_maybe_reload(&plugin, &plugin_funcs);
    }

    plugin_unload(&plugin);
    close_audio_device();
    close_window();
}
