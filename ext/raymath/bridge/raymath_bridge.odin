
package raymath

using import "../types"

raymath_Funcs :: raymath_Funcs;

// re-export everything from ./types for convienience
RAYMATH_H :: RAYMATH_H;


Float3 :: Float3;
Float16 :: Float16;


import _c "core:c"

bridge_init :: proc(funcs: ^raymath_Funcs) {
    assert(funcs != nil);
    assert(funcs.clamp != nil);

    clamp = funcs.clamp;
    lerp = funcs.lerp;
    vector2_zero = funcs.vector2_zero;
    vector2_one = funcs.vector2_one;
    vector2_add = funcs.vector2_add;
    vector2_subtract = funcs.vector2_subtract;
    vector2_length = funcs.vector2_length;
    vector2_dot_product = funcs.vector2_dot_product;
    vector2_distance = funcs.vector2_distance;
    vector2_angle = funcs.vector2_angle;
    vector2_scale = funcs.vector2_scale;
    vector2_multiply_v = funcs.vector2_multiply_v;
    vector2_negate = funcs.vector2_negate;
    vector2_divide = funcs.vector2_divide;
    vector2_divide_v = funcs.vector2_divide_v;
    vector2_normalize = funcs.vector2_normalize;
    vector2_lerp = funcs.vector2_lerp;
    vector3_zero = funcs.vector3_zero;
    vector3_one = funcs.vector3_one;
    vector3_add = funcs.vector3_add;
    vector3_subtract = funcs.vector3_subtract;
    vector3_multiply = funcs.vector3_multiply;
    vector3_multiply_v = funcs.vector3_multiply_v;
    vector3_cross_product = funcs.vector3_cross_product;
    vector3_perpendicular = funcs.vector3_perpendicular;
    vector3_length = funcs.vector3_length;
    vector3_dot_product = funcs.vector3_dot_product;
    vector3_distance = funcs.vector3_distance;
    vector3_scale = funcs.vector3_scale;
    vector3_negate = funcs.vector3_negate;
    vector3_divide = funcs.vector3_divide;
    vector3_divide_v = funcs.vector3_divide_v;
    vector3_normalize = funcs.vector3_normalize;
    vector3_ortho_normalize = funcs.vector3_ortho_normalize;
    vector3_transform = funcs.vector3_transform;
    vector3_rotate_by_quaternion = funcs.vector3_rotate_by_quaternion;
    vector3_lerp = funcs.vector3_lerp;
    vector3_reflect = funcs.vector3_reflect;
    vector3_min = funcs.vector3_min;
    vector3_max = funcs.vector3_max;
    vector3_barycenter = funcs.vector3_barycenter;
    vector3_to_float_v = funcs.vector3_to_float_v;
    matrix_determinant = funcs.matrix_determinant;
    matrix_trace = funcs.matrix_trace;
    matrix_transpose = funcs.matrix_transpose;
    matrix_invert = funcs.matrix_invert;
    matrix_normalize = funcs.matrix_normalize;
    matrix_identity = funcs.matrix_identity;
    matrix_add = funcs.matrix_add;
    matrix_subtract = funcs.matrix_subtract;
    matrix_translate = funcs.matrix_translate;
    matrix_rotate = funcs.matrix_rotate;
    matrix_rotate_x = funcs.matrix_rotate_x;
    matrix_rotate_y = funcs.matrix_rotate_y;
    matrix_rotate_z = funcs.matrix_rotate_z;
    matrix_scale = funcs.matrix_scale;
    matrix_multiply = funcs.matrix_multiply;
    matrix_frustum = funcs.matrix_frustum;
    matrix_perspective = funcs.matrix_perspective;
    matrix_ortho = funcs.matrix_ortho;
    matrix_look_at = funcs.matrix_look_at;
    matrix_to_float_v = funcs.matrix_to_float_v;
    quaternion_identity = funcs.quaternion_identity;
    quaternion_length = funcs.quaternion_length;
    quaternion_normalize = funcs.quaternion_normalize;
    quaternion_invert = funcs.quaternion_invert;
    quaternion_multiply = funcs.quaternion_multiply;
    quaternion_lerp = funcs.quaternion_lerp;
    quaternion_nlerp = funcs.quaternion_nlerp;
    quaternion_slerp = funcs.quaternion_slerp;
    quaternion_from_vector3_to_vector3 = funcs.quaternion_from_vector3_to_vector3;
    quaternion_from_matrix = funcs.quaternion_from_matrix;
    quaternion_to_matrix = funcs.quaternion_to_matrix;
    quaternion_from_axis_angle = funcs.quaternion_from_axis_angle;
    quaternion_to_axis_angle = funcs.quaternion_to_axis_angle;
    quaternion_from_euler = funcs.quaternion_from_euler;
    quaternion_to_euler = funcs.quaternion_to_euler;
    quaternion_transform = funcs.quaternion_transform;
}

bridge_deinit :: proc() {
}

clamp : proc "c" (
        value : _c.float,
        min : _c.float,
        max : _c.float
    ) -> _c.float;
lerp : proc "c" (
        start : _c.float,
        end : _c.float,
        amount : _c.float
    ) -> _c.float;
vector2_zero : proc "c" () -> Vector2;
vector2_one : proc "c" () -> Vector2;
vector2_add : proc "c" (
        v1 : Vector2,
        v2 : Vector2
    ) -> Vector2;
vector2_subtract : proc "c" (
        v1 : Vector2,
        v2 : Vector2
    ) -> Vector2;
vector2_length : proc "c" (v : Vector2) -> _c.float;
vector2_dot_product : proc "c" (
        v1 : Vector2,
        v2 : Vector2
    ) -> _c.float;
vector2_distance : proc "c" (
        v1 : Vector2,
        v2 : Vector2
    ) -> _c.float;
vector2_angle : proc "c" (
        v1 : Vector2,
        v2 : Vector2
    ) -> _c.float;
vector2_scale : proc "c" (
        v : Vector2,
        scale : _c.float
    ) -> Vector2;
vector2_multiply_v : proc "c" (
        v1 : Vector2,
        v2 : Vector2
    ) -> Vector2;
vector2_negate : proc "c" (v : Vector2) -> Vector2;
vector2_divide : proc "c" (
        v : Vector2,
        div : _c.float
    ) -> Vector2;
vector2_divide_v : proc "c" (
        v1 : Vector2,
        v2 : Vector2
    ) -> Vector2;
vector2_normalize : proc "c" (v : Vector2) -> Vector2;
vector2_lerp : proc "c" (
        v1 : Vector2,
        v2 : Vector2,
        amount : _c.float
    ) -> Vector2;
vector3_zero : proc "c" () -> Vector3;
vector3_one : proc "c" () -> Vector3;
vector3_add : proc "c" (
        v1 : Vector3,
        v2 : Vector3
    ) -> Vector3;
vector3_subtract : proc "c" (
        v1 : Vector3,
        v2 : Vector3
    ) -> Vector3;
vector3_multiply : proc "c" (
        v : Vector3,
        scalar : _c.float
    ) -> Vector3;
vector3_multiply_v : proc "c" (
        v1 : Vector3,
        v2 : Vector3
    ) -> Vector3;
vector3_cross_product : proc "c" (
        v1 : Vector3,
        v2 : Vector3
    ) -> Vector3;
vector3_perpendicular : proc "c" (v : Vector3) -> Vector3;
vector3_length : proc "c" (v : Vector3) -> _c.float;
vector3_dot_product : proc "c" (
        v1 : Vector3,
        v2 : Vector3
    ) -> _c.float;
vector3_distance : proc "c" (
        v1 : Vector3,
        v2 : Vector3
    ) -> _c.float;
vector3_scale : proc "c" (
        v : Vector3,
        scale : _c.float
    ) -> Vector3;
vector3_negate : proc "c" (v : Vector3) -> Vector3;
vector3_divide : proc "c" (
        v : Vector3,
        div : _c.float
    ) -> Vector3;
vector3_divide_v : proc "c" (
        v1 : Vector3,
        v2 : Vector3
    ) -> Vector3;
vector3_normalize : proc "c" (v : Vector3) -> Vector3;
vector3_ortho_normalize : proc "c" (
        v1 : ^Vector3,
        v2 : ^Vector3
    );
vector3_transform : proc "c" (
        v : Vector3,
        mat : Matrix
    ) -> Vector3;
vector3_rotate_by_quaternion : proc "c" (
        v : Vector3,
        q : Quaternion
    ) -> Vector3;
vector3_lerp : proc "c" (
        v1 : Vector3,
        v2 : Vector3,
        amount : _c.float
    ) -> Vector3;
vector3_reflect : proc "c" (
        v : Vector3,
        normal : Vector3
    ) -> Vector3;
vector3_min : proc "c" (
        v1 : Vector3,
        v2 : Vector3
    ) -> Vector3;
vector3_max : proc "c" (
        v1 : Vector3,
        v2 : Vector3
    ) -> Vector3;
vector3_barycenter : proc "c" (
        p : Vector3,
        a : Vector3,
        b : Vector3,
        c : Vector3
    ) -> Vector3;
vector3_to_float_v : proc "c" (v : Vector3) -> Float3;
matrix_determinant : proc "c" (mat : Matrix) -> _c.float;
matrix_trace : proc "c" (mat : Matrix) -> _c.float;
matrix_transpose : proc "c" (mat : Matrix) -> Matrix;
matrix_invert : proc "c" (mat : Matrix) -> Matrix;
matrix_normalize : proc "c" (mat : Matrix) -> Matrix;
matrix_identity : proc "c" () -> Matrix;
matrix_add : proc "c" (
        left : Matrix,
        right : Matrix
    ) -> Matrix;
matrix_subtract : proc "c" (
        left : Matrix,
        right : Matrix
    ) -> Matrix;
matrix_translate : proc "c" (
        x : _c.float,
        y : _c.float,
        z : _c.float
    ) -> Matrix;
matrix_rotate : proc "c" (
        axis : Vector3,
        angle : _c.float
    ) -> Matrix;
matrix_rotate_x : proc "c" (angle : _c.float) -> Matrix;
matrix_rotate_y : proc "c" (angle : _c.float) -> Matrix;
matrix_rotate_z : proc "c" (angle : _c.float) -> Matrix;
matrix_scale : proc "c" (
        x : _c.float,
        y : _c.float,
        z : _c.float
    ) -> Matrix;
matrix_multiply : proc "c" (
        left : Matrix,
        right : Matrix
    ) -> Matrix;
matrix_frustum : proc "c" (
        left : _c.double,
        right : _c.double,
        bottom : _c.double,
        top : _c.double,
        near : _c.double,
        far : _c.double
    ) -> Matrix;
matrix_perspective : proc "c" (
        fovy : _c.double,
        aspect : _c.double,
        near : _c.double,
        far : _c.double
    ) -> Matrix;
matrix_ortho : proc "c" (
        left : _c.double,
        right : _c.double,
        bottom : _c.double,
        top : _c.double,
        near : _c.double,
        far : _c.double
    ) -> Matrix;
matrix_look_at : proc "c" (
        eye : Vector3,
        target : Vector3,
        up : Vector3
    ) -> Matrix;
matrix_to_float_v : proc "c" (mat : Matrix) -> Float16;
quaternion_identity : proc "c" () -> Quaternion;
quaternion_length : proc "c" (q : Quaternion) -> _c.float;
quaternion_normalize : proc "c" (q : Quaternion) -> Quaternion;
quaternion_invert : proc "c" (q : Quaternion) -> Quaternion;
quaternion_multiply : proc "c" (
        q1 : Quaternion,
        q2 : Quaternion
    ) -> Quaternion;
quaternion_lerp : proc "c" (
        q1 : Quaternion,
        q2 : Quaternion,
        amount : _c.float
    ) -> Quaternion;
quaternion_nlerp : proc "c" (
        q1 : Quaternion,
        q2 : Quaternion,
        amount : _c.float
    ) -> Quaternion;
quaternion_slerp : proc "c" (
        q1 : Quaternion,
        q2 : Quaternion,
        amount : _c.float
    ) -> Quaternion;
quaternion_from_vector3_to_vector3 : proc "c" (
        from : Vector3,
        to : Vector3
    ) -> Quaternion;
quaternion_from_matrix : proc "c" (mat : Matrix) -> Quaternion;
quaternion_to_matrix : proc "c" (q : Quaternion) -> Matrix;
quaternion_from_axis_angle : proc "c" (
        axis : Vector3,
        angle : _c.float
    ) -> Quaternion;
quaternion_to_axis_angle : proc "c" (
        q : Quaternion,
        out_axis : ^Vector3,
        out_angle : ^_c.float
    );
quaternion_from_euler : proc "c" (
        roll : _c.float,
        pitch : _c.float,
        yaw : _c.float
    ) -> Quaternion;
quaternion_to_euler : proc "c" (q : Quaternion) -> Vector3;
quaternion_transform : proc "c" (
        q : Quaternion,
        mat : Matrix
    ) -> Quaternion;
