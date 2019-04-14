
package chipmunk

using import "../types"

chipmunk_Funcs :: chipmunk_Funcs;

// re-export everything from ./types for convienience

Float :: Float;
HashValue :: HashValue;
CollisionId :: CollisionId;
Bool :: Bool;
DataPointer :: DataPointer;
CollisionType :: CollisionType;
Group :: Group;
Bitmask :: Bitmask;
Timestamp :: Timestamp;
SpatialIndexBbFunc :: SpatialIndexBbFunc;
SpatialIndexIteratorFunc :: SpatialIndexIteratorFunc;
SpatialIndexQueryFunc :: SpatialIndexQueryFunc;
SpatialIndexSegmentQueryFunc :: SpatialIndexSegmentQueryFunc;
BbTreeVelocityFunc :: BbTreeVelocityFunc;
SpatialIndexDestroyImpl :: SpatialIndexDestroyImpl;
SpatialIndexCountImpl :: SpatialIndexCountImpl;
SpatialIndexEachImpl :: SpatialIndexEachImpl;
SpatialIndexContainsImpl :: SpatialIndexContainsImpl;
SpatialIndexInsertImpl :: SpatialIndexInsertImpl;
SpatialIndexRemoveImpl :: SpatialIndexRemoveImpl;
SpatialIndexReindexImpl :: SpatialIndexReindexImpl;
SpatialIndexReindexObjectImpl :: SpatialIndexReindexObjectImpl;
SpatialIndexReindexQueryImpl :: SpatialIndexReindexQueryImpl;
SpatialIndexQueryImpl :: SpatialIndexQueryImpl;
SpatialIndexSegmentQueryImpl :: SpatialIndexSegmentQueryImpl;
BodyVelocityFunc :: BodyVelocityFunc;
BodyPositionFunc :: BodyPositionFunc;
BodyShapeIteratorFunc :: BodyShapeIteratorFunc;
BodyConstraintIteratorFunc :: BodyConstraintIteratorFunc;
BodyArbiterIteratorFunc :: BodyArbiterIteratorFunc;
ConstraintPreSolveFunc :: ConstraintPreSolveFunc;
ConstraintPostSolveFunc :: ConstraintPostSolveFunc;
DampedSpringForceFunc :: DampedSpringForceFunc;
DampedRotarySpringTorqueFunc :: DampedRotarySpringTorqueFunc;
CollisionBeginFunc :: CollisionBeginFunc;
CollisionPreSolveFunc :: CollisionPreSolveFunc;
CollisionPostSolveFunc :: CollisionPostSolveFunc;
CollisionSeparateFunc :: CollisionSeparateFunc;
PostStepFunc :: PostStepFunc;
SpacePointQueryFunc :: SpacePointQueryFunc;
SpaceSegmentQueryFunc :: SpaceSegmentQueryFunc;
SpaceBbQueryFunc :: SpaceBbQueryFunc;
SpaceShapeQueryFunc :: SpaceShapeQueryFunc;
SpaceBodyIteratorFunc :: SpaceBodyIteratorFunc;
SpaceShapeIteratorFunc :: SpaceShapeIteratorFunc;
SpaceConstraintIteratorFunc :: SpaceConstraintIteratorFunc;
SpaceDebugDrawCircleImpl :: SpaceDebugDrawCircleImpl;
SpaceDebugDrawSegmentImpl :: SpaceDebugDrawSegmentImpl;
SpaceDebugDrawFatSegmentImpl :: SpaceDebugDrawFatSegmentImpl;
SpaceDebugDrawPolygonImpl :: SpaceDebugDrawPolygonImpl;
SpaceDebugDrawDotImpl :: SpaceDebugDrawDotImpl;
SpaceDebugDrawColorForShapeImpl :: SpaceDebugDrawColorForShapeImpl;
ShapeCacheDataImpl :: ShapeCacheDataImpl;
ShapeDestroyImpl :: ShapeDestroyImpl;
ShapePointQueryImpl :: ShapePointQueryImpl;
ShapeSegmentQueryImpl :: ShapeSegmentQueryImpl;
ConstraintPreStepImpl :: ConstraintPreStepImpl;
ConstraintApplyCachedImpulseImpl :: ConstraintApplyCachedImpulseImpl;
ConstraintApplyImpulseImpl :: ConstraintApplyImpulseImpl;
ConstraintGetImpulseImpl :: ConstraintGetImpulseImpl;
SpaceArbiterApplyImpulseFunc :: SpaceArbiterApplyImpulseFunc;

Vect :: Vect;
Transform :: Transform;
Mat2X2 :: Mat2X2;
Array :: Array;
HashSet :: HashSet;
Body :: Body;
Shape :: Shape;
CircleShape :: CircleShape;
SegmentShape :: SegmentShape;
PolyShape :: PolyShape;
Constraint :: Constraint;
PinJoint :: PinJoint;
SlideJoint :: SlideJoint;
PivotJoint :: PivotJoint;
GrooveJoint :: GrooveJoint;
DampedSpring :: DampedSpring;
DampedRotarySpring :: DampedRotarySpring;
RotaryLimitJoint :: RotaryLimitJoint;
RatchetJoint :: RatchetJoint;
GearJoint :: GearJoint;
SimpleMotorJoint :: SimpleMotorJoint;
CollisionHandler :: CollisionHandler;
ContactPointSet :: ContactPointSet;
Arbiter :: Arbiter;
Space :: Space;
Bb :: Bb;
SpatialIndexClass :: SpatialIndexClass;
SpatialIndex :: SpatialIndex;
SpaceHash :: SpaceHash;
BbTree :: BbTree;
Sweep1D :: Sweep1D;
AnonymousStruct0 :: AnonymousStruct0;
PointQueryInfo :: PointQueryInfo;
SegmentQueryInfo :: SegmentQueryInfo;
ShapeFilter :: ShapeFilter;
SimpleMotor :: SimpleMotor;
SpaceDebugColor :: SpaceDebugColor;
SpaceDebugDrawOptions :: SpaceDebugDrawOptions;
AnonymousStruct1 :: AnonymousStruct1;
ArbiterThread :: ArbiterThread;
Contact :: Contact;
CollisionInfo :: CollisionInfo;
ShapeMassInfo :: ShapeMassInfo;
ShapeClass :: ShapeClass;
SplittingPlane :: SplittingPlane;
ConstraintClass :: ConstraintClass;
ContactBufferHeader :: ContactBufferHeader;
PostStepCallback :: PostStepCallback;
BodyType :: BodyType;
SpaceDebugDrawFlags :: SpaceDebugDrawFlags;
ArbiterState :: ArbiterState;
ShapeType :: ShapeType;


import _c "core:c"

bridge_init :: proc(funcs: ^chipmunk_Funcs) {
    assert(funcs != nil);
    assert(funcs.message != nil);

    message = funcs.message;
    fmax = funcs.fmax;
    fmin = funcs.fmin;
    fabs = funcs.fabs;
    fclamp = funcs.fclamp;
    fclamp01 = funcs.fclamp01;
    flerp = funcs.flerp;
    flerpconst = funcs.flerpconst;
    v = funcs.v;
    veql = funcs.veql;
    vadd = funcs.vadd;
    vsub = funcs.vsub;
    vneg = funcs.vneg;
    vmult = funcs.vmult;
    vdot = funcs.vdot;
    vcross = funcs.vcross;
    vperp = funcs.vperp;
    vrperp = funcs.vrperp;
    vproject = funcs.vproject;
    vforangle = funcs.vforangle;
    vtoangle = funcs.vtoangle;
    vrotate = funcs.vrotate;
    vunrotate = funcs.vunrotate;
    vlengthsq = funcs.vlengthsq;
    vlength = funcs.vlength;
    vlerp = funcs.vlerp;
    vnormalize = funcs.vnormalize;
    vslerp = funcs.vslerp;
    vslerpconst = funcs.vslerpconst;
    vclamp = funcs.vclamp;
    vlerpconst = funcs.vlerpconst;
    vdist = funcs.vdist;
    vdistsq = funcs.vdistsq;
    vnear = funcs.vnear;
    mat_2x_2_new = funcs.mat_2x_2_new;
    mat_2x_2_transform = funcs.mat_2x_2_transform;
    bb_new = funcs.bb_new;
    bb_new_for_extents = funcs.bb_new_for_extents;
    bb_new_for_circle = funcs.bb_new_for_circle;
    bb_intersects = funcs.bb_intersects;
    bb_contains_bb = funcs.bb_contains_bb;
    bb_contains_vect = funcs.bb_contains_vect;
    bb_merge = funcs.bb_merge;
    bb_expand = funcs.bb_expand;
    bb_center = funcs.bb_center;
    bb_area = funcs.bb_area;
    bb_merged_area = funcs.bb_merged_area;
    bb_segment_query = funcs.bb_segment_query;
    bb_intersects_segment = funcs.bb_intersects_segment;
    bb_clamp_vect = funcs.bb_clamp_vect;
    bb_wrap_vect = funcs.bb_wrap_vect;
    bb_offset = funcs.bb_offset;
    transform_new = funcs.transform_new;
    transform_new_transpose = funcs.transform_new_transpose;
    transform_inverse = funcs.transform_inverse;
    transform_mult = funcs.transform_mult;
    transform_point = funcs.transform_point;
    transform_vect = funcs.transform_vect;
    transformb_bb = funcs.transformb_bb;
    transform_translate = funcs.transform_translate;
    transform_scale = funcs.transform_scale;
    transform_rotate = funcs.transform_rotate;
    transform_rigid = funcs.transform_rigid;
    transform_rigid_inverse = funcs.transform_rigid_inverse;
    transform_wrap = funcs.transform_wrap;
    transform_wrap_inverse = funcs.transform_wrap_inverse;
    transform_ortho = funcs.transform_ortho;
    transform_bone_scale = funcs.transform_bone_scale;
    transform_axial_scale = funcs.transform_axial_scale;
    space_hash_alloc = funcs.space_hash_alloc;
    space_hash_init = funcs.space_hash_init;
    space_hash_new = funcs.space_hash_new;
    space_hash_resize = funcs.space_hash_resize;
    bb_tree_alloc = funcs.bb_tree_alloc;
    bb_tree_init = funcs.bb_tree_init;
    bb_tree_new = funcs.bb_tree_new;
    bb_tree_optimize = funcs.bb_tree_optimize;
    bb_tree_set_velocity_func = funcs.bb_tree_set_velocity_func;
    sweep_1d_alloc = funcs.sweep_1d_alloc;
    sweep_1d_init = funcs.sweep_1d_init;
    sweep_1d_new = funcs.sweep_1d_new;
    spatial_index_free = funcs.spatial_index_free;
    spatial_index_collide_static = funcs.spatial_index_collide_static;
    spatial_index_destroy = funcs.spatial_index_destroy;
    spatial_index_count = funcs.spatial_index_count;
    spatial_index_each = funcs.spatial_index_each;
    spatial_index_contains = funcs.spatial_index_contains;
    spatial_index_insert = funcs.spatial_index_insert;
    spatial_index_remove = funcs.spatial_index_remove;
    spatial_index_reindex = funcs.spatial_index_reindex;
    spatial_index_reindex_object = funcs.spatial_index_reindex_object;
    spatial_index_query = funcs.spatial_index_query;
    spatial_index_segment_query = funcs.spatial_index_segment_query;
    spatial_index_reindex_query = funcs.spatial_index_reindex_query;
    arbiter_get_restitution = funcs.arbiter_get_restitution;
    arbiter_set_restitution = funcs.arbiter_set_restitution;
    arbiter_get_friction = funcs.arbiter_get_friction;
    arbiter_set_friction = funcs.arbiter_set_friction;
    arbiter_get_surface_velocity = funcs.arbiter_get_surface_velocity;
    arbiter_set_surface_velocity = funcs.arbiter_set_surface_velocity;
    arbiter_get_user_data = funcs.arbiter_get_user_data;
    arbiter_set_user_data = funcs.arbiter_set_user_data;
    arbiter_total_impulse = funcs.arbiter_total_impulse;
    arbiter_total_ke = funcs.arbiter_total_ke;
    arbiter_ignore = funcs.arbiter_ignore;
    arbiter_get_shapes = funcs.arbiter_get_shapes;
    arbiter_get_bodies = funcs.arbiter_get_bodies;
    arbiter_get_contact_point_set = funcs.arbiter_get_contact_point_set;
    arbiter_set_contact_point_set = funcs.arbiter_set_contact_point_set;
    arbiter_is_first_contact = funcs.arbiter_is_first_contact;
    arbiter_is_removal = funcs.arbiter_is_removal;
    arbiter_get_count = funcs.arbiter_get_count;
    arbiter_get_normal = funcs.arbiter_get_normal;
    arbiter_get_point_a = funcs.arbiter_get_point_a;
    arbiter_get_point_b = funcs.arbiter_get_point_b;
    arbiter_get_depth = funcs.arbiter_get_depth;
    arbiter_call_wildcard_begin_a = funcs.arbiter_call_wildcard_begin_a;
    arbiter_call_wildcard_begin_b = funcs.arbiter_call_wildcard_begin_b;
    arbiter_call_wildcard_pre_solve_a = funcs.arbiter_call_wildcard_pre_solve_a;
    arbiter_call_wildcard_pre_solve_b = funcs.arbiter_call_wildcard_pre_solve_b;
    arbiter_call_wildcard_post_solve_a = funcs.arbiter_call_wildcard_post_solve_a;
    arbiter_call_wildcard_post_solve_b = funcs.arbiter_call_wildcard_post_solve_b;
    arbiter_call_wildcard_separate_a = funcs.arbiter_call_wildcard_separate_a;
    arbiter_call_wildcard_separate_b = funcs.arbiter_call_wildcard_separate_b;
    body_alloc = funcs.body_alloc;
    body_init = funcs.body_init;
    body_new = funcs.body_new;
    body_new_kinematic = funcs.body_new_kinematic;
    body_new_static = funcs.body_new_static;
    body_destroy = funcs.body_destroy;
    body_free = funcs.body_free;
    body_activate = funcs.body_activate;
    body_activate_static = funcs.body_activate_static;
    body_sleep = funcs.body_sleep;
    body_sleep_with_group = funcs.body_sleep_with_group;
    body_is_sleeping = funcs.body_is_sleeping;
    body_get_type = funcs.body_get_type;
    body_set_type = funcs.body_set_type;
    body_get_space = funcs.body_get_space;
    body_get_mass = funcs.body_get_mass;
    body_set_mass = funcs.body_set_mass;
    body_get_moment = funcs.body_get_moment;
    body_set_moment = funcs.body_set_moment;
    body_get_position = funcs.body_get_position;
    body_set_position = funcs.body_set_position;
    body_get_center_of_gravity = funcs.body_get_center_of_gravity;
    body_set_center_of_gravity = funcs.body_set_center_of_gravity;
    body_get_velocity = funcs.body_get_velocity;
    body_set_velocity = funcs.body_set_velocity;
    body_get_force = funcs.body_get_force;
    body_set_force = funcs.body_set_force;
    body_get_angle = funcs.body_get_angle;
    body_set_angle = funcs.body_set_angle;
    body_get_angular_velocity = funcs.body_get_angular_velocity;
    body_set_angular_velocity = funcs.body_set_angular_velocity;
    body_get_torque = funcs.body_get_torque;
    body_set_torque = funcs.body_set_torque;
    body_get_rotation = funcs.body_get_rotation;
    body_get_user_data = funcs.body_get_user_data;
    body_set_user_data = funcs.body_set_user_data;
    body_set_velocity_update_func = funcs.body_set_velocity_update_func;
    body_set_position_update_func = funcs.body_set_position_update_func;
    body_update_velocity = funcs.body_update_velocity;
    body_update_position = funcs.body_update_position;
    body_local_to_world = funcs.body_local_to_world;
    body_world_to_local = funcs.body_world_to_local;
    body_apply_force_at_world_point = funcs.body_apply_force_at_world_point;
    body_apply_force_at_local_point = funcs.body_apply_force_at_local_point;
    body_apply_impulse_at_world_point = funcs.body_apply_impulse_at_world_point;
    body_apply_impulse_at_local_point = funcs.body_apply_impulse_at_local_point;
    body_get_velocity_at_world_point = funcs.body_get_velocity_at_world_point;
    body_get_velocity_at_local_point = funcs.body_get_velocity_at_local_point;
    body_kinetic_energy = funcs.body_kinetic_energy;
    body_each_shape = funcs.body_each_shape;
    body_each_constraint = funcs.body_each_constraint;
    body_each_arbiter = funcs.body_each_arbiter;
    shape_filter_new = funcs.shape_filter_new;
    shape_destroy = funcs.shape_destroy;
    shape_free = funcs.shape_free;
    shape_cache_bb = funcs.shape_cache_bb;
    shape_update = funcs.shape_update;
    shape_point_query = funcs.shape_point_query;
    shape_segment_query = funcs.shape_segment_query;
    shapes_collide = funcs.shapes_collide;
    shape_get_space = funcs.shape_get_space;
    shape_get_body = funcs.shape_get_body;
    shape_set_body = funcs.shape_set_body;
    shape_get_mass = funcs.shape_get_mass;
    shape_set_mass = funcs.shape_set_mass;
    shape_get_density = funcs.shape_get_density;
    shape_set_density = funcs.shape_set_density;
    shape_get_moment = funcs.shape_get_moment;
    shape_get_area = funcs.shape_get_area;
    shape_get_center_of_gravity = funcs.shape_get_center_of_gravity;
    shape_get_bb = funcs.shape_get_bb;
    shape_get_sensor = funcs.shape_get_sensor;
    shape_set_sensor = funcs.shape_set_sensor;
    shape_get_elasticity = funcs.shape_get_elasticity;
    shape_set_elasticity = funcs.shape_set_elasticity;
    shape_get_friction = funcs.shape_get_friction;
    shape_set_friction = funcs.shape_set_friction;
    shape_get_surface_velocity = funcs.shape_get_surface_velocity;
    shape_set_surface_velocity = funcs.shape_set_surface_velocity;
    shape_get_user_data = funcs.shape_get_user_data;
    shape_set_user_data = funcs.shape_set_user_data;
    shape_get_collision_type = funcs.shape_get_collision_type;
    shape_set_collision_type = funcs.shape_set_collision_type;
    shape_get_filter = funcs.shape_get_filter;
    shape_set_filter = funcs.shape_set_filter;
    circle_shape_alloc = funcs.circle_shape_alloc;
    circle_shape_init = funcs.circle_shape_init;
    circle_shape_new = funcs.circle_shape_new;
    circle_shape_get_offset = funcs.circle_shape_get_offset;
    circle_shape_get_radius = funcs.circle_shape_get_radius;
    segment_shape_alloc = funcs.segment_shape_alloc;
    segment_shape_init = funcs.segment_shape_init;
    segment_shape_new = funcs.segment_shape_new;
    segment_shape_set_neighbors = funcs.segment_shape_set_neighbors;
    segment_shape_get_a = funcs.segment_shape_get_a;
    segment_shape_get_b = funcs.segment_shape_get_b;
    segment_shape_get_normal = funcs.segment_shape_get_normal;
    segment_shape_get_radius = funcs.segment_shape_get_radius;
    poly_shape_alloc = funcs.poly_shape_alloc;
    poly_shape_init = funcs.poly_shape_init;
    poly_shape_init_raw = funcs.poly_shape_init_raw;
    poly_shape_new = funcs.poly_shape_new;
    poly_shape_new_raw = funcs.poly_shape_new_raw;
    box_shape_init = funcs.box_shape_init;
    box_shape_init_2 = funcs.box_shape_init_2;
    box_shape_new = funcs.box_shape_new;
    box_shape_new_2 = funcs.box_shape_new_2;
    poly_shape_get_count = funcs.poly_shape_get_count;
    poly_shape_get_vert = funcs.poly_shape_get_vert;
    poly_shape_get_radius = funcs.poly_shape_get_radius;
    constraint_destroy = funcs.constraint_destroy;
    constraint_free = funcs.constraint_free;
    constraint_get_space = funcs.constraint_get_space;
    constraint_get_body_a = funcs.constraint_get_body_a;
    constraint_get_body_b = funcs.constraint_get_body_b;
    constraint_get_max_force = funcs.constraint_get_max_force;
    constraint_set_max_force = funcs.constraint_set_max_force;
    constraint_get_error_bias = funcs.constraint_get_error_bias;
    constraint_set_error_bias = funcs.constraint_set_error_bias;
    constraint_get_max_bias = funcs.constraint_get_max_bias;
    constraint_set_max_bias = funcs.constraint_set_max_bias;
    constraint_get_collide_bodies = funcs.constraint_get_collide_bodies;
    constraint_set_collide_bodies = funcs.constraint_set_collide_bodies;
    constraint_get_pre_solve_func = funcs.constraint_get_pre_solve_func;
    constraint_set_pre_solve_func = funcs.constraint_set_pre_solve_func;
    constraint_get_post_solve_func = funcs.constraint_get_post_solve_func;
    constraint_set_post_solve_func = funcs.constraint_set_post_solve_func;
    constraint_get_user_data = funcs.constraint_get_user_data;
    constraint_set_user_data = funcs.constraint_set_user_data;
    constraint_get_impulse = funcs.constraint_get_impulse;
    constraint_is_pin_joint = funcs.constraint_is_pin_joint;
    pin_joint_alloc = funcs.pin_joint_alloc;
    pin_joint_init = funcs.pin_joint_init;
    pin_joint_new = funcs.pin_joint_new;
    pin_joint_get_anchor_a = funcs.pin_joint_get_anchor_a;
    pin_joint_set_anchor_a = funcs.pin_joint_set_anchor_a;
    pin_joint_get_anchor_b = funcs.pin_joint_get_anchor_b;
    pin_joint_set_anchor_b = funcs.pin_joint_set_anchor_b;
    pin_joint_get_dist = funcs.pin_joint_get_dist;
    pin_joint_set_dist = funcs.pin_joint_set_dist;
    constraint_is_slide_joint = funcs.constraint_is_slide_joint;
    slide_joint_alloc = funcs.slide_joint_alloc;
    slide_joint_init = funcs.slide_joint_init;
    slide_joint_new = funcs.slide_joint_new;
    slide_joint_get_anchor_a = funcs.slide_joint_get_anchor_a;
    slide_joint_set_anchor_a = funcs.slide_joint_set_anchor_a;
    slide_joint_get_anchor_b = funcs.slide_joint_get_anchor_b;
    slide_joint_set_anchor_b = funcs.slide_joint_set_anchor_b;
    slide_joint_get_min = funcs.slide_joint_get_min;
    slide_joint_set_min = funcs.slide_joint_set_min;
    slide_joint_get_max = funcs.slide_joint_get_max;
    slide_joint_set_max = funcs.slide_joint_set_max;
    constraint_is_pivot_joint = funcs.constraint_is_pivot_joint;
    pivot_joint_alloc = funcs.pivot_joint_alloc;
    pivot_joint_init = funcs.pivot_joint_init;
    pivot_joint_new = funcs.pivot_joint_new;
    pivot_joint_new_2 = funcs.pivot_joint_new_2;
    pivot_joint_get_anchor_a = funcs.pivot_joint_get_anchor_a;
    pivot_joint_set_anchor_a = funcs.pivot_joint_set_anchor_a;
    pivot_joint_get_anchor_b = funcs.pivot_joint_get_anchor_b;
    pivot_joint_set_anchor_b = funcs.pivot_joint_set_anchor_b;
    constraint_is_groove_joint = funcs.constraint_is_groove_joint;
    groove_joint_alloc = funcs.groove_joint_alloc;
    groove_joint_init = funcs.groove_joint_init;
    groove_joint_new = funcs.groove_joint_new;
    groove_joint_get_groove_a = funcs.groove_joint_get_groove_a;
    groove_joint_set_groove_a = funcs.groove_joint_set_groove_a;
    groove_joint_get_groove_b = funcs.groove_joint_get_groove_b;
    groove_joint_set_groove_b = funcs.groove_joint_set_groove_b;
    groove_joint_get_anchor_b = funcs.groove_joint_get_anchor_b;
    groove_joint_set_anchor_b = funcs.groove_joint_set_anchor_b;
    constraint_is_damped_spring = funcs.constraint_is_damped_spring;
    damped_spring_alloc = funcs.damped_spring_alloc;
    damped_spring_init = funcs.damped_spring_init;
    damped_spring_new = funcs.damped_spring_new;
    damped_spring_get_anchor_a = funcs.damped_spring_get_anchor_a;
    damped_spring_set_anchor_a = funcs.damped_spring_set_anchor_a;
    damped_spring_get_anchor_b = funcs.damped_spring_get_anchor_b;
    damped_spring_set_anchor_b = funcs.damped_spring_set_anchor_b;
    damped_spring_get_rest_length = funcs.damped_spring_get_rest_length;
    damped_spring_set_rest_length = funcs.damped_spring_set_rest_length;
    damped_spring_get_stiffness = funcs.damped_spring_get_stiffness;
    damped_spring_set_stiffness = funcs.damped_spring_set_stiffness;
    damped_spring_get_damping = funcs.damped_spring_get_damping;
    damped_spring_set_damping = funcs.damped_spring_set_damping;
    damped_spring_get_spring_force_func = funcs.damped_spring_get_spring_force_func;
    damped_spring_set_spring_force_func = funcs.damped_spring_set_spring_force_func;
    constraint_is_damped_rotary_spring = funcs.constraint_is_damped_rotary_spring;
    damped_rotary_spring_alloc = funcs.damped_rotary_spring_alloc;
    damped_rotary_spring_init = funcs.damped_rotary_spring_init;
    damped_rotary_spring_new = funcs.damped_rotary_spring_new;
    damped_rotary_spring_get_rest_angle = funcs.damped_rotary_spring_get_rest_angle;
    damped_rotary_spring_set_rest_angle = funcs.damped_rotary_spring_set_rest_angle;
    damped_rotary_spring_get_stiffness = funcs.damped_rotary_spring_get_stiffness;
    damped_rotary_spring_set_stiffness = funcs.damped_rotary_spring_set_stiffness;
    damped_rotary_spring_get_damping = funcs.damped_rotary_spring_get_damping;
    damped_rotary_spring_set_damping = funcs.damped_rotary_spring_set_damping;
    damped_rotary_spring_get_spring_torque_func = funcs.damped_rotary_spring_get_spring_torque_func;
    damped_rotary_spring_set_spring_torque_func = funcs.damped_rotary_spring_set_spring_torque_func;
    constraint_is_rotary_limit_joint = funcs.constraint_is_rotary_limit_joint;
    rotary_limit_joint_alloc = funcs.rotary_limit_joint_alloc;
    rotary_limit_joint_init = funcs.rotary_limit_joint_init;
    rotary_limit_joint_new = funcs.rotary_limit_joint_new;
    rotary_limit_joint_get_min = funcs.rotary_limit_joint_get_min;
    rotary_limit_joint_set_min = funcs.rotary_limit_joint_set_min;
    rotary_limit_joint_get_max = funcs.rotary_limit_joint_get_max;
    rotary_limit_joint_set_max = funcs.rotary_limit_joint_set_max;
    constraint_is_ratchet_joint = funcs.constraint_is_ratchet_joint;
    ratchet_joint_alloc = funcs.ratchet_joint_alloc;
    ratchet_joint_init = funcs.ratchet_joint_init;
    ratchet_joint_new = funcs.ratchet_joint_new;
    ratchet_joint_get_angle = funcs.ratchet_joint_get_angle;
    ratchet_joint_set_angle = funcs.ratchet_joint_set_angle;
    ratchet_joint_get_phase = funcs.ratchet_joint_get_phase;
    ratchet_joint_set_phase = funcs.ratchet_joint_set_phase;
    ratchet_joint_get_ratchet = funcs.ratchet_joint_get_ratchet;
    ratchet_joint_set_ratchet = funcs.ratchet_joint_set_ratchet;
    constraint_is_gear_joint = funcs.constraint_is_gear_joint;
    gear_joint_alloc = funcs.gear_joint_alloc;
    gear_joint_init = funcs.gear_joint_init;
    gear_joint_new = funcs.gear_joint_new;
    gear_joint_get_phase = funcs.gear_joint_get_phase;
    gear_joint_set_phase = funcs.gear_joint_set_phase;
    gear_joint_get_ratio = funcs.gear_joint_get_ratio;
    gear_joint_set_ratio = funcs.gear_joint_set_ratio;
    constraint_is_simple_motor = funcs.constraint_is_simple_motor;
    simple_motor_alloc = funcs.simple_motor_alloc;
    simple_motor_init = funcs.simple_motor_init;
    simple_motor_new = funcs.simple_motor_new;
    simple_motor_get_rate = funcs.simple_motor_get_rate;
    simple_motor_set_rate = funcs.simple_motor_set_rate;
    space_alloc = funcs.space_alloc;
    space_init = funcs.space_init;
    space_new = funcs.space_new;
    space_destroy = funcs.space_destroy;
    space_free = funcs.space_free;
    space_get_iterations = funcs.space_get_iterations;
    space_set_iterations = funcs.space_set_iterations;
    space_get_gravity = funcs.space_get_gravity;
    space_set_gravity = funcs.space_set_gravity;
    space_get_damping = funcs.space_get_damping;
    space_set_damping = funcs.space_set_damping;
    space_get_idle_speed_threshold = funcs.space_get_idle_speed_threshold;
    space_set_idle_speed_threshold = funcs.space_set_idle_speed_threshold;
    space_get_sleep_time_threshold = funcs.space_get_sleep_time_threshold;
    space_set_sleep_time_threshold = funcs.space_set_sleep_time_threshold;
    space_get_collision_slop = funcs.space_get_collision_slop;
    space_set_collision_slop = funcs.space_set_collision_slop;
    space_get_collision_bias = funcs.space_get_collision_bias;
    space_set_collision_bias = funcs.space_set_collision_bias;
    space_get_collision_persistence = funcs.space_get_collision_persistence;
    space_set_collision_persistence = funcs.space_set_collision_persistence;
    space_get_user_data = funcs.space_get_user_data;
    space_set_user_data = funcs.space_set_user_data;
    space_get_static_body = funcs.space_get_static_body;
    space_get_current_time_step = funcs.space_get_current_time_step;
    space_is_locked = funcs.space_is_locked;
    space_add_default_collision_handler = funcs.space_add_default_collision_handler;
    space_add_collision_handler = funcs.space_add_collision_handler;
    space_add_wildcard_handler = funcs.space_add_wildcard_handler;
    space_add_shape = funcs.space_add_shape;
    space_add_body = funcs.space_add_body;
    space_add_constraint = funcs.space_add_constraint;
    space_remove_shape = funcs.space_remove_shape;
    space_remove_body = funcs.space_remove_body;
    space_remove_constraint = funcs.space_remove_constraint;
    space_contains_shape = funcs.space_contains_shape;
    space_contains_body = funcs.space_contains_body;
    space_contains_constraint = funcs.space_contains_constraint;
    space_add_post_step_callback = funcs.space_add_post_step_callback;
    space_point_query = funcs.space_point_query;
    space_point_query_nearest = funcs.space_point_query_nearest;
    space_segment_query = funcs.space_segment_query;
    space_segment_query_first = funcs.space_segment_query_first;
    space_bb_query = funcs.space_bb_query;
    space_shape_query = funcs.space_shape_query;
    space_each_body = funcs.space_each_body;
    space_each_shape = funcs.space_each_shape;
    space_each_constraint = funcs.space_each_constraint;
    space_reindex_static = funcs.space_reindex_static;
    space_reindex_shape = funcs.space_reindex_shape;
    space_reindex_shapes_for_body = funcs.space_reindex_shapes_for_body;
    space_use_spatial_hash = funcs.space_use_spatial_hash;
    space_step = funcs.space_step;
    space_debug_draw = funcs.space_debug_draw;
    moment_for_circle = funcs.moment_for_circle;
    area_for_circle = funcs.area_for_circle;
    moment_for_segment = funcs.moment_for_segment;
    area_for_segment = funcs.area_for_segment;
    moment_for_poly = funcs.moment_for_poly;
    area_for_poly = funcs.area_for_poly;
    centroid_for_poly = funcs.centroid_for_poly;
    moment_for_box = funcs.moment_for_box;
    moment_for_box_2 = funcs.moment_for_box_2;
    convex_hull = funcs.convex_hull;
    closet_point_on_segment = funcs.closet_point_on_segment;
}

bridge_deinit :: proc() {
}

message : proc "c" (
        condition : cstring,
        file : cstring,
        line : _c.int,
        is_error : _c.int,
        is_hard_error : _c.int,
        message : cstring
    );
fmax : proc "c" (
        a : Float,
        b : Float
    ) -> Float;
fmin : proc "c" (
        a : Float,
        b : Float
    ) -> Float;
fabs : proc "c" (f : Float) -> Float;
fclamp : proc "c" (
        f : Float,
        min : Float,
        max : Float
    ) -> Float;
fclamp01 : proc "c" (f : Float) -> Float;
flerp : proc "c" (
        f1 : Float,
        f2 : Float,
        t : Float
    ) -> Float;
flerpconst : proc "c" (
        f1 : Float,
        f2 : Float,
        d : Float
    ) -> Float;
v : proc "c" (
        x : Float,
        y : Float
    ) -> Vect;
veql : proc "c" (
        v1 : Vect,
        v2 : Vect
    ) -> Bool;
vadd : proc "c" (
        v1 : Vect,
        v2 : Vect
    ) -> Vect;
vsub : proc "c" (
        v1 : Vect,
        v2 : Vect
    ) -> Vect;
vneg : proc "c" (v : Vect) -> Vect;
vmult : proc "c" (
        v : Vect,
        s : Float
    ) -> Vect;
vdot : proc "c" (
        v1 : Vect,
        v2 : Vect
    ) -> Float;
vcross : proc "c" (
        v1 : Vect,
        v2 : Vect
    ) -> Float;
vperp : proc "c" (v : Vect) -> Vect;
vrperp : proc "c" (v : Vect) -> Vect;
vproject : proc "c" (
        v1 : Vect,
        v2 : Vect
    ) -> Vect;
vforangle : proc "c" (a : Float) -> Vect;
vtoangle : proc "c" (v : Vect) -> Float;
vrotate : proc "c" (
        v1 : Vect,
        v2 : Vect
    ) -> Vect;
vunrotate : proc "c" (
        v1 : Vect,
        v2 : Vect
    ) -> Vect;
vlengthsq : proc "c" (v : Vect) -> Float;
vlength : proc "c" (v : Vect) -> Float;
vlerp : proc "c" (
        v1 : Vect,
        v2 : Vect,
        t : Float
    ) -> Vect;
vnormalize : proc "c" (v : Vect) -> Vect;
vslerp : proc "c" (
        v1 : Vect,
        v2 : Vect,
        t : Float
    ) -> Vect;
vslerpconst : proc "c" (
        v1 : Vect,
        v2 : Vect,
        a : Float
    ) -> Vect;
vclamp : proc "c" (
        v : Vect,
        len : Float
    ) -> Vect;
vlerpconst : proc "c" (
        v1 : Vect,
        v2 : Vect,
        d : Float
    ) -> Vect;
vdist : proc "c" (
        v1 : Vect,
        v2 : Vect
    ) -> Float;
vdistsq : proc "c" (
        v1 : Vect,
        v2 : Vect
    ) -> Float;
vnear : proc "c" (
        v1 : Vect,
        v2 : Vect,
        dist : Float
    ) -> Bool;
mat_2x_2_new : proc "c" (
        a : Float,
        b : Float,
        c : Float,
        d : Float
    ) -> Mat2X2;
mat_2x_2_transform : proc "c" (
        m : Mat2X2,
        v : Vect
    ) -> Vect;
bb_new : proc "c" (
        l : Float,
        b : Float,
        r : Float,
        t : Float
    ) -> Bb;
bb_new_for_extents : proc "c" (
        c : Vect,
        hw : Float,
        hh : Float
    ) -> Bb;
bb_new_for_circle : proc "c" (
        p : Vect,
        r : Float
    ) -> Bb;
bb_intersects : proc "c" (
        a : Bb,
        b : Bb
    ) -> Bool;
bb_contains_bb : proc "c" (
        bb : Bb,
        other : Bb
    ) -> Bool;
bb_contains_vect : proc "c" (
        bb : Bb,
        v : Vect
    ) -> Bool;
bb_merge : proc "c" (
        a : Bb,
        b : Bb
    ) -> Bb;
bb_expand : proc "c" (
        bb : Bb,
        v : Vect
    ) -> Bb;
bb_center : proc "c" (bb : Bb) -> Vect;
bb_area : proc "c" (bb : Bb) -> Float;
bb_merged_area : proc "c" (
        a : Bb,
        b : Bb
    ) -> Float;
bb_segment_query : proc "c" (
        bb : Bb,
        a : Vect,
        b : Vect
    ) -> Float;
bb_intersects_segment : proc "c" (
        bb : Bb,
        a : Vect,
        b : Vect
    ) -> Bool;
bb_clamp_vect : proc "c" (
        bb : Bb,
        v : Vect
    ) -> Vect;
bb_wrap_vect : proc "c" (
        bb : Bb,
        v : Vect
    ) -> Vect;
bb_offset : proc "c" (
        bb : Bb,
        v : Vect
    ) -> Bb;
transform_new : proc "c" (
        a : Float,
        b : Float,
        c : Float,
        d : Float,
        tx : Float,
        ty : Float
    ) -> Transform;
transform_new_transpose : proc "c" (
        a : Float,
        c : Float,
        tx : Float,
        b : Float,
        d : Float,
        ty : Float
    ) -> Transform;
transform_inverse : proc "c" (t : Transform) -> Transform;
transform_mult : proc "c" (
        t1 : Transform,
        t2 : Transform
    ) -> Transform;
transform_point : proc "c" (
        t : Transform,
        p : Vect
    ) -> Vect;
transform_vect : proc "c" (
        t : Transform,
        v : Vect
    ) -> Vect;
transformb_bb : proc "c" (
        t : Transform,
        bb : Bb
    ) -> Bb;
transform_translate : proc "c" (translate : Vect) -> Transform;
transform_scale : proc "c" (
        scale_x : Float,
        scale_y : Float
    ) -> Transform;
transform_rotate : proc "c" (radians : Float) -> Transform;
transform_rigid : proc "c" (
        translate : Vect,
        radians : Float
    ) -> Transform;
transform_rigid_inverse : proc "c" (t : Transform) -> Transform;
transform_wrap : proc "c" (
        outer : Transform,
        inner : Transform
    ) -> Transform;
transform_wrap_inverse : proc "c" (
        outer : Transform,
        inner : Transform
    ) -> Transform;
transform_ortho : proc "c" (bb : Bb) -> Transform;
transform_bone_scale : proc "c" (
        v0 : Vect,
        v1 : Vect
    ) -> Transform;
transform_axial_scale : proc "c" (
        axis : Vect,
        pivot : Vect,
        scale : Float
    ) -> Transform;
space_hash_alloc : proc "c" () -> ^SpaceHash;
space_hash_init : proc "c" (
        hash : ^SpaceHash,
        celldim : Float,
        numcells : _c.int,
        bbfunc : SpatialIndexBbFunc,
        static_index : ^SpatialIndex
    ) -> ^SpatialIndex;
space_hash_new : proc "c" (
        celldim : Float,
        cells : _c.int,
        bbfunc : SpatialIndexBbFunc,
        static_index : ^SpatialIndex
    ) -> ^SpatialIndex;
space_hash_resize : proc "c" (
        hash : ^SpaceHash,
        celldim : Float,
        numcells : _c.int
    );
bb_tree_alloc : proc "c" () -> ^BbTree;
bb_tree_init : proc "c" (
        tree : ^BbTree,
        bbfunc : SpatialIndexBbFunc,
        static_index : ^SpatialIndex
    ) -> ^SpatialIndex;
bb_tree_new : proc "c" (
        bbfunc : SpatialIndexBbFunc,
        static_index : ^SpatialIndex
    ) -> ^SpatialIndex;
bb_tree_optimize : proc "c" (index : ^SpatialIndex);
bb_tree_set_velocity_func : proc "c" (
        index : ^SpatialIndex,
        func : BbTreeVelocityFunc
    );
sweep_1d_alloc : proc "c" () -> ^Sweep1D;
sweep_1d_init : proc "c" (
        sweep : ^Sweep1D,
        bbfunc : SpatialIndexBbFunc,
        static_index : ^SpatialIndex
    ) -> ^SpatialIndex;
sweep_1d_new : proc "c" (
        bbfunc : SpatialIndexBbFunc,
        static_index : ^SpatialIndex
    ) -> ^SpatialIndex;
spatial_index_free : proc "c" (index : ^SpatialIndex);
spatial_index_collide_static : proc "c" (
        dynamic_index : ^SpatialIndex,
        static_index : ^SpatialIndex,
        func : SpatialIndexQueryFunc,
        data : rawptr
    );
spatial_index_destroy : proc "c" (index : ^SpatialIndex);
spatial_index_count : proc "c" (index : ^SpatialIndex) -> _c.int;
spatial_index_each : proc "c" (
        index : ^SpatialIndex,
        func : SpatialIndexIteratorFunc,
        data : rawptr
    );
spatial_index_contains : proc "c" (
        index : ^SpatialIndex,
        obj : rawptr,
        hashid : HashValue
    ) -> Bool;
spatial_index_insert : proc "c" (
        index : ^SpatialIndex,
        obj : rawptr,
        hashid : HashValue
    );
spatial_index_remove : proc "c" (
        index : ^SpatialIndex,
        obj : rawptr,
        hashid : HashValue
    );
spatial_index_reindex : proc "c" (index : ^SpatialIndex);
spatial_index_reindex_object : proc "c" (
        index : ^SpatialIndex,
        obj : rawptr,
        hashid : HashValue
    );
spatial_index_query : proc "c" (
        index : ^SpatialIndex,
        obj : rawptr,
        bb : Bb,
        func : SpatialIndexQueryFunc,
        data : rawptr
    );
spatial_index_segment_query : proc "c" (
        index : ^SpatialIndex,
        obj : rawptr,
        a : Vect,
        b : Vect,
        t_exit : Float,
        func : SpatialIndexSegmentQueryFunc,
        data : rawptr
    );
spatial_index_reindex_query : proc "c" (
        index : ^SpatialIndex,
        func : SpatialIndexQueryFunc,
        data : rawptr
    );
arbiter_get_restitution : proc "c" (arb : ^Arbiter) -> Float;
arbiter_set_restitution : proc "c" (
        arb : ^Arbiter,
        restitution : Float
    );
arbiter_get_friction : proc "c" (arb : ^Arbiter) -> Float;
arbiter_set_friction : proc "c" (
        arb : ^Arbiter,
        friction : Float
    );
arbiter_get_surface_velocity : proc "c" (arb : ^Arbiter) -> Vect;
arbiter_set_surface_velocity : proc "c" (
        arb : ^Arbiter,
        vr : Vect
    );
arbiter_get_user_data : proc "c" (arb : ^Arbiter) -> DataPointer;
arbiter_set_user_data : proc "c" (
        arb : ^Arbiter,
        user_data : DataPointer
    );
arbiter_total_impulse : proc "c" (arb : ^Arbiter) -> Vect;
arbiter_total_ke : proc "c" (arb : ^Arbiter) -> Float;
arbiter_ignore : proc "c" (arb : ^Arbiter) -> Bool;
arbiter_get_shapes : proc "c" (
        arb : ^Arbiter,
        a : ^^Shape,
        b : ^^Shape
    );
arbiter_get_bodies : proc "c" (
        arb : ^Arbiter,
        a : ^^Body,
        b : ^^Body
    );
arbiter_get_contact_point_set : proc "c" (arb : ^Arbiter) -> ContactPointSet;
arbiter_set_contact_point_set : proc "c" (
        arb : ^Arbiter,
        set : ^ContactPointSet
    );
arbiter_is_first_contact : proc "c" (arb : ^Arbiter) -> Bool;
arbiter_is_removal : proc "c" (arb : ^Arbiter) -> Bool;
arbiter_get_count : proc "c" (arb : ^Arbiter) -> _c.int;
arbiter_get_normal : proc "c" (arb : ^Arbiter) -> Vect;
arbiter_get_point_a : proc "c" (
        arb : ^Arbiter,
        i : _c.int
    ) -> Vect;
arbiter_get_point_b : proc "c" (
        arb : ^Arbiter,
        i : _c.int
    ) -> Vect;
arbiter_get_depth : proc "c" (
        arb : ^Arbiter,
        i : _c.int
    ) -> Float;
arbiter_call_wildcard_begin_a : proc "c" (
        arb : ^Arbiter,
        space : ^Space
    ) -> Bool;
arbiter_call_wildcard_begin_b : proc "c" (
        arb : ^Arbiter,
        space : ^Space
    ) -> Bool;
arbiter_call_wildcard_pre_solve_a : proc "c" (
        arb : ^Arbiter,
        space : ^Space
    ) -> Bool;
arbiter_call_wildcard_pre_solve_b : proc "c" (
        arb : ^Arbiter,
        space : ^Space
    ) -> Bool;
arbiter_call_wildcard_post_solve_a : proc "c" (
        arb : ^Arbiter,
        space : ^Space
    );
arbiter_call_wildcard_post_solve_b : proc "c" (
        arb : ^Arbiter,
        space : ^Space
    );
arbiter_call_wildcard_separate_a : proc "c" (
        arb : ^Arbiter,
        space : ^Space
    );
arbiter_call_wildcard_separate_b : proc "c" (
        arb : ^Arbiter,
        space : ^Space
    );
body_alloc : proc "c" () -> ^Body;
body_init : proc "c" (
        body : ^Body,
        mass : Float,
        moment : Float
    ) -> ^Body;
body_new : proc "c" (
        mass : Float,
        moment : Float
    ) -> ^Body;
body_new_kinematic : proc "c" () -> ^Body;
body_new_static : proc "c" () -> ^Body;
body_destroy : proc "c" (body : ^Body);
body_free : proc "c" (body : ^Body);
body_activate : proc "c" (body : ^Body);
body_activate_static : proc "c" (
        body : ^Body,
        filter : ^Shape
    );
body_sleep : proc "c" (body : ^Body);
body_sleep_with_group : proc "c" (
        body : ^Body,
        group : ^Body
    );
body_is_sleeping : proc "c" (body : ^Body) -> Bool;
body_get_type : proc "c" (body : ^Body) -> BodyType;
body_set_type : proc "c" (
        body : ^Body,
        type : BodyType
    );
body_get_space : proc "c" (body : ^Body) -> ^Space;
body_get_mass : proc "c" (body : ^Body) -> Float;
body_set_mass : proc "c" (
        body : ^Body,
        m : Float
    );
body_get_moment : proc "c" (body : ^Body) -> Float;
body_set_moment : proc "c" (
        body : ^Body,
        i : Float
    );
body_get_position : proc "c" (body : ^Body) -> Vect;
body_set_position : proc "c" (
        body : ^Body,
        pos : Vect
    );
body_get_center_of_gravity : proc "c" (body : ^Body) -> Vect;
body_set_center_of_gravity : proc "c" (
        body : ^Body,
        cog : Vect
    );
body_get_velocity : proc "c" (body : ^Body) -> Vect;
body_set_velocity : proc "c" (
        body : ^Body,
        velocity : Vect
    );
body_get_force : proc "c" (body : ^Body) -> Vect;
body_set_force : proc "c" (
        body : ^Body,
        force : Vect
    );
body_get_angle : proc "c" (body : ^Body) -> Float;
body_set_angle : proc "c" (
        body : ^Body,
        a : Float
    );
body_get_angular_velocity : proc "c" (body : ^Body) -> Float;
body_set_angular_velocity : proc "c" (
        body : ^Body,
        angular_velocity : Float
    );
body_get_torque : proc "c" (body : ^Body) -> Float;
body_set_torque : proc "c" (
        body : ^Body,
        torque : Float
    );
body_get_rotation : proc "c" (body : ^Body) -> Vect;
body_get_user_data : proc "c" (body : ^Body) -> DataPointer;
body_set_user_data : proc "c" (
        body : ^Body,
        user_data : DataPointer
    );
body_set_velocity_update_func : proc "c" (
        body : ^Body,
        velocity_func : BodyVelocityFunc
    );
body_set_position_update_func : proc "c" (
        body : ^Body,
        position_func : BodyPositionFunc
    );
body_update_velocity : proc "c" (
        body : ^Body,
        gravity : Vect,
        damping : Float,
        dt : Float
    );
body_update_position : proc "c" (
        body : ^Body,
        dt : Float
    );
body_local_to_world : proc "c" (
        body : ^Body,
        point : Vect
    ) -> Vect;
body_world_to_local : proc "c" (
        body : ^Body,
        point : Vect
    ) -> Vect;
body_apply_force_at_world_point : proc "c" (
        body : ^Body,
        force : Vect,
        point : Vect
    );
body_apply_force_at_local_point : proc "c" (
        body : ^Body,
        force : Vect,
        point : Vect
    );
body_apply_impulse_at_world_point : proc "c" (
        body : ^Body,
        impulse : Vect,
        point : Vect
    );
body_apply_impulse_at_local_point : proc "c" (
        body : ^Body,
        impulse : Vect,
        point : Vect
    );
body_get_velocity_at_world_point : proc "c" (
        body : ^Body,
        point : Vect
    ) -> Vect;
body_get_velocity_at_local_point : proc "c" (
        body : ^Body,
        point : Vect
    ) -> Vect;
body_kinetic_energy : proc "c" (body : ^Body) -> Float;
body_each_shape : proc "c" (
        body : ^Body,
        func : BodyShapeIteratorFunc,
        data : rawptr
    );
body_each_constraint : proc "c" (
        body : ^Body,
        func : BodyConstraintIteratorFunc,
        data : rawptr
    );
body_each_arbiter : proc "c" (
        body : ^Body,
        func : BodyArbiterIteratorFunc,
        data : rawptr
    );
shape_filter_new : proc "c" (
        group : Group,
        categories : Bitmask,
        mask : Bitmask
    ) -> ShapeFilter;
shape_destroy : proc "c" (shape : ^Shape);
shape_free : proc "c" (shape : ^Shape);
shape_cache_bb : proc "c" (shape : ^Shape) -> Bb;
shape_update : proc "c" (
        shape : ^Shape,
        transform : Transform
    ) -> Bb;
shape_point_query : proc "c" (
        shape : ^Shape,
        p : Vect,
        out : ^PointQueryInfo
    ) -> Float;
shape_segment_query : proc "c" (
        shape : ^Shape,
        a : Vect,
        b : Vect,
        radius : Float,
        info : ^SegmentQueryInfo
    ) -> Bool;
shapes_collide : proc "c" (
        a : ^Shape,
        b : ^Shape
    ) -> ContactPointSet;
shape_get_space : proc "c" (shape : ^Shape) -> ^Space;
shape_get_body : proc "c" (shape : ^Shape) -> ^Body;
shape_set_body : proc "c" (
        shape : ^Shape,
        body : ^Body
    );
shape_get_mass : proc "c" (shape : ^Shape) -> Float;
shape_set_mass : proc "c" (
        shape : ^Shape,
        mass : Float
    );
shape_get_density : proc "c" (shape : ^Shape) -> Float;
shape_set_density : proc "c" (
        shape : ^Shape,
        density : Float
    );
shape_get_moment : proc "c" (shape : ^Shape) -> Float;
shape_get_area : proc "c" (shape : ^Shape) -> Float;
shape_get_center_of_gravity : proc "c" (shape : ^Shape) -> Vect;
shape_get_bb : proc "c" (shape : ^Shape) -> Bb;
shape_get_sensor : proc "c" (shape : ^Shape) -> Bool;
shape_set_sensor : proc "c" (
        shape : ^Shape,
        sensor : Bool
    );
shape_get_elasticity : proc "c" (shape : ^Shape) -> Float;
shape_set_elasticity : proc "c" (
        shape : ^Shape,
        elasticity : Float
    );
shape_get_friction : proc "c" (shape : ^Shape) -> Float;
shape_set_friction : proc "c" (
        shape : ^Shape,
        friction : Float
    );
shape_get_surface_velocity : proc "c" (shape : ^Shape) -> Vect;
shape_set_surface_velocity : proc "c" (
        shape : ^Shape,
        surface_velocity : Vect
    );
shape_get_user_data : proc "c" (shape : ^Shape) -> DataPointer;
shape_set_user_data : proc "c" (
        shape : ^Shape,
        user_data : DataPointer
    );
shape_get_collision_type : proc "c" (shape : ^Shape) -> CollisionType;
shape_set_collision_type : proc "c" (
        shape : ^Shape,
        collision_type : CollisionType
    );
shape_get_filter : proc "c" (shape : ^Shape) -> ShapeFilter;
shape_set_filter : proc "c" (
        shape : ^Shape,
        filter : ShapeFilter
    );
circle_shape_alloc : proc "c" () -> ^CircleShape;
circle_shape_init : proc "c" (
        circle : ^CircleShape,
        body : ^Body,
        radius : Float,
        offset : Vect
    ) -> ^CircleShape;
circle_shape_new : proc "c" (
        body : ^Body,
        radius : Float,
        offset : Vect
    ) -> ^Shape;
circle_shape_get_offset : proc "c" (shape : ^Shape) -> Vect;
circle_shape_get_radius : proc "c" (shape : ^Shape) -> Float;
segment_shape_alloc : proc "c" () -> ^SegmentShape;
segment_shape_init : proc "c" (
        seg : ^SegmentShape,
        body : ^Body,
        a : Vect,
        b : Vect,
        radius : Float
    ) -> ^SegmentShape;
segment_shape_new : proc "c" (
        body : ^Body,
        a : Vect,
        b : Vect,
        radius : Float
    ) -> ^Shape;
segment_shape_set_neighbors : proc "c" (
        shape : ^Shape,
        prev : Vect,
        next : Vect
    );
segment_shape_get_a : proc "c" (shape : ^Shape) -> Vect;
segment_shape_get_b : proc "c" (shape : ^Shape) -> Vect;
segment_shape_get_normal : proc "c" (shape : ^Shape) -> Vect;
segment_shape_get_radius : proc "c" (shape : ^Shape) -> Float;
poly_shape_alloc : proc "c" () -> ^PolyShape;
poly_shape_init : proc "c" (
        poly : ^PolyShape,
        body : ^Body,
        count : _c.int,
        verts : ^Vect,
        transform : Transform,
        radius : Float
    ) -> ^PolyShape;
poly_shape_init_raw : proc "c" (
        poly : ^PolyShape,
        body : ^Body,
        count : _c.int,
        verts : ^Vect,
        radius : Float
    ) -> ^PolyShape;
poly_shape_new : proc "c" (
        body : ^Body,
        count : _c.int,
        verts : ^Vect,
        transform : Transform,
        radius : Float
    ) -> ^Shape;
poly_shape_new_raw : proc "c" (
        body : ^Body,
        count : _c.int,
        verts : ^Vect,
        radius : Float
    ) -> ^Shape;
box_shape_init : proc "c" (
        poly : ^PolyShape,
        body : ^Body,
        width : Float,
        height : Float,
        radius : Float
    ) -> ^PolyShape;
box_shape_init_2 : proc "c" (
        poly : ^PolyShape,
        body : ^Body,
        box : Bb,
        radius : Float
    ) -> ^PolyShape;
box_shape_new : proc "c" (
        body : ^Body,
        width : Float,
        height : Float,
        radius : Float
    ) -> ^Shape;
box_shape_new_2 : proc "c" (
        body : ^Body,
        box : Bb,
        radius : Float
    ) -> ^Shape;
poly_shape_get_count : proc "c" (shape : ^Shape) -> _c.int;
poly_shape_get_vert : proc "c" (
        shape : ^Shape,
        index : _c.int
    ) -> Vect;
poly_shape_get_radius : proc "c" (shape : ^Shape) -> Float;
constraint_destroy : proc "c" (constraint : ^Constraint);
constraint_free : proc "c" (constraint : ^Constraint);
constraint_get_space : proc "c" (constraint : ^Constraint) -> ^Space;
constraint_get_body_a : proc "c" (constraint : ^Constraint) -> ^Body;
constraint_get_body_b : proc "c" (constraint : ^Constraint) -> ^Body;
constraint_get_max_force : proc "c" (constraint : ^Constraint) -> Float;
constraint_set_max_force : proc "c" (
        constraint : ^Constraint,
        max_force : Float
    );
constraint_get_error_bias : proc "c" (constraint : ^Constraint) -> Float;
constraint_set_error_bias : proc "c" (
        constraint : ^Constraint,
        error_bias : Float
    );
constraint_get_max_bias : proc "c" (constraint : ^Constraint) -> Float;
constraint_set_max_bias : proc "c" (
        constraint : ^Constraint,
        max_bias : Float
    );
constraint_get_collide_bodies : proc "c" (constraint : ^Constraint) -> Bool;
constraint_set_collide_bodies : proc "c" (
        constraint : ^Constraint,
        collide_bodies : Bool
    );
constraint_get_pre_solve_func : proc "c" (constraint : ^Constraint) -> ConstraintPreSolveFunc;
constraint_set_pre_solve_func : proc "c" (
        constraint : ^Constraint,
        pre_solve_func : ConstraintPreSolveFunc
    );
constraint_get_post_solve_func : proc "c" (constraint : ^Constraint) -> ConstraintPostSolveFunc;
constraint_set_post_solve_func : proc "c" (
        constraint : ^Constraint,
        post_solve_func : ConstraintPostSolveFunc
    );
constraint_get_user_data : proc "c" (constraint : ^Constraint) -> DataPointer;
constraint_set_user_data : proc "c" (
        constraint : ^Constraint,
        user_data : DataPointer
    );
constraint_get_impulse : proc "c" (constraint : ^Constraint) -> Float;
constraint_is_pin_joint : proc "c" (constraint : ^Constraint) -> Bool;
pin_joint_alloc : proc "c" () -> ^PinJoint;
pin_joint_init : proc "c" (
        joint : ^PinJoint,
        a : ^Body,
        b : ^Body,
        anchor_a : Vect,
        anchor_b : Vect
    ) -> ^PinJoint;
pin_joint_new : proc "c" (
        a : ^Body,
        b : ^Body,
        anchor_a : Vect,
        anchor_b : Vect
    ) -> ^Constraint;
pin_joint_get_anchor_a : proc "c" (constraint : ^Constraint) -> Vect;
pin_joint_set_anchor_a : proc "c" (
        constraint : ^Constraint,
        anchor_a : Vect
    );
pin_joint_get_anchor_b : proc "c" (constraint : ^Constraint) -> Vect;
pin_joint_set_anchor_b : proc "c" (
        constraint : ^Constraint,
        anchor_b : Vect
    );
pin_joint_get_dist : proc "c" (constraint : ^Constraint) -> Float;
pin_joint_set_dist : proc "c" (
        constraint : ^Constraint,
        dist : Float
    );
constraint_is_slide_joint : proc "c" (constraint : ^Constraint) -> Bool;
slide_joint_alloc : proc "c" () -> ^SlideJoint;
slide_joint_init : proc "c" (
        joint : ^SlideJoint,
        a : ^Body,
        b : ^Body,
        anchor_a : Vect,
        anchor_b : Vect,
        min : Float,
        max : Float
    ) -> ^SlideJoint;
slide_joint_new : proc "c" (
        a : ^Body,
        b : ^Body,
        anchor_a : Vect,
        anchor_b : Vect,
        min : Float,
        max : Float
    ) -> ^Constraint;
slide_joint_get_anchor_a : proc "c" (constraint : ^Constraint) -> Vect;
slide_joint_set_anchor_a : proc "c" (
        constraint : ^Constraint,
        anchor_a : Vect
    );
slide_joint_get_anchor_b : proc "c" (constraint : ^Constraint) -> Vect;
slide_joint_set_anchor_b : proc "c" (
        constraint : ^Constraint,
        anchor_b : Vect
    );
slide_joint_get_min : proc "c" (constraint : ^Constraint) -> Float;
slide_joint_set_min : proc "c" (
        constraint : ^Constraint,
        min : Float
    );
slide_joint_get_max : proc "c" (constraint : ^Constraint) -> Float;
slide_joint_set_max : proc "c" (
        constraint : ^Constraint,
        max : Float
    );
constraint_is_pivot_joint : proc "c" (constraint : ^Constraint) -> Bool;
pivot_joint_alloc : proc "c" () -> ^PivotJoint;
pivot_joint_init : proc "c" (
        joint : ^PivotJoint,
        a : ^Body,
        b : ^Body,
        anchor_a : Vect,
        anchor_b : Vect
    ) -> ^PivotJoint;
pivot_joint_new : proc "c" (
        a : ^Body,
        b : ^Body,
        pivot : Vect
    ) -> ^Constraint;
pivot_joint_new_2 : proc "c" (
        a : ^Body,
        b : ^Body,
        anchor_a : Vect,
        anchor_b : Vect
    ) -> ^Constraint;
pivot_joint_get_anchor_a : proc "c" (constraint : ^Constraint) -> Vect;
pivot_joint_set_anchor_a : proc "c" (
        constraint : ^Constraint,
        anchor_a : Vect
    );
pivot_joint_get_anchor_b : proc "c" (constraint : ^Constraint) -> Vect;
pivot_joint_set_anchor_b : proc "c" (
        constraint : ^Constraint,
        anchor_b : Vect
    );
constraint_is_groove_joint : proc "c" (constraint : ^Constraint) -> Bool;
groove_joint_alloc : proc "c" () -> ^GrooveJoint;
groove_joint_init : proc "c" (
        joint : ^GrooveJoint,
        a : ^Body,
        b : ^Body,
        groove_a : Vect,
        groove_b : Vect,
        anchor_b : Vect
    ) -> ^GrooveJoint;
groove_joint_new : proc "c" (
        a : ^Body,
        b : ^Body,
        groove_a : Vect,
        groove_b : Vect,
        anchor_b : Vect
    ) -> ^Constraint;
groove_joint_get_groove_a : proc "c" (constraint : ^Constraint) -> Vect;
groove_joint_set_groove_a : proc "c" (
        constraint : ^Constraint,
        groove_a : Vect
    );
groove_joint_get_groove_b : proc "c" (constraint : ^Constraint) -> Vect;
groove_joint_set_groove_b : proc "c" (
        constraint : ^Constraint,
        groove_b : Vect
    );
groove_joint_get_anchor_b : proc "c" (constraint : ^Constraint) -> Vect;
groove_joint_set_anchor_b : proc "c" (
        constraint : ^Constraint,
        anchor_b : Vect
    );
constraint_is_damped_spring : proc "c" (constraint : ^Constraint) -> Bool;
damped_spring_alloc : proc "c" () -> ^DampedSpring;
damped_spring_init : proc "c" (
        joint : ^DampedSpring,
        a : ^Body,
        b : ^Body,
        anchor_a : Vect,
        anchor_b : Vect,
        rest_length : Float,
        stiffness : Float,
        damping : Float
    ) -> ^DampedSpring;
damped_spring_new : proc "c" (
        a : ^Body,
        b : ^Body,
        anchor_a : Vect,
        anchor_b : Vect,
        rest_length : Float,
        stiffness : Float,
        damping : Float
    ) -> ^Constraint;
damped_spring_get_anchor_a : proc "c" (constraint : ^Constraint) -> Vect;
damped_spring_set_anchor_a : proc "c" (
        constraint : ^Constraint,
        anchor_a : Vect
    );
damped_spring_get_anchor_b : proc "c" (constraint : ^Constraint) -> Vect;
damped_spring_set_anchor_b : proc "c" (
        constraint : ^Constraint,
        anchor_b : Vect
    );
damped_spring_get_rest_length : proc "c" (constraint : ^Constraint) -> Float;
damped_spring_set_rest_length : proc "c" (
        constraint : ^Constraint,
        rest_length : Float
    );
damped_spring_get_stiffness : proc "c" (constraint : ^Constraint) -> Float;
damped_spring_set_stiffness : proc "c" (
        constraint : ^Constraint,
        stiffness : Float
    );
damped_spring_get_damping : proc "c" (constraint : ^Constraint) -> Float;
damped_spring_set_damping : proc "c" (
        constraint : ^Constraint,
        damping : Float
    );
damped_spring_get_spring_force_func : proc "c" (constraint : ^Constraint) -> DampedSpringForceFunc;
damped_spring_set_spring_force_func : proc "c" (
        constraint : ^Constraint,
        spring_force_func : DampedSpringForceFunc
    );
constraint_is_damped_rotary_spring : proc "c" (constraint : ^Constraint) -> Bool;
damped_rotary_spring_alloc : proc "c" () -> ^DampedRotarySpring;
damped_rotary_spring_init : proc "c" (
        joint : ^DampedRotarySpring,
        a : ^Body,
        b : ^Body,
        rest_angle : Float,
        stiffness : Float,
        damping : Float
    ) -> ^DampedRotarySpring;
damped_rotary_spring_new : proc "c" (
        a : ^Body,
        b : ^Body,
        rest_angle : Float,
        stiffness : Float,
        damping : Float
    ) -> ^Constraint;
damped_rotary_spring_get_rest_angle : proc "c" (constraint : ^Constraint) -> Float;
damped_rotary_spring_set_rest_angle : proc "c" (
        constraint : ^Constraint,
        rest_angle : Float
    );
damped_rotary_spring_get_stiffness : proc "c" (constraint : ^Constraint) -> Float;
damped_rotary_spring_set_stiffness : proc "c" (
        constraint : ^Constraint,
        stiffness : Float
    );
damped_rotary_spring_get_damping : proc "c" (constraint : ^Constraint) -> Float;
damped_rotary_spring_set_damping : proc "c" (
        constraint : ^Constraint,
        damping : Float
    );
damped_rotary_spring_get_spring_torque_func : proc "c" (constraint : ^Constraint) -> DampedRotarySpringTorqueFunc;
damped_rotary_spring_set_spring_torque_func : proc "c" (
        constraint : ^Constraint,
        spring_torque_func : DampedRotarySpringTorqueFunc
    );
constraint_is_rotary_limit_joint : proc "c" (constraint : ^Constraint) -> Bool;
rotary_limit_joint_alloc : proc "c" () -> ^RotaryLimitJoint;
rotary_limit_joint_init : proc "c" (
        joint : ^RotaryLimitJoint,
        a : ^Body,
        b : ^Body,
        min : Float,
        max : Float
    ) -> ^RotaryLimitJoint;
rotary_limit_joint_new : proc "c" (
        a : ^Body,
        b : ^Body,
        min : Float,
        max : Float
    ) -> ^Constraint;
rotary_limit_joint_get_min : proc "c" (constraint : ^Constraint) -> Float;
rotary_limit_joint_set_min : proc "c" (
        constraint : ^Constraint,
        min : Float
    );
rotary_limit_joint_get_max : proc "c" (constraint : ^Constraint) -> Float;
rotary_limit_joint_set_max : proc "c" (
        constraint : ^Constraint,
        max : Float
    );
constraint_is_ratchet_joint : proc "c" (constraint : ^Constraint) -> Bool;
ratchet_joint_alloc : proc "c" () -> ^RatchetJoint;
ratchet_joint_init : proc "c" (
        joint : ^RatchetJoint,
        a : ^Body,
        b : ^Body,
        phase : Float,
        ratchet : Float
    ) -> ^RatchetJoint;
ratchet_joint_new : proc "c" (
        a : ^Body,
        b : ^Body,
        phase : Float,
        ratchet : Float
    ) -> ^Constraint;
ratchet_joint_get_angle : proc "c" (constraint : ^Constraint) -> Float;
ratchet_joint_set_angle : proc "c" (
        constraint : ^Constraint,
        angle : Float
    );
ratchet_joint_get_phase : proc "c" (constraint : ^Constraint) -> Float;
ratchet_joint_set_phase : proc "c" (
        constraint : ^Constraint,
        phase : Float
    );
ratchet_joint_get_ratchet : proc "c" (constraint : ^Constraint) -> Float;
ratchet_joint_set_ratchet : proc "c" (
        constraint : ^Constraint,
        ratchet : Float
    );
constraint_is_gear_joint : proc "c" (constraint : ^Constraint) -> Bool;
gear_joint_alloc : proc "c" () -> ^GearJoint;
gear_joint_init : proc "c" (
        joint : ^GearJoint,
        a : ^Body,
        b : ^Body,
        phase : Float,
        ratio : Float
    ) -> ^GearJoint;
gear_joint_new : proc "c" (
        a : ^Body,
        b : ^Body,
        phase : Float,
        ratio : Float
    ) -> ^Constraint;
gear_joint_get_phase : proc "c" (constraint : ^Constraint) -> Float;
gear_joint_set_phase : proc "c" (
        constraint : ^Constraint,
        phase : Float
    );
gear_joint_get_ratio : proc "c" (constraint : ^Constraint) -> Float;
gear_joint_set_ratio : proc "c" (
        constraint : ^Constraint,
        ratio : Float
    );
constraint_is_simple_motor : proc "c" (constraint : ^Constraint) -> Bool;
simple_motor_alloc : proc "c" () -> ^SimpleMotor;
simple_motor_init : proc "c" (
        joint : ^SimpleMotor,
        a : ^Body,
        b : ^Body,
        rate : Float
    ) -> ^SimpleMotor;
simple_motor_new : proc "c" (
        a : ^Body,
        b : ^Body,
        rate : Float
    ) -> ^Constraint;
simple_motor_get_rate : proc "c" (constraint : ^Constraint) -> Float;
simple_motor_set_rate : proc "c" (
        constraint : ^Constraint,
        rate : Float
    );
space_alloc : proc "c" () -> ^Space;
space_init : proc "c" (space : ^Space) -> ^Space;
space_new : proc "c" () -> ^Space;
space_destroy : proc "c" (space : ^Space);
space_free : proc "c" (space : ^Space);
space_get_iterations : proc "c" (space : ^Space) -> _c.int;
space_set_iterations : proc "c" (
        space : ^Space,
        iterations : _c.int
    );
space_get_gravity : proc "c" (space : ^Space) -> Vect;
space_set_gravity : proc "c" (
        space : ^Space,
        gravity : Vect
    );
space_get_damping : proc "c" (space : ^Space) -> Float;
space_set_damping : proc "c" (
        space : ^Space,
        damping : Float
    );
space_get_idle_speed_threshold : proc "c" (space : ^Space) -> Float;
space_set_idle_speed_threshold : proc "c" (
        space : ^Space,
        idle_speed_threshold : Float
    );
space_get_sleep_time_threshold : proc "c" (space : ^Space) -> Float;
space_set_sleep_time_threshold : proc "c" (
        space : ^Space,
        sleep_time_threshold : Float
    );
space_get_collision_slop : proc "c" (space : ^Space) -> Float;
space_set_collision_slop : proc "c" (
        space : ^Space,
        collision_slop : Float
    );
space_get_collision_bias : proc "c" (space : ^Space) -> Float;
space_set_collision_bias : proc "c" (
        space : ^Space,
        collision_bias : Float
    );
space_get_collision_persistence : proc "c" (space : ^Space) -> Timestamp;
space_set_collision_persistence : proc "c" (
        space : ^Space,
        collision_persistence : Timestamp
    );
space_get_user_data : proc "c" (space : ^Space) -> DataPointer;
space_set_user_data : proc "c" (
        space : ^Space,
        user_data : DataPointer
    );
space_get_static_body : proc "c" (space : ^Space) -> ^Body;
space_get_current_time_step : proc "c" (space : ^Space) -> Float;
space_is_locked : proc "c" (space : ^Space) -> Bool;
space_add_default_collision_handler : proc "c" (space : ^Space) -> ^CollisionHandler;
space_add_collision_handler : proc "c" (
        space : ^Space,
        a : CollisionType,
        b : CollisionType
    ) -> ^CollisionHandler;
space_add_wildcard_handler : proc "c" (
        space : ^Space,
        type : CollisionType
    ) -> ^CollisionHandler;
space_add_shape : proc "c" (
        space : ^Space,
        shape : ^Shape
    ) -> ^Shape;
space_add_body : proc "c" (
        space : ^Space,
        body : ^Body
    ) -> ^Body;
space_add_constraint : proc "c" (
        space : ^Space,
        constraint : ^Constraint
    ) -> ^Constraint;
space_remove_shape : proc "c" (
        space : ^Space,
        shape : ^Shape
    );
space_remove_body : proc "c" (
        space : ^Space,
        body : ^Body
    );
space_remove_constraint : proc "c" (
        space : ^Space,
        constraint : ^Constraint
    );
space_contains_shape : proc "c" (
        space : ^Space,
        shape : ^Shape
    ) -> Bool;
space_contains_body : proc "c" (
        space : ^Space,
        body : ^Body
    ) -> Bool;
space_contains_constraint : proc "c" (
        space : ^Space,
        constraint : ^Constraint
    ) -> Bool;
space_add_post_step_callback : proc "c" (
        space : ^Space,
        func : PostStepFunc,
        key : rawptr,
        data : rawptr
    ) -> Bool;
space_point_query : proc "c" (
        space : ^Space,
        point : Vect,
        max_distance : Float,
        filter : ShapeFilter,
        func : SpacePointQueryFunc,
        data : rawptr
    );
space_point_query_nearest : proc "c" (
        space : ^Space,
        point : Vect,
        max_distance : Float,
        filter : ShapeFilter,
        out : ^PointQueryInfo
    ) -> ^Shape;
space_segment_query : proc "c" (
        space : ^Space,
        start : Vect,
        end : Vect,
        radius : Float,
        filter : ShapeFilter,
        func : SpaceSegmentQueryFunc,
        data : rawptr
    );
space_segment_query_first : proc "c" (
        space : ^Space,
        start : Vect,
        end : Vect,
        radius : Float,
        filter : ShapeFilter,
        out : ^SegmentQueryInfo
    ) -> ^Shape;
space_bb_query : proc "c" (
        space : ^Space,
        bb : Bb,
        filter : ShapeFilter,
        func : SpaceBbQueryFunc,
        data : rawptr
    );
space_shape_query : proc "c" (
        space : ^Space,
        shape : ^Shape,
        func : SpaceShapeQueryFunc,
        data : rawptr
    ) -> Bool;
space_each_body : proc "c" (
        space : ^Space,
        func : SpaceBodyIteratorFunc,
        data : rawptr
    );
space_each_shape : proc "c" (
        space : ^Space,
        func : SpaceShapeIteratorFunc,
        data : rawptr
    );
space_each_constraint : proc "c" (
        space : ^Space,
        func : SpaceConstraintIteratorFunc,
        data : rawptr
    );
space_reindex_static : proc "c" (space : ^Space);
space_reindex_shape : proc "c" (
        space : ^Space,
        shape : ^Shape
    );
space_reindex_shapes_for_body : proc "c" (
        space : ^Space,
        body : ^Body
    );
space_use_spatial_hash : proc "c" (
        space : ^Space,
        dim : Float,
        count : _c.int
    );
space_step : proc "c" (
        space : ^Space,
        dt : Float
    );
space_debug_draw : proc "c" (
        space : ^Space,
        options : ^SpaceDebugDrawOptions
    );
moment_for_circle : proc "c" (
        m : Float,
        r1 : Float,
        r2 : Float,
        offset : Vect
    ) -> Float;
area_for_circle : proc "c" (
        r1 : Float,
        r2 : Float
    ) -> Float;
moment_for_segment : proc "c" (
        m : Float,
        a : Vect,
        b : Vect,
        radius : Float
    ) -> Float;
area_for_segment : proc "c" (
        a : Vect,
        b : Vect,
        radius : Float
    ) -> Float;
moment_for_poly : proc "c" (
        m : Float,
        count : _c.int,
        verts : ^Vect,
        offset : Vect,
        radius : Float
    ) -> Float;
area_for_poly : proc "c" (
        count : _c.int,
        verts : ^Vect,
        radius : Float
    ) -> Float;
centroid_for_poly : proc "c" (
        count : _c.int,
        verts : ^Vect
    ) -> Vect;
moment_for_box : proc "c" (
        m : Float,
        width : Float,
        height : Float
    ) -> Float;
moment_for_box_2 : proc "c" (
        m : Float,
        box : Bb
    ) -> Float;
convex_hull : proc "c" (
        count : _c.int,
        verts : ^Vect,
        result : ^Vect,
        first : ^_c.int,
        tol : Float
    ) -> _c.int;
closet_point_on_segment : proc "c" (
        p : Vect,
        a : Vect,
        b : Vect
    ) -> Vect;
