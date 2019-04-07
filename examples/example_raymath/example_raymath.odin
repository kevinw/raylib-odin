package example_raymath

using import "../../raylib"

import raymath "../../ext/raymath"

Particle :: struct {
    pos: Vector2,
    speed: Vector2,
}

NUM_PARTICLES :: 300;
DRAG := Vector2 { 0.55, 0.55 };

main :: proc() {
    screenWidth:f32 = 800.0;
    screenHeight:f32 = 450.0;
    init_window(cast(i32)screenWidth, cast(i32)screenHeight, "raylib-odin :: raymath example");
    set_target_fps(60);

    particles : [NUM_PARTICLES]Particle;

    for i in 0..NUM_PARTICLES-1 {
        particles[i].pos = Vector2{
            cast(f32)get_random_value(0, cast(i32)screenWidth),
            cast(f32)get_random_value(0, cast(i32)screenHeight),
        };
        particles[i].speed = Vector2 {
            cast(f32)get_random_value(-300, 300),
            cast(f32)get_random_value(-300, 300),
        };
    }

    for !window_should_close() {
        for i in 0..NUM_PARTICLES-1 {
            p := &particles[i];
            using p;
            pos = raymath.vector2_add(pos, raymath.vector2_scale(speed, get_frame_time()));
            if pos.x < 0 || pos.x > screenWidth {
                pos.x = raymath.clamp(pos.x, 0, screenWidth);
                speed.x = -speed.x;
                speed = raymath.vector2_multiply_v(speed, DRAG);
            }
            if pos.y < 0 || pos.y > screenHeight {
                pos.y = raymath.clamp(pos.y, 0, screenHeight);
                speed.y = -speed.y;
                speed = raymath.vector2_multiply_v(speed, DRAG);
            }
        }

        begin_drawing();
        defer end_drawing();

        clear_background(RAYWHITE);
        for i in 0..NUM_PARTICLES-1 {
            draw_circle_v(particles[i].pos, 5, RED);
        }
    }

    close_window();
}
