// TODO: remove cp.transform_translate and other static inline funcs from the bindings
// and add their odin equivalents to an "ext" file that sits in the bindings package

package chipmunk_ext

import "core:math"
import "core:fmt"
import "core:mem"

import cp "../../../ext/chipmunk"
using import "../../../raylib"

cpv :: proc(a, b: $T) -> cp.Vect { return cp.Vect{cast(f64)a,cast(f64)b}; }

NO_GROUP :: 0;
NOT_GRABBABLE_FILTER := cp.ShapeFilter {NO_GROUP, ~GRABBABLE_MASK_BIT, ~GRABBABLE_MASK_BIT};

ALL_CATEGORIES :: ~u32(0);

//cpShapeFilter NOT_GRABBABLE_FILTER = {CP_NO_GROUP, ~GRABBABLE_MASK_BIT, ~GRABBABLE_MASK_BIT};

CollisionTypes :: enum {
	ONE_WAY = 1,
}

TransformIdentity := cp.Transform { 1, 0, 0, 1, 0, 0, };

GRABBABLE_MASK_BIT :u32 = 1<<31;

One_Way_Platform :: struct {
    n: cp.Vect,
}

platform_instance : One_Way_Platform;


to_color :: inline proc(c: $C) -> Color {
    return Color {
        cast(u8)(c.r * 255),
        cast(u8)(c.g * 255),
        cast(u8)(c.b * 255),
        cast(u8)(c.a * 255),
    };
}
to_vec2 :: inline proc(v: $V) -> math.Vec2 {
    return math.Vec2 { cast(f32)v.x, cast(f32)v.y };
}

free_space_children :: proc(space: ^cp.Space) {
    _post_shape_free :: proc "c" (shape: ^cp.Shape, space: ^cp.Space) {
        _shape_free_wrap :: proc(space: ^cp.Space, shape: ^cp.Shape, unused: rawptr) {
            cp.space_remove_shape(space, shape);
            cp.shape_free(shape);
        }
        cp.space_add_post_step_callback(space, cast(cp.PostStepFunc)_shape_free_wrap, shape, nil);
    }

    _post_constraint_free :: proc "c" (constraint: ^cp.Constraint, space: ^cp.Space) {
        _constraint_free_wrap :: proc(space: ^cp.Space, constraint: ^cp.Constraint, unused: rawptr) {
            cp.space_remove_constraint(space, constraint);
            cp.constraint_free(constraint);
        }

        cp.space_add_post_step_callback(space, cast(cp.PostStepFunc)_constraint_free_wrap, constraint, nil);
    }

    cp.space_each_shape(space, cast(cp.SpaceShapeIteratorFunc)_post_shape_free, space);
    cp.space_each_constraint(space, cast(cp.SpaceConstraintIteratorFunc)_post_constraint_free, space);
}

_draw_circle :: proc "c" (p: cp.Vect, a: cp.Float, outline, fill: cp.SpaceDebugColor, data: cp.DataPointer) {
    draw_circle_v(to_vec2(p), cast(f32)a, to_color(fill));
}

_draw_segment :: proc "c" (a, b: cp.Vect, color: cp.SpaceDebugColor, data: cp.DataPointer) {
    draw_line_v(to_vec2(a), to_vec2(b), to_color(color));
}

_draw_fat_segment :: proc "c" (a, b: cp.Vect, r: cp.Float, outline, fill: cp.SpaceDebugColor, data: cp.DataPointer) {
    draw_line_ex(to_vec2(a), to_vec2(b), cast(f32)r, to_color(fill));
}

_draw_polygon :: proc "c" (count: i32, verts: ^cp.Vect, r: cp.Float, outline, fill: cp.SpaceDebugColor, data: cp.DataPointer) {
    assert(count > 0 && count < 200000);

    points := make([]Vector2, count + 1, context.temp_allocator);

    verts_slice := mem.slice_ptr(verts, cast(int)count);

    for vert, i in verts_slice do points[i] = to_vec2(vert);

    points[count] = to_vec2(verts_slice[0]); // wrap back around

    draw_poly_ex(&points[0], count+1, to_color(fill));
    draw_poly_ex_lines(&points[0], count+1, to_color(outline));
}

_draw_dot :: proc "c" (size: cp.Float, pos: cp.Vect, color: cp.SpaceDebugColor, data: cp.DataPointer) {
    draw_pixel_v(to_vec2(pos), to_color(color));
}

LAColor :: inline proc(l, a: f32) -> cp.SpaceDebugColor do return cp.SpaceDebugColor {l, l, l, a};
RGBAColor :: inline proc(r,g,b,a: f32) -> cp.SpaceDebugColor do return cp.SpaceDebugColor {r, g, b, a};

color_for_shape :: proc "stdcall" (shape: ^cp.Shape, data: ^cp.DataPointer) -> cp.SpaceDebugColor {
	if cp.shape_get_sensor(shape) != 0 {
		return LAColor(1.0, 0.1);
	}

    body := cp.shape_get_body(shape);
		
    if cp.body_is_sleeping(body) != 0 {
        return LAColor(0.2, 1.0);
    }
        
    if body.sleeping.idle_time > shape.space.sleep_time_threshold {
        return LAColor(0.66, 1.0);
    }

    val:u32 = cast(u32)shape.hashid;
    
    // scramble the bits up using Robert Jenkins' 32 bit integer hash function
    val = (val+0x7ed55d16) + (val<<12);
    val = (val ~ 0xc761c23c) ~ (val>>19);
    val = (val+0x165667b1) + (val<<5);
    val = (val+0xd3a2646c) ~ (val<<9);
    val = (val+0xfd7046c5) + (val<<3);
    val = (val ~ 0xb55a4f09) ~ (val>>16);
    
    r := cast(f64)((val>>0) & 0xFF);
    g := cast(f64)((val>>8) & 0xFF);
    b := cast(f64)((val>>16) & 0xFF);
    
    max_val := max(max(r, g), b);
    min_val := min(min(r, g), b);
    intensity := cp.body_get_type(body) == .STATIC ? 0.15 : 0.75;
    
    // Saturate and scale the color
    if min_val == max_val {
        return RGBAColor(cast(f32)intensity, 0.0, 0.0, 1.0);
    }

    coef := cast(f64)intensity/(max_val - min_val);
    return RGBAColor(
        f32((r - min_val)*coef),
        f32((g - min_val)*coef),
        f32((b - min_val)*coef),
        1.0
    );
}

space_debug_draw :: proc(space: ^cp.Space) {
    options := cp.SpaceDebugDrawOptions {
        auto_cast _draw_circle,
        auto_cast _draw_segment,
        auto_cast _draw_fat_segment,
        auto_cast _draw_polygon,
        auto_cast _draw_dot,

	    cp.SpaceDebugDrawFlags.SHAPES | .CONSTRAINTS | .COLLISION_POINTS,

		{200.0/255.0, 210.0/255.0, 230.0/255.0, 1.0},
        0, // extra padding
		color_for_shape,
		{0, 0.75, 0.0, 1.0},
		{1.0, 0.0, 0.0, 1.0},
        nil,
    };

    cp.space_debug_draw(space, &options);
}

TransformNewTranspose :: inline proc(a, c, tx, b, d, ty: cp.Float) -> cp.Transform {
	return cp.Transform {a, b, c, d, tx, ty};
}

TransformTranslate :: inline proc(translate: cp.Vect) -> cp.Transform {
  return TransformNewTranspose(
    1.0, 0.0, translate.x,
    0.0, 1.0, translate.y
  );
}

