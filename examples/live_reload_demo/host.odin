package live_reload_demo

using import "../../raylib_types"
using import "../../raylib_bindings"

import "core:fmt"
import "core:os"

using import "./plugin"

when os.OS == "windows" do import "./reloader_thread"

screenWidth :i32 = 800;
screenHeight :i32 = 450;

main :: proc() {
    // Create the window
    set_config_flags(
        // TODO: bindings could remove FLAG_ and the like from enums
        ConfigFlag.FLAG_MSAA_4X_HINT
        | ConfigFlag.FLAG_VSYNC_HINT
        //| ConfigFlag.FLAG_FULLSCREEN_MODE
    );

    init_window(screenWidth, screenHeight, "raylib-odin :: live reload example");
    defer close_window();

    set_window_position(40, 40);
    set_target_fps(60);
    init_audio_device();
    defer close_audio_device();

    // Load the plugin
    plugin_funcs : raylib_types.raylib_Funcs;
    raylib_bindings.get_function_pointers(&plugin_funcs);

    plugin: Plugin;
    if !plugin_load(&plugin, "bin/game.dll", &plugin_funcs) {
        fmt.println("error loading bin/game.dll");
        return;
    }
    defer plugin_unload(&plugin);

    // kick off live reload watcher thread
    when os.OS == "windows" {
        reloader := reloader_thread.start("cmd.exe /c scripts\\build_live_reload_plugin.bat", "examples\\live_reload_demo");
        defer reloader_thread.finish(reloader);
    }

    // Game loop
    for !window_should_close() {
        force_reload := false;
        switch plugin.update_and_draw_proc() {
            case .Reload: force_reload = true;
            case .Quit: return;
        }
        plugin_maybe_reload(&plugin, &plugin_funcs, force_reload);
    }
}
