package example_chipmunk

using import "../../raylib"

import cp "../../ext/chipmunk"
import "core:math"
import "core:math/rand"

using import "../shared/chipmunk_ext"
using import "../../../shmup/src/input"

NUM_VERTS :: 5;

Accumulator := 0.0;
MAX_FRAME_TIME := 0.2;
FIXED_DT := 1.0 / 180.0;

@private seg_radius :: 3.0;

make_leg :: proc(space: ^cp.Space, side, offset: cp.Float, chassis, crank: ^cp.Body, anchor: cp.Vect) {
    leg_mass := 1.0;

    // make leg
    a := cpv(0, 0);
    b := cpv(0.0, side);

    upper_leg := cp.space_add_body(space, cp.body_new(leg_mass, cp.moment_for_segment(leg_mass, a, b, 0.0)));
    cp.body_set_position(upper_leg, cpv(offset, 0.0));

    shape := cp.space_add_shape(space, cp.segment_shape_new(upper_leg, a, b, seg_radius));
    cp.shape_set_filter(shape, cp.ShapeFilter {1, ALL_CATEGORIES, ALL_CATEGORIES} );

    cp.space_add_constraint(space, cp.pivot_joint_new_2(chassis, upper_leg, cpv(offset, 0.0), cpv(0, 0)));
    
    // lower leg
    a = cpv(0, 0);
    b = cpv(0.0, -1.0 * side);
    lower_leg := cp.space_add_body(space, cp.body_new(leg_mass, cp.moment_for_segment(leg_mass, a, b, 0.0)));
    cp.body_set_position(lower_leg, cpv(offset, -side));

    shape = cp.space_add_shape(space, cp.segment_shape_new(lower_leg, a, b, seg_radius));
    cp.shape_set_filter(shape, cp.ShapeFilter{1, ALL_CATEGORIES, ALL_CATEGORIES});

    shape = cp.space_add_shape(space, cp.circle_shape_new(lower_leg, seg_radius * 2.0, b));
    cp.shape_set_filter(shape, cp.ShapeFilter{1, ALL_CATEGORIES, ALL_CATEGORIES});
    cp.shape_set_elasticity(shape, 0);
    cp.shape_set_friction(shape, 1);

    cp.space_add_constraint(space, cp.pin_joint_new(chassis, lower_leg, cpv(offset, 0.0), cpv(0, 0)));
    
    cp.space_add_constraint(space, cp.gear_joint_new(upper_leg, lower_leg, 0.0, 1.0));

    diag := math.sqrt(side * side + offset * offset);

    constraint := cp.space_add_constraint(space, cp.pin_joint_new(crank, upper_leg, anchor, cpv(0.0, side)));
    cp.pin_joint_set_dist(constraint, diag);

    constraint = cp.space_add_constraint(space, cp.pin_joint_new(crank, lower_leg, anchor, cpv(0, 0)));
    cp.pin_joint_set_dist(constraint, diag);
}

main :: proc() {
    space := cp.space_new();
    defer cp.space_free(space);
    defer free_space_children(space);

    cp.space_set_iterations(space, 20);
    cp.space_set_gravity(space, cpv(0, -500));

    static_body := cp.space_get_static_body(space);
    shape : ^cp.Shape;

    // Create segments around the edge of the screen.
    shape = cp.space_add_shape(space, cp.segment_shape_new(static_body, cpv(-320, -240), cpv(-320, 240), 0));
    cp.shape_set_elasticity(shape, 1);
    cp.shape_set_friction(shape, 1);
    cp.shape_set_filter(shape, NOT_GRABBABLE_FILTER);

    shape = cp.space_add_shape(space, cp.segment_shape_new(static_body, cpv(320, -240), cpv(320,240), 0));
    cp.shape_set_elasticity(shape, 1);
    cp.shape_set_friction(shape, 1);
    cp.shape_set_filter(shape, NOT_GRABBABLE_FILTER);

    shape = cp.space_add_shape(space, cp.segment_shape_new(static_body, cpv(-320, -240), cpv(320, -240), 0));
    cp.shape_set_elasticity(shape, 1);
    cp.shape_set_friction(shape, 1);
    cp.shape_set_filter(shape, NOT_GRABBABLE_FILTER);

    make_walker :: proc(space: ^cp.Space, pos: cp.Vect) -> ^cp.Constraint {

        offset := 30.0;

        // make chassis
        chassis_mass := 2.0;
        a, b := cpv(-offset, 0.0), cpv(offset, 0.0);
        chassis := cp.space_add_body(space, cp.body_new(chassis_mass, cp.moment_for_segment(chassis_mass, a, b, 0)));

        shape := cp.space_add_shape(space, cp.segment_shape_new(chassis, a, b, seg_radius));
        cp.shape_set_filter(shape, cp.ShapeFilter{1, ALL_CATEGORIES, ALL_CATEGORIES});

        // make crank
        crank_mass := 1.0;
        crank_radius := rand.float64() * 43.0;
        //crank_radius := 13.0;
        crank := cp.space_add_body(space, cp.body_new(crank_mass, cp.moment_for_circle(crank_mass, crank_radius, 0, cpv(0, 0))));

        shape = cp.space_add_shape(space, cp.circle_shape_new(crank, crank_radius, cpv(0, 0)));
        cp.shape_set_filter(shape, cp.ShapeFilter{1, ALL_CATEGORIES, ALL_CATEGORIES});

        cp.space_add_constraint(space, cp.pivot_joint_new_2(chassis, crank, cpv(0, 0), cpv(0, 0)));

        side := 30.0;
        num_legs := 2;

        cpvmult :: inline proc(v: cp.Vect, s: cp.Float) -> cp.Vect { return cpv(v.x * s, v.y * s); }
        cpvforangle :: inline proc(a: cp.Float) -> cp.Vect { return cpv(math.cos(a), math.sin(a)); }

        for i in 0..num_legs-1 {
            make_leg(space, side,  offset, chassis, crank, cpvmult(cpvforangle(cast(cp.Float)(2*i+0)/cast(cp.Float)num_legs*math.PI), crank_radius));
            make_leg(space, side, -offset, chassis, crank, cpvmult(cpvforangle(cast(cp.Float)(2*i+1)/cast(cp.Float)num_legs*math.PI), crank_radius));
        }

        motor := cp.space_add_constraint(space, cp.simple_motor_new(chassis, crank, 6.0));

        return motor;
    }

    motor1 := make_walker(space, cpv(0, 0));
    motor2 := make_walker(space, cpv(0, 0));

    //

    screenWidth, screenHeight:i32 = 800, 450;
    windowWidth, windowHeight:i32 = screenWidth * 2, screenHeight * 2;
    init_window(windowWidth, windowHeight, "odin-chipmunk :: TheoJansen");
    defer close_window();

    screen_rt := load_render_texture(screenWidth, screenHeight);
    defer unload_render_texture(screen_rt);

    camera := Camera2D { math.Vec2{}, math.Vec2{200, 320/2 - 80}, 180, 1.2 };
    
    set_target_fps(60);
    for !window_should_close() {  // Detect window close button or ESC key
        {
            // Fixed update time loop for chipmunk
            delta_time := cast(f64)get_frame_time();
            if delta_time > MAX_FRAME_TIME do delta_time = MAX_FRAME_TIME;
            for Accumulator += delta_time; Accumulator > FIXED_DT; Accumulator -= FIXED_DT {

                {
                    keys := input.keyboard_xy_player(0);
                    rate := f64(-keys.x * 10.0 * (2.0 + keys.y) / 3.0);
                    cp.simple_motor_set_rate(motor1, rate);
                    cp.constraint_set_max_force(motor1, rate != 0.0 ? 100000.0 : 0.0);
                }
                {
                    keys := input.keyboard_xy_player(1);
                    rate := f64(-keys.x * 10.0 * (2.0 + keys.y) / 3.0);
                    cp.simple_motor_set_rate(motor2, rate);
                    cp.constraint_set_max_force(motor2, rate != 0.0 ? 100000.0 : 0.0);
                }

                cp.space_step(space, FIXED_DT);
            }
        }

        {
            begin_drawing();
            defer end_drawing();

            {
                begin_texture_mode(screen_rt);
                defer end_texture_mode();

                clear_background(RAYWHITE);

                {
                    begin_mode_2d(camera);
                    defer end_mode_2d();
                    space_debug_draw(space);
                }
            }

            src_rect  := Rectangle { 0, 0, cast(f32)screenWidth, -cast(f32)screenHeight };
            dest_rect := Rectangle { 0, 0, cast(f32)windowWidth, cast(f32)windowHeight };
            draw_texture_pro(screen_rt.texture, src_rect, dest_rect, Vector2 { 0, 0 }, 0, WHITE);

            draw_fps(5, 5);
        }
    }
}

