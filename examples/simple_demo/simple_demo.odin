package demo

using import "../../raylib"

main :: proc()
{
    // Initialization
    //--------------------------------------------------------------------------------------
    screenWidth :i32 = 800;
    screenHeight :i32 = 450;

    init_window(screenWidth, screenHeight, "game");
    
    set_target_fps(60);
    //--------------------------------------------------------------------------------------

    ball_color := DARKBLUE;

    scarfy := load_texture("resources/scarfy.png");

    num_frames := 6;

    frameRec : Rectangle;
    frameRec.x = 0;
    frameRec.y = 0;
    frameRec.width = cast(f32)scarfy.width / cast(f32)num_frames;
    frameRec.height = cast(f32)scarfy.height;

    position := Vector2 { 350.0, 280.0 };

    currentFrame := 0;
    framesCounter := 0;
    framesSpeed := 8;           // Number of spritesheet frames shown by second

    // Main game loop
    for !window_should_close()    // Detect window close button or ESC key
    {
        framesCounter += 1;

        if framesCounter >= (60.0 / framesSpeed) {
            framesCounter = 0;
            currentFrame += 1;

            if currentFrame >= num_frames do currentFrame = 0.0;

            frameRec.x = cast(f32)currentFrame * cast(f32)scarfy.width / cast(f32)num_frames;
        }

        ball_position := get_mouse_position();

        if is_mouse_button_pressed(.LEFT_BUTTON) do ball_color = MAROON;
        else if is_mouse_button_pressed(.MIDDLE_BUTTON) do ball_color = LIME;
        else if is_mouse_button_pressed(.RIGHT_BUTTON) do ball_color = DARKBLUE;

        {
            begin_drawing();
            defer end_drawing();

            draw_texture(scarfy, 15, 40, WHITE);
            draw_circle_v(ball_position, 40, ball_color);

            clear_background(RAYWHITE);

            draw_texture_rec(scarfy, frameRec, position, WHITE);  // Draw part of the texture

            draw_text("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
        }
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------   
    close_window();        // Close window and OpenGL context
    //--------------------------------------------------------------------------------------
}
