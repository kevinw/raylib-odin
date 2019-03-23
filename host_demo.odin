package host_demo

import "./raylib_types"
using import "./raylib_bindings"

import "core:os"
import "core:fmt"

when os.OS == "windows" do import "core:sys/win32"

get_file_time :: proc(filename: string) -> (bool, os.File_Time) {
    fd, err := os.open(filename);
    if err != os.ERROR_NONE do return false, 0;
    defer os.close(fd);

    file_time, err2 := os.last_write_time(fd);
    if err2 != os.ERROR_NONE do return false, 0;

    return true, file_time;
}

odin_to_wchar_string :: proc(str : string) -> win32.Wstring {
    olen := i32(len(str) * size_of(byte));
    wlen := win32.multi_byte_to_wide_char(win32.CP_UTF8, 0, cstring(&str[0]), olen, nil, 0);
    buf := make([]u16, int(wlen * size_of(u16) + 1));
    ptr := win32.Wstring(&buf[0]);
    win32.multi_byte_to_wide_char(win32.CP_UTF8, 0, cstring(&str[0]), olen, ptr, wlen);
    return ptr;
}

copy_file :: proc(src, dest : string, force := false) -> bool {
    src_wc := odin_to_wchar_string(src); defer free(src_wc);
    dst_wc := odin_to_wchar_string(dest); defer free(dst_wc);
    res := win32.copy_file_w(src_wc, dst_wc, win32.Bool(!force));
    return bool(res);
}

On_Load_Proc :: #type proc(funcs: ^raylib_types.raylib_Funcs);
On_Unload_Proc :: #type proc();
Update_And_Draw_Proc :: #type proc();

Plugin :: struct {
    name: string,
    path_on_disk: string,
    module: win32.Hmodule,
    last_write_time: os.File_Time,

    on_load_proc: On_Load_Proc,
    on_unload_proc: On_Unload_Proc,
    update_and_draw_proc: Update_And_Draw_Proc,
}

load_plugin :: proc(plugin: ^Plugin, name: string) -> bool {
    temp_path :: "temp/temp.dll";

    // copy dll to temp location
    if !copy_file(name, temp_path, true) {
        fmt.println("ERR IN COPY FILE");
        fmt.println_err("could not copy", name, "to", temp_path);
        return false;
    }

    if !copy_file("game.pdb", "temp/temp.pdb", true) {
        fmt.println("cannot copy pdb");
        return false;
    }

    // load dll
    new_dll := win32.load_library_a(temp_path);
    if new_dll == nil {
        fmt.println("ERR IN LOAD_LIBRARY");
        fmt.println_err("could not load library", name);
        return false;
    }

    // load functions
    on_load_proc : On_Load_Proc = cast(On_Load_Proc)win32.get_proc_address(new_dll, "on_load");
    if on_load_proc == nil {
        fmt.println_err("error: could not load on_load proc");
        return false;
    } 

    on_unload_proc : On_Unload_Proc = cast(On_Unload_Proc)win32.get_proc_address(new_dll, "on_unload");
    if on_unload_proc == nil {
        fmt.println_err("error: could not load on_unload proc");
        return false;
    } 

    update_and_draw_proc : Update_And_Draw_Proc = cast(Update_And_Draw_Proc)win32.get_proc_address(new_dll, "update_and_draw");
    if update_and_draw_proc == nil {
        fmt.println_err("error: could not load update_and_draw proc");
        return false;
    } 

    {
        ok, file_time := get_file_time(name);
        if !ok {
            fmt.println("error getting write time");
            fmt.println_err("could not read DLL write time:", temp_path);
            return false;
        }
        plugin.last_write_time = file_time;
    }

    plugin.name = name;
    plugin.module = new_dll;
    plugin.path_on_disk = name;
    plugin.on_load_proc = on_load_proc;
    plugin.on_unload_proc = on_unload_proc;
    plugin.update_and_draw_proc = update_and_draw_proc;

    _call_plugin_on_load(plugin);

    return true;
}

_call_plugin_on_load :: proc(plugin: ^Plugin) {
    funcs: raylib_types.raylib_Funcs;
    raylib_bindings.get_function_pointers(&funcs);

    fmt.println("calling did_load_proc");
    plugin.on_load_proc(&funcs);
    fmt.println("did_load_proc returned");
}

unload_plugin :: proc(plugin: ^Plugin) {
    if plugin.module == nil do return;

    win32.free_library(plugin.module);
    plugin.module = nil;
}

plugin_maybe_reload :: proc(plugin: ^Plugin) {
    ok, file_time := get_file_time(plugin.path_on_disk);
    if !ok {
        //fmt.println_err("could not get file time of plugin:", plugin.path_on_disk);
        return;
    }

    if file_time == plugin.last_write_time do return;

    plugin.last_write_time = file_time;

    plugin.on_unload_proc();
    unload_plugin(plugin);
    load_plugin(plugin, plugin.name);
    _call_plugin_on_load(plugin);
}

main :: proc()
{
    screenWidth :i32 = 800;
    screenHeight :i32 = 450;

    init_window(screenWidth, screenHeight, "game");
    
    set_target_fps(60);

    plugin: Plugin;
    if !load_plugin(&plugin, "game.dll") {
        fmt.println("error loading game.dll");
        return;
    }

    defer unload_plugin(&plugin);

    for !window_should_close()    // Detect window close button or ESC key
    {
        plugin.update_and_draw_proc();
        plugin_maybe_reload(&plugin);
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------   
    close_window();        // Close window and OpenGL context
}
