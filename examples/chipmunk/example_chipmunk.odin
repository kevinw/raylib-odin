package example_chipmunk

using import "../../raylib"

import cp "../../ext/chipmunk"
import "core:math"
import "core:fmt"
import "core:math/rand"

using import "../shared/chipmunk_ext"

NUM_VERTS :: 5;

Accumulator := 0.0;
MAX_FRAME_TIME := 0.2;
FIXED_DT := 1.0 / 60.0;

main :: proc() {
    space := cp.space_new();

    cp.space_set_iterations(space, 5);
    cp.space_set_gravity(space, cpv(0, -100));

    body := cp.space_get_static_body(space);
    static_body := body;
    shape : ^cp.Shape;

    tris : [3]cp.Vect = {
        cpv(-15, -15),
        cpv(0, 10),
        cpv(15, -15)
    };

    for i in 0..10 {
        for j in 0..7 {
            stagger := (j % 2) * 40.0;
            offset := cpv(i*80 - 320 + stagger, j*70 - 240);
            shape = cp.space_add_shape(space, cp.poly_shape_new(static_body, len(tris), &tris[0], TransformTranslate(offset), 0.0));
            cp.shape_set_elasticity(shape, 1);
            cp.shape_set_friction(shape, 1);
            cp.shape_set_filter(shape, NOT_GRABBABLE_FILTER);
        }
    }

    verts : [NUM_VERTS]cp.Vect;
    for _, i in verts {
        angle := -2.0 * math.PI * cast(f32)i / f32(NUM_VERTS);
        verts[i] = cpv(10.0*math.cos(angle), 10.0*math.sin(angle));
    }

    pentagon_mass := 1.0;
    pentagon_moment := cp.moment_for_poly(1.0, NUM_VERTS, &verts[0], cpv(0, 0), 0.0);

    for _ in 0..300 {
        body = cp.space_add_body(space, cp.body_new(pentagon_mass, pentagon_moment));
        x := rand.float32() * 640 - 320;
        cp.body_set_position(body, cpv(x, 350));

        shape = cp.space_add_shape(space, cp.poly_shape_new(body, NUM_VERTS, &verts[0], TransformIdentity, 0));
        cp.shape_set_elasticity(shape, 0);
        cp.shape_set_friction(shape, 0.4);
    }


    screenWidth, screenHeight:i32 = 800, 450;
    init_window(screenWidth, screenHeight, "odin-chipmunk :: Plink");
    defer close_window();

    camera := Camera2D { math.Vec2{}, math.Vec2{280, 320/2}, 180, .65 };
    
    set_target_fps(60);
    for !window_should_close() {  // Detect window close button or ESC key
        {
            // Fixed update time loop for chipmunk
            delta_time := cast(f64)get_frame_time();
            if delta_time > MAX_FRAME_TIME do delta_time = MAX_FRAME_TIME;
            for Accumulator += delta_time; Accumulator > FIXED_DT; Accumulator -= FIXED_DT {
                cp.space_step(space, FIXED_DT);
            }
        }

        begin_drawing();
        defer end_drawing();

        clear_background(BLACK);

        begin_mode_2d(camera);
        space_debug_draw(space);
        end_mode_2d();

        draw_fps(5, 5);
    }

    free_space_children(space);
    cp.space_free(space);
}

