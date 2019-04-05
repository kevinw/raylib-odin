package example_gui

import "core:fmt"

using import "../../raylib_types"
using import "../../raylib_bindings"

import rg_types "../../ext/raygui_types"
import rg_bindings "../../ext/raygui_bindings"

main :: proc() {
    init_window(800, 450, "odin-raylib :: gui");

    for !window_should_close() {
        begin_drawing();
        clear_background(BLACK);
        if (rg_bindings.gui_button(Rectangle { 30, 320, 115, 30 }, "NORMAL")) {
            fmt.println("pressed");
        }
        end_drawing();
    }
}
