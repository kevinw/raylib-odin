package bunnymark

import "core:fmt"
import "core:strings"

import "../../raylib"

MAX_BUNNIES :: 100000;

Bunny :: struct {
    position : raylib.Vector2,
    speed    : raylib.Vector2,
    color    : raylib.Color,
}

get_random_color :: inline proc() -> raylib.Color {
    return raylib.Color {
        cast(u8)raylib.get_random_value(0, 255),
        cast(u8)raylib.get_random_value(0, 255),
        cast(u8)raylib.get_random_value(0, 255),
        255
    };
}

main :: proc() {

    screen_width :: 1280;
    screen_height :: 960;

    raylib.init_window(screen_width, screen_height, "raylib-odin example :: Bunnymark");
    defer raylib.close_window();

    tex_bunny := raylib.load_texture("resources/bunnymark/wabbit_alpha.png");

    bunnies := make([]Bunny, MAX_BUNNIES);

    bunnies_count := 0;

    raylib.set_target_fps(120);

    for !raylib.window_should_close() {
        if raylib.is_mouse_button_down(.LEFT_BUTTON) {
            for _ in 0..100 {
                new_bunny := &bunnies[bunnies_count];
                bunnies_count += 1;

                using new_bunny;
                position = raylib.get_mouse_position();
                speed.x = f32(raylib.get_random_value(250, 500)) / f32(60);
                speed.y = f32(raylib.get_random_value(250, 500) - 500) / f32(60);
                color = get_random_color();
            }
        }

        for i in 0..bunnies_count {
            bunny := &bunnies[i];
            using bunny;

            position.x += speed.x;
            position.y += speed.y;

            if position.x > cast(f32)raylib.get_screen_width()  || position.x < 0 do speed.x *= -1;
            if position.y > cast(f32)raylib.get_screen_height() || position.y < 0 do speed.y *= -1;
        }

        raylib.begin_drawing();
        defer raylib.end_drawing();

        raylib.clear_background(raylib.RAYWHITE);

        for i in 0..bunnies_count {
            raylib.draw_texture(tex_bunny, cast(i32)bunnies[i].position.x, cast(i32)bunnies[i].position.y, bunnies[i].color);
        }

        raylib.draw_rectangle(0, 0, screen_width, 40, raylib.LIGHTGRAY);
        raylib.draw_text("raylib-odin bunnymark", 10, 10, 20, raylib.DARKGRAY);
        s := strings.clone_to_cstring(fmt.tprint("bunnies:", bunnies_count)); defer delete(s);
        raylib.draw_text(s, 400, 10, 20, raylib.RED);
        raylib.draw_fps(260, 10);
    }
}
