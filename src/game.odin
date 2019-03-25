package bridge_demo

using import "../generated/raylib_types"
using import "../generated/raylib_bridge"

using import "core:runtime"
import "core:fmt"
import "core:math"
//import "core:encoding/json"

State :: struct {
    num_frames : int,
    frameRec : Rectangle,

    currentFrame : int,
    framesCounter : int,
    framesSpeed : int,

    position : Vector2,

    scarfy : Texture,
    bg : Texture,
    cat : Texture,
    meow : Sound,

    cat_x: f32,
    cat_velocity: f32,

    did_play: bool,
}

to_json :: proc(a: any) -> string {
    type_info := type_info_base(type_info_of(a.id));
    if ti_struct, ok := type_info.variant.(Type_Info_Struct); ok {
        for name, i in ti_struct.names {
            val := any {
                rawptr(uintptr(a.data) + ti_struct.offsets[i]),
                ti_struct.types[i].id,
            };
            fmt.println("name", name, val);
        }
    }

    return "{}";
}

state : State;

@(export)
on_load :: proc(funcs: ^raylib_Funcs) {
    bridge_init(funcs);

    using state;

    scarfy = load_texture("resources/scarfy.png");
    cat = load_texture("resources/cat.png");
    meow = load_sound("resources/tanatana.ogg");

    num_frames = 6;
    frameRec.x = 0;
    frameRec.y = 0;
    frameRec.width = cast(f32)scarfy.width / cast(f32)num_frames;
    frameRec.height = cast(f32)scarfy.height;

    framesSpeed = 9;

    /*
    {
        serialized, err := json.marshal(state);
        if err != json.Marshal_Error.None {
            fmt.println_err(err);
        } else {
            defer delete(serialized);

            fmt.println("parsing json.");

            value, err := json.parse(serialized, json.Specification.JSON5);
            if err != .None {
                fmt.println(err);
            } else {
                fmt.println(value);
            }
        }
    }
    */


    {
        bg_img := gen_image_gradient_v(850, 450, PURPLE, RAYWHITE);
        defer unload_image(bg_img);

        bg = load_texture_from_image(bg_img);
    }
}

@(export)
on_unload :: proc() {
    bridge_deinit();

    using state;
    unload_texture(scarfy);
    unload_sound(meow);
}

INFINITY :: math.F32_MAX + 1;

clamp :: proc(val, min_val, max_val: f32) -> f32 {
    return min(max_val, max(min_val, val));
}

// thanks Unity decompiled
smooth_damp :: proc(
    current: f32,
    target: f32,
    current_velocity: ^f32,
    smooth_time: f32,
    delta_time: f32,
    max_speed: f32 = INFINITY,
) -> f32 {
    smooth_time = max(0.0001, smooth_time);
    num:f32 = 2.0 / smooth_time;
    num2:f32 = num * delta_time;
    num3:f32 = 1.0 / (1.0 + num2 + 0.48 * num2 * num2 + 0.235 * num2 * num2 * num2);
    num4:f32 = current - target;
    num5:f32 = target;
    num6:f32 = max_speed * smooth_time;
    num4 = clamp(num4, -num6, num6);
    target = current - num4;
    num7:f32 = (current_velocity^ + num * num4) * delta_time;
    current_velocity^ = (current_velocity^ - num * num7) * num3;
    num8:f32 = target + (num4 + num7) * num3;
    if (num5 - current > 0.0) == (num8 > num5) {
        num8 = num5;
        current_velocity^ = (num8 - num5) / delta_time;
    }
    return num8;
}

@(export)
update_and_draw :: proc() {
    begin_drawing();

    using state;
    if !did_play && is_audio_device_ready() {
        //play_sound(meow);
        did_play = true;
    }

    clear_background(RAYWHITE);

    framesCounter += 1;

    delta_time := get_frame_time();

    speed := delta_time * 400.0;

    if is_key_down(.KEY_RIGHT) || is_key_down(.KEY_D) do position.x += speed;
    if is_key_down(.KEY_LEFT) || is_key_down(.KEY_A) do position.x -= speed;
    if is_key_down(.KEY_UP) || is_key_down(.KEY_W) do position.y -= speed;
    if is_key_down(.KEY_DOWN) || is_key_down(.KEY_S) do position.y += speed;

    width_of_one_frame := cast(f32)scarfy.width / cast(f32)num_frames;

    if is_mouse_button_down(0) {
        mouse_pos := get_mouse_position();
        to_pos := math.length(math.Vec2 { mouse_pos.x - position.x, mouse_pos.y - position.y });
        if to_pos > 20 {
            mouse_pos.x -= f32(width_of_one_frame) * .5;
            mouse_pos.y -= f32(scarfy.height) * .5;
            if mouse_pos.x > position.x do position.x = min(mouse_pos.x, position.x + speed);
            else if mouse_pos.x < position.x do position.x = max(mouse_pos.x, position.x - speed);
            if mouse_pos.y > position.y do position.y = min(mouse_pos.y, position.y + speed);
            else if mouse_pos.y < position.y do position.y = max(mouse_pos.y, position.y - speed);
        }
    }

    if framesCounter >= (60.0 / framesSpeed) {
        framesCounter = 0;
        currentFrame += 1;

        if currentFrame >= num_frames do currentFrame = 0.0;

        frameRec.x = cast(f32)currentFrame * width_of_one_frame;
    }

    smooth_time:f32 = 0.4;

    cat_x = smooth_damp(cat_x, position.x - 40, &cat_velocity, smooth_time, delta_time);

    draw_texture(bg, 0, 0, WHITE);
    draw_texture_rec(scarfy, frameRec, position, WHITE);  // Draw part of the texture
    draw_texture(cat, cast(i32)cat_x, 230, WHITE);

    end_drawing();
}
