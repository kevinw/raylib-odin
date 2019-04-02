package plugin

import "core:os"
import "core:fmt"

Request :: enum {
    None,
    Reload,
    Quit,
}

when os.OS == "windows" {
    import "core:sys/win32"

    _odin_to_wchar_string :: proc(str : string) -> win32.Wstring {
        olen := i32(len(str) * size_of(byte));
        wlen := win32.multi_byte_to_wide_char(win32.CP_UTF8, 0, cstring(&str[0]), olen, nil, 0);
        buf := make([]u16, int(wlen * size_of(u16) + 1));
        ptr := win32.Wstring(&buf[0]);
        win32.multi_byte_to_wide_char(win32.CP_UTF8, 0, cstring(&str[0]), olen, ptr, wlen);
        return ptr;
    }

    _copy_file :: proc(src, dest : string, force := false) -> bool {
        src_wc := _odin_to_wchar_string(src); defer free(src_wc);
        dst_wc := _odin_to_wchar_string(dest); defer free(dst_wc);
        res := win32.copy_file_w(src_wc, dst_wc, win32.Bool(!force));
        return bool(res);
    }

    _file_exists :: proc(filename: string) -> bool {
        wide_path := win32.utf8_to_wstring(filename);
        data: win32.File_Attribute_Data;

        if !win32.get_file_attributes_ex_w(wide_path, win32.GetFileExInfoStandard, &data) {
            return false;
        }
        return true;
    }
}

get_file_time :: proc(filename: string) -> (bool, os.File_Time) {
    fd, err := os.open(filename);
    if err != os.ERROR_NONE do return false, 0;
    defer os.close(fd);

    file_time, err2 := os.last_write_time(fd);
    if err2 != os.ERROR_NONE do return false, 0;

    return true, file_time;
}

On_Load_Proc :: #type proc(userdata: rawptr);
On_Unload_Proc :: #type proc();
Update_And_Draw_Proc :: #type proc() -> Request;

Plugin :: struct {
    name: string,
    path_on_disk: string,
    module: win32.Hmodule,
    last_write_time: os.File_Time,

    on_load_proc: On_Load_Proc,
    on_unload_proc: On_Unload_Proc,
    update_and_draw_proc: Update_And_Draw_Proc,
}

plugin_load :: proc(plugin: ^Plugin, name: string, userdata: rawptr) -> bool {
    temp_path :: "bin/temp/temp.dll";
    temp_pdb_path :: "bin/temp/temp.pdb";

    // copy dll to temp location
    if !_copy_file(name, temp_path, true) {
        fmt.println("ERR IN COPY FILE");
        fmt.println_err("could not copy", name, "to", temp_path);
        return false;
    }

    if !_copy_file("bin/game.pdb", temp_pdb_path, true) {
        fmt.println("ERROR: cannot copy pdb from bin/game.pdb to bin/temp/temp.pdb");
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

    plugin.on_load_proc(userdata);

    return true;
}

plugin_unload :: proc(plugin: ^Plugin) {
    if plugin.module == nil do return;

    plugin.on_unload_proc();
    win32.free_library(plugin.module);
    plugin.module = nil;
}

plugin_maybe_reload :: proc(plugin: ^Plugin, userdata: rawptr, force_reload: bool = false) {
    ok, file_time := get_file_time(plugin.path_on_disk);
    if !ok {
        //fmt.println_err("could not get file time of plugin:", plugin.path_on_disk);
        return;
    }

    if !force_reload && file_time == plugin.last_write_time do return;

    plugin.last_write_time = file_time;

    plugin_unload(plugin);
    plugin_load(plugin, plugin.name, userdata);
}

plugin_force_reload :: proc(plugin: ^Plugin, userdata: rawptr) {
    plugin_maybe_reload(plugin, userdata, true);
}
