package bridge_demo

using import "./raylib_types"
using import "./raylib_bridge"

State :: struct {
    num_frames : int,
    frameRec : Rectangle,

    currentFrame : int,
    framesCounter : int,
    framesSpeed : int,

    position : Vector2,

    scarfy : Texture,
}

state : State;

@(export)
on_load :: proc(bridge: ^raylib_Funcs) {
    bridge_init(bridge);
    using state;

    scarfy = load_texture("resources/scarfy.png");

    num_frames = 6;
    frameRec.x = 0;
    frameRec.y = 0;
    frameRec.width = cast(f32)scarfy.width / cast(f32)num_frames;
    frameRec.height = cast(f32)scarfy.height;

    framesSpeed = 9;
}

@(export)
on_unload :: proc() {
    bridge_deinit();
    unload_texture(scarfy);
}

scarfy : Texture;

@(export)
update_and_draw :: proc() {
    begin_drawing();

    clear_background(BLUE);
    draw_texture(scarfy, 20, 60, WHITE);

    {
        using state;
        framesCounter += 1;

        speed := get_frame_time() * 400.0;

        if is_key_down(cast(i32)KeyboardKey.KEY_RIGHT) do position.x += speed;
        if is_key_down(cast(i32)KeyboardKey.KEY_LEFT) do position.x -= speed;
        if is_key_down(cast(i32)KeyboardKey.KEY_UP) do position.y -= speed;
        if is_key_down(cast(i32)KeyboardKey.KEY_DOWN) do position.y += speed;

        if framesCounter >= (60.0 / framesSpeed) {
            framesCounter = 0;
            currentFrame += 1;

            if currentFrame >= num_frames do currentFrame = 0.0;

            frameRec.x = cast(f32)currentFrame * cast(f32)scarfy.width / cast(f32)num_frames;
        }
        draw_texture_rec(scarfy, frameRec, position, WHITE);  // Draw part of the texture
    }

    end_drawing();
}
