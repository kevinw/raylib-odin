package live_reload_demo

import "core:strings"

using import "../../../raylib_types"
using import "../../../raylib_bridge"

Console_Entry :: struct {
    message: cstring,
    time: f64,
}

Debug_Console :: struct {
    entries: [dynamic]Console_Entry,
}

init :: proc(debug_console: ^Debug_Console) {
}

destroy :: proc(debug_console: ^Debug_Console) {
}

log :: proc(using debug_console: ^Debug_Console, msg: string) {
    time := get_time();
    append(&entries, Console_Entry { strings.clone_to_cstring(msg), time });
}

_unlerp :: proc(ax, a1, a2: f64) -> f64 {
    return (ax - a1) / (a2 - a1);
}

_saturate :: proc(f: f64) -> f64 {
    if f < 0 do return 0;
    if f > 1 do return 1;
    return f;
}

update_and_draw :: proc(using debug_console: ^Debug_Console) {
    if len(entries) == 0 do return;

    font_size:i32 = 16;

    new_entries: [dynamic]Console_Entry;

    now := get_time();

    y:i32 = 10;
    x:i32 = 10;

    color := WHITE;
    shadow_color := BLACK;

    time_visible :: 2.0;

    alpha_for_time :: proc(elapsed: f64) -> u8 {
        return u8(255.0 * (1.0 - _saturate(_unlerp(elapsed, time_visible - 0.5, time_visible))));
    }

    for entry in entries {
        elapsed := now - entry.time;
        if elapsed >= time_visible do continue;

        alpha := alpha_for_time(elapsed);
        shadow_color.a = alpha;
        color.a = alpha;
        draw_text(entry.message, x+1, y+1, font_size, shadow_color);
        draw_text(entry.message, x, y, font_size, color);
        y += i32(f32(font_size) * 1.2);

        append(&new_entries, entry);
    }

    entries = new_entries;
}
