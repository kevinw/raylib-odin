package live_reload_demo

using import "core:runtime"
import "core:math"
import "core:os"
import "core:fmt"
import serializer "core:encoding/json"

using import "../../raylib/bridge"

import "../shared/json_ext"

import "../shared/sprite"

// RAYLIB_EXTRA
unload :: proc {
    unload_texture,
    unload_sound
};

//import "../shared/game_math"
import "../shared/plugin"
using import "../shared/debug_console"

state_json_dir :: "temp";
state_json_path :: "temp/state.json";

when os.OS == "windows" {
    import "core:sys/win32"

    mkdir_if_not_exist :: proc(dir: string) -> os.Errno {
        dir_wstr := win32.utf8_to_wstring(dir, context.temp_allocator);
        if win32.Bool(false) == win32.create_directory_w(dir_wstr, nil) do return os.Errno(win32.get_last_error());
        return os.ERROR_NONE;
    }
}

// This state persists during a plugin reload.
State :: struct {
    currentFrame : int,
    framesCounter : int,
    position : Vector2,
}


Transient_State :: struct {
    bg : Texture,
    num_frames : int,
    bg2 : Texture,
    scarfy : Texture,
    console: Debug_Console,

    sprs : []sprite.Sprite,
}

state : State;
transient_state : Transient_State;

@(export)
on_load :: proc(funcs: ^raylib_Funcs) {
    bridge_init(funcs);

    using transient_state;

    scarfy = load_texture("resources/scarfy.png");

    sprs = make([]sprite.Sprite, 51);

    for i in 0..49 {
        bg_spr := &sprs[i];
        using bg_spr;

        pos = Vector2 { 
            cast(f32)get_random_value(0, get_screen_width()),
            cast(f32)get_random_value(0, get_screen_height()),
        };
        rotation = cast(f32)get_random_value(0, 360);
        tint = Color { 255, 255, 255, cast(u8)get_random_value(30, 100) };
        animations = make([]sprite.Anim, 1);
        current_anim = &animations[0];
        current_anim.name = "walk_right";
        current_anim.fps = cast(f32)get_random_value(1, 15);
        current_anim.texture = scarfy;
        current_anim.rects = sprite.rects_from_horizontal_texture(cast(f32)scarfy.width, cast(f32)scarfy.height, 6);
    }

    spr := &sprs[50];
    {
        using spr;
        pos = Vector2 { 50.0, 50.0 };
        rotation = 0.0;
        tint = WHITE;
        animations = make([]sprite.Anim, 1);
        current_anim = &animations[0];
        current_anim.name = "walk_right";
        current_anim.fps = 10.0;
        current_anim.texture = scarfy;
        current_anim.rects = sprite.rects_from_horizontal_texture(cast(f32)scarfy.width, cast(f32)scarfy.height, 6);
    }

    num_frames = 6;

    {
        bg_img := gen_image_gradient_v(850, 450, PURPLE, RAYWHITE);
        defer unload_image(bg_img);
        bg = load_texture_from_image(bg_img);

        bg2_img := gen_image_gradient_h(850, 450, Color { 0, 0, 0, 0, }, Color { 255, 190, 200, 60 });
        defer unload_image(bg2_img);

        bg2 = load_texture_from_image(bg2_img);
    }

    if !json_ext.unmarshal_file(&state, state_json_path) {
        fmt.println("error unmarshalling json");
    }

    debug_console.init(&console);
    debug_console.log(&console, "game.dll loaded at time=", get_time(), " seconds");
}

@(export)
on_unload :: proc() {
    bridge_deinit();

    using state;
    using transient_state;

    if state_bytes, err := serializer.marshal(state); err == .None {
        mkdir_if_not_exist(state_json_dir);
        os.write_entire_file(state_json_path, state_bytes);
    } else {
        s := "";
        switch err {
            case .Unsupported_Type: s = "Unsupported_Type";
            case: s = "TODO";
        }
        fmt.println_err("error serializing state to bytes: ", s);
    }

    debug_console.destroy(&console);
    unload(scarfy);
    unload(bg);
    unload(bg2);
}

@(export)
update_and_draw :: proc() -> plugin.Request {
    using state;
    using transient_state;

    request := plugin.Request.None;

    spr := &sprs[50];

    // UPDATE
    spr_rect := sprite.current_rect(spr);
    width_of_one_frame := spr_rect.width;
    {
        framesCounter += 1;
        delta_time := get_frame_time();
        player_move_pixels_per_second:f32 = 400.0;
        speed := delta_time * player_move_pixels_per_second;

        prev_position := position;

        // debug key L - log a message
        if is_key_pressed(.L) do debug_console.log(&console, "this is a test");

        // debug key R - reload the plugin
        if is_key_pressed(.R) do request = .Reload;

        // debug key Q - quit
        if is_key_pressed(.Q) do request = .Quit;

        // move the player with the arrow or WASD keys
        if is_key_down(.RIGHT) || is_key_down(.D) do position.x += speed;
        if is_key_down(.LEFT)  || is_key_down(.A) do position.x -= speed;
        if is_key_down(.UP)    || is_key_down(.W) do position.y -= speed;
        if is_key_down(.DOWN)  || is_key_down(.S) do position.y += speed;

        // click to move the player as well
        if is_mouse_button_down(.LEFT_BUTTON) {
            mouse_pos := get_mouse_position();
            to_pos := math.length(math.Vec2 { mouse_pos.x - position.x, mouse_pos.y - position.y });
            if to_pos > 20 {
                mouse_pos.x -= f32(width_of_one_frame) * .5;
                mouse_pos.y -= f32(spr_rect.height) * .5;
                if mouse_pos.x > position.x do position.x = min(mouse_pos.x, position.x + speed);
                else if mouse_pos.x < position.x do position.x = max(mouse_pos.x, position.x - speed);
                if mouse_pos.y > position.y do position.y = min(mouse_pos.y, position.y + speed);
                else if mouse_pos.y < position.y do position.y = max(mouse_pos.y, position.y - speed);
            }
        }

        // TODO: these flip values get lost on reload
        if prev_position.x < position.x do spr.flip_x = false;
        else if prev_position.x > position.x do spr.flip_x = true;

        spr.pos = position;
        sprite.update_many(sprs, delta_time);
    }

    // DRAW
    {
        begin_drawing();
        defer end_drawing();

        clear_background(RAYWHITE);
        draw_texture(bg, 0, 0, WHITE);
        {
            begin_blend_mode(BlendMode.ADDITIVE);
            defer end_blend_mode();
            draw_texture(bg2, 0, 0, WHITE);
        }

        sprite.draw_many(sprs);

        {
            // mouse cursor
            begin_blend_mode(BlendMode.MULTIPLIED);
            defer end_blend_mode();
            draw_circle_v(get_mouse_position(), 15, RED);
        }

        debug_console.update_and_draw(&console);
    }

    return request;
}
