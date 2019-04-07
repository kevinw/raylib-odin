
package raygui

using import "../types"

raygui_Funcs :: raygui_Funcs;

// re-export everything from ./types for convienience
RAYGUI_H :: RAYGUI_H;
RAYGUI_VERSION :: RAYGUI_VERSION;
RAYGUI_RICONS_SUPPORT :: RAYGUI_RICONS_SUPPORT;
TEXTEDIT_CURSOR_BLINK_FRAMES :: TEXTEDIT_CURSOR_BLINK_FRAMES;
NUM_CONTROLS :: NUM_CONTROLS;
NUM_PROPS_DEFAULT :: NUM_PROPS_DEFAULT;
NUM_PROPS_EXTENDED :: NUM_PROPS_EXTENDED;




import _c "core:c"

bridge_init :: proc(funcs: ^raygui_Funcs) {
    assert(funcs != nil);
    assert(funcs.gui_list_element != nil);

    gui_list_element = funcs.gui_list_element;
    convert_hs_vto_rgb = funcs.convert_hs_vto_rgb;
    convert_rg_bto_hsv = funcs.convert_rg_bto_hsv;
    get_text_width = funcs.get_text_width;
    get_text_bounds = funcs.get_text_bounds;
    get_text_icon = funcs.get_text_icon;
    gui_draw_text = funcs.gui_draw_text;
    gui_text_split = funcs.gui_text_split;
    gui_enable = funcs.gui_enable;
    gui_disable = funcs.gui_disable;
    gui_lock = funcs.gui_lock;
    gui_unlock = funcs.gui_unlock;
    gui_state = funcs.gui_state;
    gui_font = funcs.gui_font;
    gui_fade = funcs.gui_fade;
    gui_set_style = funcs.gui_set_style;
    gui_get_style = funcs.gui_get_style;
    gui_window_box = funcs.gui_window_box;
    gui_group_box = funcs.gui_group_box;
    gui_line = funcs.gui_line;
    gui_panel = funcs.gui_panel;
    gui_scroll_panel = funcs.gui_scroll_panel;
    gui_label = funcs.gui_label;
    gui_button = funcs.gui_button;
    gui_label_button = funcs.gui_label_button;
    gui_image_button = funcs.gui_image_button;
    gui_image_button_ex = funcs.gui_image_button_ex;
    gui_toggle = funcs.gui_toggle;
    gui_toggle_group = funcs.gui_toggle_group;
    gui_check_box = funcs.gui_check_box;
    gui_combo_box = funcs.gui_combo_box;
    gui_dropdown_box = funcs.gui_dropdown_box;
    gui_spinner = funcs.gui_spinner;
    gui_value_box = funcs.gui_value_box;
    gui_text_box = funcs.gui_text_box;
    gui_text_box_multi = funcs.gui_text_box_multi;
    gui_slider_pro = funcs.gui_slider_pro;
    gui_slider = funcs.gui_slider;
    gui_slider_bar = funcs.gui_slider_bar;
    gui_progress_bar = funcs.gui_progress_bar;
    gui_status_bar = funcs.gui_status_bar;
    gui_dummy_rec = funcs.gui_dummy_rec;
    gui_scroll_bar = funcs.gui_scroll_bar;
    gui_list_view = funcs.gui_list_view;
    gui_list_view_ex = funcs.gui_list_view_ex;
    gui_color_panel = funcs.gui_color_panel;
    gui_color_bar_alpha = funcs.gui_color_bar_alpha;
    gui_color_bar_hue = funcs.gui_color_bar_hue;
    gui_color_picker = funcs.gui_color_picker;
    gui_message_box = funcs.gui_message_box;
    gui_grid = funcs.gui_grid;
    gui_load_style = funcs.gui_load_style;
    gui_load_style_props = funcs.gui_load_style_props;
    gui_load_style_default = funcs.gui_load_style_default;
    gui_update_style_complete = funcs.gui_update_style_complete;
    gui_icon_text = funcs.gui_icon_text;
}

bridge_deinit :: proc() {
}

gui_list_element : proc "c" (
        bounds : Rectangle,
        text : cstring,
        active : bool,
        edit_mode : bool
    ) -> bool;
convert_hs_vto_rgb : proc "c" (hsv : Vector3) -> Vector3;
convert_rg_bto_hsv : proc "c" (rgb : Vector3) -> Vector3;
get_text_width : proc "c" (text : cstring) -> _c.int;
get_text_bounds : proc "c" (
        control : _c.int,
        bounds : Rectangle
    ) -> Rectangle;
get_text_icon : proc "c" (
        text : cstring,
        icon_id : ^_c.int
    ) -> cstring;
gui_draw_text : proc "c" (
        text : cstring,
        bounds : Rectangle,
        alignment : _c.int,
        tint : Color
    );
gui_text_split : proc "c" (
        text : cstring,
        count : ^_c.int,
        text_row : ^_c.int
    ) -> ^cstring;
gui_enable : proc "c" ();
gui_disable : proc "c" ();
gui_lock : proc "c" ();
gui_unlock : proc "c" ();
gui_state : proc "c" (state : _c.int);
gui_font : proc "c" (font : Font);
gui_fade : proc "c" (alpha : _c.float);
gui_set_style : proc "c" (
        control : _c.int,
        property : _c.int,
        value : _c.int
    );
gui_get_style : proc "c" (
        control : _c.int,
        property : _c.int
    ) -> _c.int;
gui_window_box : proc "c" (
        bounds : Rectangle,
        text : cstring
    ) -> bool;
gui_group_box : proc "c" (
        bounds : Rectangle,
        text : cstring
    );
gui_line : proc "c" (
        bounds : Rectangle,
        text : cstring
    );
gui_panel : proc "c" (bounds : Rectangle);
gui_scroll_panel : proc "c" (
        bounds : Rectangle,
        content : Rectangle,
        scroll : ^Vector2
    ) -> Rectangle;
gui_label : proc "c" (
        bounds : Rectangle,
        text : cstring
    );
gui_button : proc "c" (
        bounds : Rectangle,
        text : cstring
    ) -> bool;
gui_label_button : proc "c" (
        bounds : Rectangle,
        text : cstring
    ) -> bool;
gui_image_button : proc "c" (
        bounds : Rectangle,
        texture : Texture2D
    ) -> bool;
gui_image_button_ex : proc "c" (
        bounds : Rectangle,
        texture : Texture2D,
        tex_source : Rectangle,
        text : cstring
    ) -> bool;
gui_toggle : proc "c" (
        bounds : Rectangle,
        text : cstring,
        active : bool
    ) -> bool;
gui_toggle_group : proc "c" (
        bounds : Rectangle,
        text : cstring,
        active : _c.int
    ) -> _c.int;
gui_check_box : proc "c" (
        bounds : Rectangle,
        text : cstring,
        checked : bool
    ) -> bool;
gui_combo_box : proc "c" (
        bounds : Rectangle,
        text : cstring,
        active : _c.int
    ) -> _c.int;
gui_dropdown_box : proc "c" (
        bounds : Rectangle,
        text : cstring,
        active : ^_c.int,
        edit_mode : bool
    ) -> bool;
gui_spinner : proc "c" (
        bounds : Rectangle,
        value : ^_c.int,
        min_value : _c.int,
        max_value : _c.int,
        edit_mode : bool
    ) -> bool;
gui_value_box : proc "c" (
        bounds : Rectangle,
        value : ^_c.int,
        min_value : _c.int,
        max_value : _c.int,
        edit_mode : bool
    ) -> bool;
gui_text_box : proc "c" (
        bounds : Rectangle,
        text : cstring,
        text_size : _c.int,
        edit_mode : bool
    ) -> bool;
gui_text_box_multi : proc "c" (
        bounds : Rectangle,
        text : cstring,
        text_size : _c.int,
        edit_mode : bool
    ) -> bool;
gui_slider_pro : proc "c" (
        bounds : Rectangle,
        text : cstring,
        value : _c.float,
        min_value : _c.float,
        max_value : _c.float,
        slider_width : _c.int,
        show_value : bool
    ) -> _c.float;
gui_slider : proc "c" (
        bounds : Rectangle,
        text : cstring,
        value : _c.float,
        min_value : _c.float,
        max_value : _c.float,
        show_value : bool
    ) -> _c.float;
gui_slider_bar : proc "c" (
        bounds : Rectangle,
        text : cstring,
        value : _c.float,
        min_value : _c.float,
        max_value : _c.float,
        show_value : bool
    ) -> _c.float;
gui_progress_bar : proc "c" (
        bounds : Rectangle,
        text : cstring,
        value : _c.float,
        min_value : _c.float,
        max_value : _c.float,
        show_value : bool
    ) -> _c.float;
gui_status_bar : proc "c" (
        bounds : Rectangle,
        text : cstring
    );
gui_dummy_rec : proc "c" (
        bounds : Rectangle,
        text : cstring
    );
gui_scroll_bar : proc "c" (
        bounds : Rectangle,
        value : _c.int,
        min_value : _c.int,
        max_value : _c.int
    ) -> _c.int;
gui_list_view : proc "c" (
        bounds : Rectangle,
        text : cstring,
        active : ^_c.int,
        scroll_index : ^_c.int,
        edit_mode : bool
    ) -> bool;
gui_list_view_ex : proc "c" (
        bounds : Rectangle,
        text : ^cstring,
        count : _c.int,
        enabled : ^_c.int,
        active : ^_c.int,
        focus : ^_c.int,
        scroll_index : ^_c.int,
        edit_mode : bool
    ) -> bool;
gui_color_panel : proc "c" (
        bounds : Rectangle,
        color : Color
    ) -> Color;
gui_color_bar_alpha : proc "c" (
        bounds : Rectangle,
        alpha : _c.float
    ) -> _c.float;
gui_color_bar_hue : proc "c" (
        bounds : Rectangle,
        hue : _c.float
    ) -> _c.float;
gui_color_picker : proc "c" (
        bounds : Rectangle,
        color : Color
    ) -> Color;
gui_message_box : proc "c" (
        bounds : Rectangle,
        window_title : cstring,
        message : cstring,
        buttons : cstring
    ) -> _c.int;
gui_grid : proc "c" (
        bounds : Rectangle,
        spacing : _c.float,
        subdivs : _c.int
    ) -> Vector2;
gui_load_style : proc "c" (file_name : cstring);
gui_load_style_props : proc "c" (
        props : ^_c.int,
        count : _c.int
    );
gui_load_style_default : proc "c" ();
gui_update_style_complete : proc "c" ();
gui_icon_text : proc "c" (
        icon_id : _c.int,
        text : cstring
    ) -> cstring;
