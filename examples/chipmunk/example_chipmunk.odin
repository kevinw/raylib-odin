package example_chipmunk

import cp "../../ext/chipmunk"
//import "core:fmt"

cpv :: proc(a, b: $T) -> cp.Vect { return cp.Vect{cast(f64)a,cast(f64)b}; }

//cpShapeFilter NOT_GRABBABLE_FILTER = {CP_NO_GROUP, ~GRABBABLE_MASK_BIT, ~GRABBABLE_MASK_BIT};

CollisionTypes :: enum {
	ONE_WAY = 1,
}

GRABBABLE_MASK_BIT :u32 = 1<<31;

main :: proc() {
    NO_GROUP :: 0;
    NOT_GRABBABLE_FILTER := cp.ShapeFilter {NO_GROUP, ~GRABBABLE_MASK_BIT, ~GRABBABLE_MASK_BIT};

    space := cp.space_new();
    cp.space_set_iterations(space, 10);
    cp.space_set_gravity(space, cp.Vect{0, -100});

    static_body := cp.space_get_static_body(space);

    shape := cp.space_add_shape(space, cp.segment_shape_new(static_body, cp.Vect{-320, -240}, cp.Vect{-320, 240}, 0.0));
    cp.shape_set_elasticity(shape, 1.0);

	cp.shape_set_friction(shape, 1.0);
	cp.shape_set_filter(shape, NOT_GRABBABLE_FILTER);

	shape = cp.space_add_shape(space, cp.segment_shape_new(static_body, cpv(320,-240), cpv(320,240), 0.0));
	cp.shape_set_elasticity(shape, 1.0);
	cp.shape_set_friction(shape, 1.0);
	cp.shape_set_filter(shape, NOT_GRABBABLE_FILTER);

	shape = cp.space_add_shape(space, cp.segment_shape_new(static_body, cpv(-320,-240), cpv(320,-240), 0.0));
	cp.shape_set_elasticity(shape, 1.0);
	cp.shape_set_friction(shape, 1.0);
	cp.shape_set_filter(shape, NOT_GRABBABLE_FILTER);
	
	// Add our one way segment
	shape = cp.space_add_shape(space, cp.segment_shape_new(static_body, cpv(-160,-100), cpv(160,-100), 10.0));
	cp.shape_set_elasticity(shape, 1.0);
	cp.shape_set_friction(shape, 1.0);
	cp.shape_set_collision_type(shape, cast(uintptr)CollisionTypes.ONE_WAY);
	cp.shape_set_filter(shape, NOT_GRABBABLE_FILTER);
}
