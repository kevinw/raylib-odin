package demo

using import "./raylib"

main :: proc()
{
    // Initialization
    //--------------------------------------------------------------------------------------
    screenWidth :i32 = 800;
    screenHeight :i32 = 450;

    init_window(screenWidth, screenHeight, "raylib [core] example - basic window");
    
    set_target_fps(60);
    //--------------------------------------------------------------------------------------

    // Main game loop
    for !window_should_close()    // Detect window close button or ESC key
    {
        // Update
        //----------------------------------------------------------------------------------
        // TODO: Update your variables here
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        {
            begin_drawing();
            defer end_drawing();

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
