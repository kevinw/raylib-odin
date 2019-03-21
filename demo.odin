package demo

using import "./raylib"

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

    // Main game loop
    for !window_should_close()    // Detect window close button or ESC key
    {
        ball_position := get_mouse_position();

        if is_mouse_button_pressed(cast(i32)MouseButton.MOUSE_LEFT_BUTTON) do ball_color = MAROON;
        else if is_mouse_button_pressed(cast(i32)MouseButton.MOUSE_MIDDLE_BUTTON) do ball_color = LIME;
        else if is_mouse_button_pressed(cast(i32)MouseButton.MOUSE_RIGHT_BUTTON) do ball_color = DARKBLUE;

        {
            begin_drawing();
            defer end_drawing();

            draw_circle_v(ball_position, 40, ball_color);

            clear_background(RAYWHITE);

            draw_text("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
        }
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------   
    close_window();        // Close window and OpenGL context
    //--------------------------------------------------------------------------------------
}
