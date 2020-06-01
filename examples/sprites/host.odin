package live_reload_demo

import rl "../../raylib"

import "core:fmt"
import "core:os"

import "../shared/plugin"

when os.OS == "windows" do import "../shared/reloader_thread"

screenWidth :i32 = 800;
screenHeight :i32 = 450;

main :: proc() {
    using rl;

    // Create the window
    set_config_flags(
        // TODO: bindings could remove FLAG_ and the like from enums
        ConfigFlag.MSAA_4X_HINT
        | ConfigFlag.VSYNC_HINT
        //| ConfigFlag.FULLSCREEN_MODE
    );

    init_window(screenWidth, screenHeight, "raylib-odin :: sprite example");
    defer close_window();

    set_window_position(40, 40);
    set_target_fps(60);
    init_audio_device();
    defer close_audio_device();

    // Load the plugin
    plugin_funcs : raylib_Funcs;
    rl.get_function_pointers(&plugin_funcs);

    game_dll: plugin.Plugin;
    if !plugin.plugin_load(&game_dll, "bin/sprites_game.dll", &plugin_funcs) {
        fmt.println("error loading bin/sprites_game.dll");
        return;
    }
    defer plugin.plugin_unload(&game_dll);

    // kick off live reload watcher thread
    when os.OS == "windows" {
        reloader := reloader_thread.start("cmd.exe /c scripts\\build_sprites_plugin.bat", "examples");
        defer reloader_thread.finish(reloader);
    }

    // Game loop
    RELOAD_INTERVAL_MS:f32 : 0.25;
    reload_timer := RELOAD_INTERVAL_MS;
    for !window_should_close() {
        force_reload := false;
        #partial switch game_dll.update_and_draw_proc() {
            case .Reload: force_reload = true;
            case .Quit: return;
        }

        needs_reload_check := false;
        if !force_reload {
            reload_timer -= get_frame_time();
            for reload_timer < 0 {
                reload_timer += RELOAD_INTERVAL_MS;
                needs_reload_check = true;
            }
        }

        if needs_reload_check || force_reload {
            plugin.plugin_maybe_reload(&game_dll, &plugin_funcs, force_reload);
        }
    }
}
