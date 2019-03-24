package bridge_demo

using import "../generated/raylib_types"
using import "../generated/raylib_bridge"

using import "core:runtime"
import "core:fmt"
import "core:encoding/json"

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

    //reflect.get_field_by_name(a, "num_frames")

    /*
    if ti_struct, ok := type_info.variant.(Type_Info_Struct); ok {
        for name, i in ti_struct.names {
            fmt.println("NAME:", name);
        }
    }
    */

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

@(export)
update_and_draw :: proc() {
    begin_drawing();

    using state;
    if !did_play && is_audio_device_ready() {
        //play_sound(meow);
        did_play = true;
    }

    clear_background(RAYWHITE);

    //draw_texture(scarfy, 20, 60, WHITE);
    framesCounter += 1;

    speed := get_frame_time() * 400.0;

    if is_key_down(KeyboardKey.KEY_RIGHT) || is_key_down(KeyboardKey.KEY_D) do position.x += speed;
    if is_key_down(KeyboardKey.KEY_LEFT) || is_key_down(KeyboardKey.KEY_A) do position.x -= speed;
    if is_key_down(KeyboardKey.KEY_UP) || is_key_down(KeyboardKey.KEY_W) do position.y -= speed;
    if is_key_down(KeyboardKey.KEY_DOWN) || is_key_down(KeyboardKey.KEY_S) do position.y += speed;

    if framesCounter >= (60.0 / framesSpeed) {
        framesCounter = 0;
        currentFrame += 1;

        if currentFrame >= num_frames do currentFrame = 0.0;

        frameRec.x = cast(f32)currentFrame * cast(f32)scarfy.width / cast(f32)num_frames;
    }

    draw_texture(bg, 0, 0, WHITE);
    draw_texture(cat, 10, 440, WHITE);
    draw_texture_rec(scarfy, frameRec, position, WHITE);  // Draw part of the texture

    end_drawing();
}
