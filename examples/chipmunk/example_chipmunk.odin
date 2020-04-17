package example_chipmunk

import "../../raylib"

import cp "../../ext/chipmunk"
import "core:math"
import "core:fmt"
import "core:math/rand"

import "../shared/chipmunk_ext"

NUM_VERTS :: 5;

Accumulator := 0.0;
MAX_FRAME_TIME := 0.2;
FIXED_DT := 1.0 / 60.0;


main :: proc() {
    space := cp.space_new();

    cp.space_set_iterations(space, 5);
    cp.space_set_gravity(space, chipmunk_ext.cpv(0, -100));

    body := cp.space_get_static_body(space);
    static_body := body;
    shape : ^cp.Shape;

    tris : [3]cp.Vect = {
        chipmunk_ext.cpv(-15, -15),
        chipmunk_ext.cpv(0, 10),
        chipmunk_ext.cpv(15, -15)
    };

    for i in 0..10 {
        for j in 0..7 {
            stagger := (j % 2) * 40.0;
            offset := chipmunk_ext.cpv(i*80 - 320 + stagger, j*70 - 240);
            shape = cp.space_add_shape(space, cp.poly_shape_new(static_body, len(tris), &tris[0], chipmunk_ext.TransformTranslate(offset), 0.0));
            cp.shape_set_elasticity(shape, 1);
            cp.shape_set_friction(shape, 1);
            cp.shape_set_filter(shape, chipmunk_ext.NOT_GRABBABLE_FILTER);
        }
    }

    verts : [NUM_VERTS]cp.Vect;
    for _, i in verts {
        angle := -2.0 * math.PI * cast(f32)i / f32(NUM_VERTS);
        verts[i] = chipmunk_ext.cpv(10.0*math.cos(angle), 10.0*math.sin(angle));
    }

    pentagon_mass := 1.0;
    pentagon_moment := cp.moment_for_poly(1.0, NUM_VERTS, &verts[0], chipmunk_ext.cpv(0, 0), 0.0);

    for _ in 0..300 {
        body = cp.space_add_body(space, cp.body_new(pentagon_mass, pentagon_moment));
        x := rand.float32() * 640 - 320;
        cp.body_set_position(body, chipmunk_ext.cpv(x, 350));

        shape = cp.space_add_shape(space, cp.poly_shape_new(body, NUM_VERTS, &verts[0], chipmunk_ext.TransformIdentity, 0));
        cp.shape_set_elasticity(shape, 0);
        cp.shape_set_friction(shape, 0.4);
    }


    screenWidth, screenHeight:i32 = 800, 450;
    raylib.init_window(screenWidth, screenHeight, "odin-chipmunk :: Plink");
    defer raylib.close_window();

    camera := raylib.Camera2D { chipmunk_ext.Vec2{}, chipmunk_ext.Vec2{280, 320/2}, 180, .65 };
    
    raylib.set_target_fps(60);
    for !raylib.window_should_close() {  // Detect window close button or ESC key
        {
            // Fixed update time loop for chipmunk
            delta_time := cast(f64)raylib.get_frame_time();
            if delta_time > MAX_FRAME_TIME do delta_time = MAX_FRAME_TIME;
            for Accumulator += delta_time; Accumulator > FIXED_DT; Accumulator -= FIXED_DT {
                cp.space_step(space, FIXED_DT);
            }
        }

        raylib.begin_drawing();
        defer raylib.end_drawing();

        raylib.clear_background(raylib.BLACK);

        raylib.begin_mode_2d(camera);
        chipmunk_ext.space_debug_draw(space);
        raylib.end_mode_2d();

        raylib.draw_fps(5, 5);
    }

    chipmunk_ext.free_space_children(space);
    cp.space_free(space);
}

