
package physac

using import "../types"

physac_Funcs :: physac_Funcs;

// re-export everything from ./types for convienience
PHYSAC_H :: PHYSAC_H;
PHYSAC_MAX_BODIES :: PHYSAC_MAX_BODIES;
PHYSAC_MAX_MANIFOLDS :: PHYSAC_MAX_MANIFOLDS;
PHYSAC_MAX_VERTICES :: PHYSAC_MAX_VERTICES;
PHYSAC_CIRCLE_VERTICES :: PHYSAC_CIRCLE_VERTICES;
PHYSAC_DESIRED_DELTATIME :: PHYSAC_DESIRED_DELTATIME;
PHYSAC_MAX_TIMESTEP :: PHYSAC_MAX_TIMESTEP;
PHYSAC_COLLISION_ITERATIONS :: PHYSAC_COLLISION_ITERATIONS;
PHYSAC_PENETRATION_ALLOWANCE :: PHYSAC_PENETRATION_ALLOWANCE;
PHYSAC_PENETRATION_CORRECTION :: PHYSAC_PENETRATION_CORRECTION;
PHYSAC_PI :: PHYSAC_PI;
PHYSAC_DEG2RAD :: PHYSAC_DEG2RAD;

PhysicsBody :: PhysicsBody;

PhysicsBodyData :: PhysicsBodyData;
Mat2 :: Mat2;
PolygonData :: PolygonData;
PhysicsShape :: PhysicsShape;
PhysicsManifoldData :: PhysicsManifoldData;
PhysicsShapeType :: PhysicsShapeType;


import _c "core:c"

bridge_init :: proc(funcs: ^physac_Funcs) {
    assert(funcs != nil);
    assert(funcs.init_physics != nil);

    init_physics = funcs.init_physics;
    is_physics_enabled = funcs.is_physics_enabled;
    set_physics_gravity = funcs.set_physics_gravity;
    create_physics_body_circle = funcs.create_physics_body_circle;
    create_physics_body_rectangle = funcs.create_physics_body_rectangle;
    create_physics_body_polygon = funcs.create_physics_body_polygon;
    physics_add_force = funcs.physics_add_force;
    physics_add_torque = funcs.physics_add_torque;
    physics_shatter = funcs.physics_shatter;
    get_physics_bodies_count = funcs.get_physics_bodies_count;
    get_physics_body = funcs.get_physics_body;
    get_physics_shape_type = funcs.get_physics_shape_type;
    get_physics_shape_vertices_count = funcs.get_physics_shape_vertices_count;
    get_physics_shape_vertex = funcs.get_physics_shape_vertex;
    set_physics_body_rotation = funcs.set_physics_body_rotation;
    destroy_physics_body = funcs.destroy_physics_body;
    reset_physics = funcs.reset_physics;
    close_physics = funcs.close_physics;
    physics_loop = funcs.physics_loop;
}

bridge_deinit :: proc() {
}

init_physics : proc "c" ();
is_physics_enabled : proc "c" () -> bool;
set_physics_gravity : proc "c" (
        x : _c.float,
        y : _c.float
    );
create_physics_body_circle : proc "c" (
        pos : Vector2,
        radius : _c.float,
        density : _c.float
    ) -> PhysicsBody;
create_physics_body_rectangle : proc "c" (
        pos : Vector2,
        width : _c.float,
        height : _c.float,
        density : _c.float
    ) -> PhysicsBody;
create_physics_body_polygon : proc "c" (
        pos : Vector2,
        radius : _c.float,
        sides : _c.int,
        density : _c.float
    ) -> PhysicsBody;
physics_add_force : proc "c" (
        body : PhysicsBody,
        force : Vector2
    );
physics_add_torque : proc "c" (
        body : PhysicsBody,
        amount : _c.float
    );
physics_shatter : proc "c" (
        body : PhysicsBody,
        position : Vector2,
        force : _c.float
    );
get_physics_bodies_count : proc "c" () -> _c.int;
get_physics_body : proc "c" (index : _c.int) -> PhysicsBody;
get_physics_shape_type : proc "c" (index : _c.int) -> _c.int;
get_physics_shape_vertices_count : proc "c" (index : _c.int) -> _c.int;
get_physics_shape_vertex : proc "c" (
        body : PhysicsBody,
        vertex : _c.int
    ) -> Vector2;
set_physics_body_rotation : proc "c" (
        body : PhysicsBody,
        radians : _c.float
    );
destroy_physics_body : proc "c" (body : PhysicsBody);
reset_physics : proc "c" ();
close_physics : proc "c" ();
physics_loop : proc "c" (data : rawptr) -> rawptr;
