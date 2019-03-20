package odin_raylib

foreign import raylib { "lib/raylib.lib" };

Color :: struct {
    r, g, b, a: u8
}

LIGHTGRAY  := Color { 200, 200, 200, 255 };   // Light Gray
GRAY       := Color { 130, 130, 130, 255 };   // Gray
DARKGRAY   := Color { 80, 80, 80, 255 };      // Dark Gray
YELLOW     := Color { 253, 249, 0, 255 };     // Yellow
GOLD       := Color { 255, 203, 0, 255 };     // Gold
ORANGE     := Color { 255, 161, 0, 255 };     // Orange
PINK       := Color { 255, 109, 194, 255 };   // Pink
RED        := Color { 230, 41, 55, 255 };     // Red
MAROON     := Color { 190, 33, 55, 255 };     // Maroon
GREEN      := Color { 0, 228, 48, 255 };      // Green
LIME       := Color { 0, 158, 47, 255 };      // Lime
DARKGREEN  := Color { 0, 117, 44, 255 };      // Dark Green
SKYBLUE    := Color { 102, 191, 255, 255 };   // Sky Blue
BLUE       := Color { 0, 121, 241, 255 };     // Blue
DARKBLUE   := Color { 0, 82, 172, 255 };      // Dark Blue
PURPLE     := Color { 200, 122, 255, 255 };   // Purple
VIOLET     := Color { 135, 60, 190, 255 };    // Violet
DARKPURPLE := Color { 112, 31, 126, 255 };    // Dark Purple
BEIGE      := Color { 211, 176, 131, 255 };   // Beige
BROWN      := Color { 127, 106, 79, 255 };    // Brown
DARKBROWN  := Color { 76, 63, 47, 255 };      // Dark Brown
WHITE      := Color { 255, 255, 255, 255 };   // White
BLACK      := Color { 0, 0, 0, 255 };         // Black
BLANK      := Color { 0, 0, 0, 0 };           // Blank (Transparent)
MAGENTA    := Color { 255, 0, 255, 255 };     // Magenta
RAYWHITE   := Color { 245, 245, 245, 255 };   // My own White (raylib logo)

@(default_calling_convention="c")
foreign raylib {
    InitWindow :: proc(width: i32, height: i32, title: cstring) ---;
    WindowShouldClose :: proc() -> bool ---;
    CloseWindow :: proc() ---;

    BeginDrawing :: proc() ---;
    EndDrawing :: proc() ---;

    ClearBackground :: proc(color: Color) ---;
    DrawText :: proc(text: cstring, pos_x: i32, pos_y: i32, font_size: i32, color: Color) ---;

    SetTargetFPS :: proc(fps: i32) ---;
}

main :: proc()
{
    // Initialization
    //--------------------------------------------------------------------------------------
    screenWidth :i32 = 800;
    screenHeight :i32 = 450;

    InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window");
    
    SetTargetFPS(60);
    //--------------------------------------------------------------------------------------

    // Main game loop
    for (!WindowShouldClose())    // Detect window close button or ESC key
    {
        // Update
        //----------------------------------------------------------------------------------
        // TODO: Update your variables here
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        BeginDrawing();

            ClearBackground(RAYWHITE);

            DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);

        EndDrawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------   
    CloseWindow();        // Close window and OpenGL context
    //--------------------------------------------------------------------------------------
}

