package example_gui

import "core:fmt"

using import "../../raylib"

import raygui "../../ext/raygui"

main :: proc() {
    init_window(800, 450, "odin-raylib :: gui");

    for !window_should_close() {
        begin_drawing();
        clear_background(BLACK);
        if (raygui.gui_button(Rectangle { 30, 320, 115, 30 }, "NORMAL")) {
            fmt.println("pressed");
        }
        end_drawing();
    }
}
