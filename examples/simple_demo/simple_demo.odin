package demo

import "../../raylib"

main :: proc()
{
    // Initialization
    //--------------------------------------------------------------------------------------
    screenWidth :i32 = 800;
    screenHeight :i32 = 450;

    raylib.init_window(screenWidth, screenHeight, "game");
    
    raylib.set_target_fps(60);
    //--------------------------------------------------------------------------------------

    ball_color := raylib.DARKBLUE;

    scarfy := raylib.load_texture("resources/scarfy.png");

    num_frames := 6;

    frameRec : raylib.Rectangle;
    frameRec.x = 0;
    frameRec.y = 0;
    frameRec.width = cast(f32)scarfy.width / cast(f32)num_frames;
    frameRec.height = cast(f32)scarfy.height;

    position := raylib.Vector2 { 350.0, 280.0 };

    currentFrame := 0;
    framesCounter := 0;
    framesSpeed := 8;           // Number of spritesheet frames shown by second

    // Main game loop
    for !raylib.window_should_close()    // Detect window close button or ESC key
    {
        framesCounter += 1;

        if framesCounter >= (60.0 / framesSpeed) {
            framesCounter = 0;
            currentFrame += 1;

            if currentFrame >= num_frames do currentFrame = 0.0;

            frameRec.x = cast(f32)currentFrame * cast(f32)scarfy.width / cast(f32)num_frames;
        }

        ball_position := raylib.get_mouse_position();

        if raylib.is_mouse_button_pressed(.LEFT_BUTTON) do ball_color = raylib.MAROON;
        else if raylib.is_mouse_button_pressed(.MIDDLE_BUTTON) do ball_color = raylib.LIME;
        else if raylib.is_mouse_button_pressed(.RIGHT_BUTTON)  do ball_color = raylib.DARKBLUE;

        {
            raylib.begin_drawing();
            defer raylib.end_drawing();

            raylib.draw_texture(scarfy, 15, 40, raylib.WHITE);
            raylib.draw_circle_v(ball_position, 40, ball_color);

            raylib.clear_background(raylib.RAYWHITE);

            raylib.draw_texture_rec(scarfy, frameRec, position, raylib.WHITE);  // Draw part of the texture

            raylib.draw_text("Congrats! You created your first window!", 190, 200, 20, raylib.LIGHTGRAY);
        }
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------   
    raylib.close_window();        // Close window and OpenGL context
    //--------------------------------------------------------------------------------------
}
