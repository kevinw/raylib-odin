package example_physac

import "core:thread"

using import "../../raylib"

import physac "../../ext/physac"

_physics_loop :: proc(^thread.Thread) -> int {
    physac.physics_loop(nil);
    return 0;
}

main :: proc() {
    screenWidth:f32 = 800.0;
    screenHeight:f32 = 450.0;
    init_window(cast(i32)screenWidth, cast(i32)screenHeight, "raylib-odin :: physac example");
    set_target_fps(60);

    physac.init_physics();

    t := thread.create(_physics_loop);
    thread.start(t);

    defer physac.close_physics();

    floor := physac.create_physics_body_rectangle({ screenWidth / 2.0, screenHeight}, 500, 100, 10);
    floor.enabled = false;

    circle := physac.create_physics_body_circle({ screenWidth / 2.0, screenHeight / 2.0}, 45, 10);
    circle.enabled = false;

    for !window_should_close() {
        // Physics body creation inputs
        if is_mouse_button_pressed(.LEFT_BUTTON) do physac.create_physics_body_polygon(get_mouse_position(), cast(f32)get_random_value(20, 80), get_random_value(3, 8), 10);
        else if is_mouse_button_pressed(.RIGHT_BUTTON) do physac.create_physics_body_circle(get_mouse_position(), cast(f32)get_random_value(10, 45), 10);

        // Destroy falling physics bodies
        {
            bodies_count := physac.get_physics_bodies_count();
            for i in bodies_count-1..0 {
                body := physac.get_physics_body(i);
                if body != nil && body.position.y > screenHeight*2 do physac.destroy_physics_body(body);
            }
        }

        begin_drawing();
        defer end_drawing();

        clear_background(RAYWHITE);

        bodies_count := physac.get_physics_bodies_count();
        for i in 0..bodies_count - 1 {
            body := physac.get_physics_body(i);
            if body == nil do continue;

            vertex_count := physac.get_physics_shape_vertices_count(i);
            for j in 0..vertex_count - 1 {
                vertex_a := physac.get_physics_shape_vertex(body, j);

                jj := ((j + 1) < vertex_count) ? (j + 1) : 0;

                vertex_b := physac.get_physics_shape_vertex(body, jj);

                draw_line_v(vertex_a, vertex_b, GREEN);
            }

        }
    }

    close_window();
}
