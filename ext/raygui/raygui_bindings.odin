
//
// THIS FILE WAS AUTOGENERATED
//

package raygui_bindings

foreign import "../lib/raygui.lib"

import _c "core:c"
using import "../../raylib/types"


import raygui_types "./types"

raygui_Funcs :: raygui_types.raygui_Funcs;

// re-export everything from ./types for convienience
RAYGUI_H :: raygui_types.RAYGUI_H;
RAYGUI_VERSION :: raygui_types.RAYGUI_VERSION;
RAYGUI_RICONS_SUPPORT :: raygui_types.RAYGUI_RICONS_SUPPORT;
TEXTEDIT_CURSOR_BLINK_FRAMES :: raygui_types.TEXTEDIT_CURSOR_BLINK_FRAMES;
NUM_CONTROLS :: raygui_types.NUM_CONTROLS;
NUM_PROPS_DEFAULT :: raygui_types.NUM_PROPS_DEFAULT;
NUM_PROPS_EXTENDED :: raygui_types.NUM_PROPS_EXTENDED;



get_function_pointers :: proc(funcs: ^raygui_types.raygui_Funcs) {
    funcs.gui_list_element = gui_list_element;
    funcs.convert_hs_vto_rgb = convert_hs_vto_rgb;
    funcs.convert_rg_bto_hsv = convert_rg_bto_hsv;
    funcs.get_text_width = get_text_width;
    funcs.get_text_bounds = get_text_bounds;
    funcs.get_text_icon = get_text_icon;
    funcs.gui_draw_text = gui_draw_text;
    funcs.gui_text_split = gui_text_split;
    funcs.gui_enable = gui_enable;
    funcs.gui_disable = gui_disable;
    funcs.gui_lock = gui_lock;
    funcs.gui_unlock = gui_unlock;
    funcs.gui_state = gui_state;
    funcs.gui_font = gui_font;
    funcs.gui_fade = gui_fade;
    funcs.gui_set_style = gui_set_style;
    funcs.gui_get_style = gui_get_style;
    funcs.gui_window_box = gui_window_box;
    funcs.gui_group_box = gui_group_box;
    funcs.gui_line = gui_line;
    funcs.gui_panel = gui_panel;
    funcs.gui_scroll_panel = gui_scroll_panel;
    funcs.gui_label = gui_label;
    funcs.gui_button = gui_button;
    funcs.gui_label_button = gui_label_button;
    funcs.gui_image_button = gui_image_button;
    funcs.gui_image_button_ex = gui_image_button_ex;
    funcs.gui_toggle = gui_toggle;
    funcs.gui_toggle_group = gui_toggle_group;
    funcs.gui_check_box = gui_check_box;
    funcs.gui_combo_box = gui_combo_box;
    funcs.gui_dropdown_box = gui_dropdown_box;
    funcs.gui_spinner = gui_spinner;
    funcs.gui_value_box = gui_value_box;
    funcs.gui_text_box = gui_text_box;
    funcs.gui_text_box_multi = gui_text_box_multi;
    funcs.gui_slider_pro = gui_slider_pro;
    funcs.gui_slider = gui_slider;
    funcs.gui_slider_bar = gui_slider_bar;
    funcs.gui_progress_bar = gui_progress_bar;
    funcs.gui_status_bar = gui_status_bar;
    funcs.gui_dummy_rec = gui_dummy_rec;
    funcs.gui_scroll_bar = gui_scroll_bar;
    funcs.gui_list_view = gui_list_view;
    funcs.gui_list_view_ex = gui_list_view_ex;
    funcs.gui_color_panel = gui_color_panel;
    funcs.gui_color_bar_alpha = gui_color_bar_alpha;
    funcs.gui_color_bar_hue = gui_color_bar_hue;
    funcs.gui_color_picker = gui_color_picker;
    funcs.gui_message_box = gui_message_box;
    funcs.gui_grid = gui_grid;
    funcs.gui_load_style = gui_load_style;
    funcs.gui_load_style_props = gui_load_style_props;
    funcs.gui_load_style_default = gui_load_style_default;
    funcs.gui_update_style_complete = gui_update_style_complete;
    funcs.gui_icon_text = gui_icon_text;
}

@(default_calling_convention="c")
foreign raygui {

    @(link_name="GuiListElement")
    gui_list_element :: proc(
        bounds : Rectangle,
        text : cstring,
        active : bool,
        edit_mode : bool
    ) -> bool ---;

    @(link_name="ConvertHSVtoRGB")
    convert_hs_vto_rgb :: proc(hsv : Vector3) -> Vector3 ---;

    @(link_name="ConvertRGBtoHSV")
    convert_rg_bto_hsv :: proc(rgb : Vector3) -> Vector3 ---;

    @(link_name="GetTextWidth")
    get_text_width :: proc(text : cstring) -> _c.int ---;

    @(link_name="GetTextBounds")
    get_text_bounds :: proc(
        control : _c.int,
        bounds : Rectangle
    ) -> Rectangle ---;

    @(link_name="GetTextIcon")
    get_text_icon :: proc(
        text : cstring,
        icon_id : ^_c.int
    ) -> cstring ---;

    @(link_name="GuiDrawText")
    gui_draw_text :: proc(
        text : cstring,
        bounds : Rectangle,
        alignment : _c.int,
        tint : Color
    ) ---;

    @(link_name="GuiTextSplit")
    gui_text_split :: proc(
        text : cstring,
        count : ^_c.int,
        text_row : ^_c.int
    ) -> ^cstring ---;

    @(link_name="GuiEnable")
    gui_enable :: proc() ---;

    @(link_name="GuiDisable")
    gui_disable :: proc() ---;

    @(link_name="GuiLock")
    gui_lock :: proc() ---;

    @(link_name="GuiUnlock")
    gui_unlock :: proc() ---;

    @(link_name="GuiState")
    gui_state :: proc(state : _c.int) ---;

    @(link_name="GuiFont")
    gui_font :: proc(font : Font) ---;

    @(link_name="GuiFade")
    gui_fade :: proc(alpha : _c.float) ---;

    @(link_name="GuiSetStyle")
    gui_set_style :: proc(
        control : _c.int,
        property : _c.int,
        value : _c.int
    ) ---;

    @(link_name="GuiGetStyle")
    gui_get_style :: proc(
        control : _c.int,
        property : _c.int
    ) -> _c.int ---;

    @(link_name="GuiWindowBox")
    gui_window_box :: proc(
        bounds : Rectangle,
        text : cstring
    ) -> bool ---;

    @(link_name="GuiGroupBox")
    gui_group_box :: proc(
        bounds : Rectangle,
        text : cstring
    ) ---;

    @(link_name="GuiLine")
    gui_line :: proc(
        bounds : Rectangle,
        text : cstring
    ) ---;

    @(link_name="GuiPanel")
    gui_panel :: proc(bounds : Rectangle) ---;

    @(link_name="GuiScrollPanel")
    gui_scroll_panel :: proc(
        bounds : Rectangle,
        content : Rectangle,
        scroll : ^Vector2
    ) -> Rectangle ---;

    @(link_name="GuiLabel")
    gui_label :: proc(
        bounds : Rectangle,
        text : cstring
    ) ---;

    @(link_name="GuiButton")
    gui_button :: proc(
        bounds : Rectangle,
        text : cstring
    ) -> bool ---;

    @(link_name="GuiLabelButton")
    gui_label_button :: proc(
        bounds : Rectangle,
        text : cstring
    ) -> bool ---;

    @(link_name="GuiImageButton")
    gui_image_button :: proc(
        bounds : Rectangle,
        texture : Texture2D
    ) -> bool ---;

    @(link_name="GuiImageButtonEx")
    gui_image_button_ex :: proc(
        bounds : Rectangle,
        texture : Texture2D,
        tex_source : Rectangle,
        text : cstring
    ) -> bool ---;

    @(link_name="GuiToggle")
    gui_toggle :: proc(
        bounds : Rectangle,
        text : cstring,
        active : bool
    ) -> bool ---;

    @(link_name="GuiToggleGroup")
    gui_toggle_group :: proc(
        bounds : Rectangle,
        text : cstring,
        active : _c.int
    ) -> _c.int ---;

    @(link_name="GuiCheckBox")
    gui_check_box :: proc(
        bounds : Rectangle,
        text : cstring,
        checked : bool
    ) -> bool ---;

    @(link_name="GuiComboBox")
    gui_combo_box :: proc(
        bounds : Rectangle,
        text : cstring,
        active : _c.int
    ) -> _c.int ---;

    @(link_name="GuiDropdownBox")
    gui_dropdown_box :: proc(
        bounds : Rectangle,
        text : cstring,
        active : ^_c.int,
        edit_mode : bool
    ) -> bool ---;

    @(link_name="GuiSpinner")
    gui_spinner :: proc(
        bounds : Rectangle,
        value : ^_c.int,
        min_value : _c.int,
        max_value : _c.int,
        edit_mode : bool
    ) -> bool ---;

    @(link_name="GuiValueBox")
    gui_value_box :: proc(
        bounds : Rectangle,
        value : ^_c.int,
        min_value : _c.int,
        max_value : _c.int,
        edit_mode : bool
    ) -> bool ---;

    @(link_name="GuiTextBox")
    gui_text_box :: proc(
        bounds : Rectangle,
        text : cstring,
        text_size : _c.int,
        edit_mode : bool
    ) -> bool ---;

    @(link_name="GuiTextBoxMulti")
    gui_text_box_multi :: proc(
        bounds : Rectangle,
        text : cstring,
        text_size : _c.int,
        edit_mode : bool
    ) -> bool ---;

    @(link_name="GuiSliderPro")
    gui_slider_pro :: proc(
        bounds : Rectangle,
        text : cstring,
        value : _c.float,
        min_value : _c.float,
        max_value : _c.float,
        slider_width : _c.int,
        show_value : bool
    ) -> _c.float ---;

    @(link_name="GuiSlider")
    gui_slider :: proc(
        bounds : Rectangle,
        text : cstring,
        value : _c.float,
        min_value : _c.float,
        max_value : _c.float,
        show_value : bool
    ) -> _c.float ---;

    @(link_name="GuiSliderBar")
    gui_slider_bar :: proc(
        bounds : Rectangle,
        text : cstring,
        value : _c.float,
        min_value : _c.float,
        max_value : _c.float,
        show_value : bool
    ) -> _c.float ---;

    @(link_name="GuiProgressBar")
    gui_progress_bar :: proc(
        bounds : Rectangle,
        text : cstring,
        value : _c.float,
        min_value : _c.float,
        max_value : _c.float,
        show_value : bool
    ) -> _c.float ---;

    @(link_name="GuiStatusBar")
    gui_status_bar :: proc(
        bounds : Rectangle,
        text : cstring
    ) ---;

    @(link_name="GuiDummyRec")
    gui_dummy_rec :: proc(
        bounds : Rectangle,
        text : cstring
    ) ---;

    @(link_name="GuiScrollBar")
    gui_scroll_bar :: proc(
        bounds : Rectangle,
        value : _c.int,
        min_value : _c.int,
        max_value : _c.int
    ) -> _c.int ---;

    @(link_name="GuiListView")
    gui_list_view :: proc(
        bounds : Rectangle,
        text : cstring,
        active : ^_c.int,
        scroll_index : ^_c.int,
        edit_mode : bool
    ) -> bool ---;

    @(link_name="GuiListViewEx")
    gui_list_view_ex :: proc(
        bounds : Rectangle,
        text : ^cstring,
        count : _c.int,
        enabled : ^_c.int,
        active : ^_c.int,
        focus : ^_c.int,
        scroll_index : ^_c.int,
        edit_mode : bool
    ) -> bool ---;

    @(link_name="GuiColorPanel")
    gui_color_panel :: proc(
        bounds : Rectangle,
        color : Color
    ) -> Color ---;

    @(link_name="GuiColorBarAlpha")
    gui_color_bar_alpha :: proc(
        bounds : Rectangle,
        alpha : _c.float
    ) -> _c.float ---;

    @(link_name="GuiColorBarHue")
    gui_color_bar_hue :: proc(
        bounds : Rectangle,
        hue : _c.float
    ) -> _c.float ---;

    @(link_name="GuiColorPicker")
    gui_color_picker :: proc(
        bounds : Rectangle,
        color : Color
    ) -> Color ---;

    @(link_name="GuiMessageBox")
    gui_message_box :: proc(
        bounds : Rectangle,
        window_title : cstring,
        message : cstring,
        buttons : cstring
    ) -> _c.int ---;

    @(link_name="GuiGrid")
    gui_grid :: proc(
        bounds : Rectangle,
        spacing : _c.float,
        subdivs : _c.int
    ) -> Vector2 ---;

    @(link_name="GuiLoadStyle")
    gui_load_style :: proc(file_name : cstring) ---;

    @(link_name="GuiLoadStyleProps")
    gui_load_style_props :: proc(
        props : ^_c.int,
        count : _c.int
    ) ---;

    @(link_name="GuiLoadStyleDefault")
    gui_load_style_default :: proc() ---;

    @(link_name="GuiUpdateStyleComplete")
    gui_update_style_complete :: proc() ---;

    @(link_name="GuiIconText")
    gui_icon_text :: proc(
        icon_id : _c.int,
        text : cstring
    ) -> cstring ---;

}