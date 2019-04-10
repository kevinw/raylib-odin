
package raylib

using import "../types"

raylib_Funcs :: raylib_Funcs;

// re-export everything from ./types for convienience
RAYLIB_H :: RAYLIB_H;
PI :: PI;
DEG2RAD :: DEG2RAD;
RAD2DEG :: RAD2DEG;
MAX_TOUCH_POINTS :: MAX_TOUCH_POINTS;
MAX_SHADER_LOCATIONS :: MAX_SHADER_LOCATIONS;
MAX_MATERIAL_MAPS :: MAX_MATERIAL_MAPS;
LIGHTGRAY := LIGHTGRAY;
GRAY := GRAY;
DARKGRAY := DARKGRAY;
YELLOW := YELLOW;
GOLD := GOLD;
ORANGE := ORANGE;
PINK := PINK;
RED := RED;
MAROON := MAROON;
GREEN := GREEN;
LIME := LIME;
DARKGREEN := DARKGREEN;
SKYBLUE := SKYBLUE;
BLUE := BLUE;
DARKBLUE := DARKBLUE;
PURPLE := PURPLE;
VIOLET := VIOLET;
DARKPURPLE := DARKPURPLE;
BEIGE := BEIGE;
BROWN := BROWN;
DARKBROWN := DARKBROWN;
WHITE := WHITE;
BLACK := BLACK;
BLANK := BLANK;
MAGENTA := MAGENTA;
RAYWHITE := RAYWHITE;
SpriteFont :: SpriteFont;
Camera :: Camera;
LOC_MAP_DIFFUSE :: LOC_MAP_DIFFUSE;
LOC_MAP_SPECULAR :: LOC_MAP_SPECULAR;
MAP_DIFFUSE :: MAP_DIFFUSE;
MAP_SPECULAR :: MAP_SPECULAR;

Quaternion :: Quaternion;
Texture :: Texture;
TextureCubemap :: TextureCubemap;
RenderTexture :: RenderTexture;
Music :: Music;
ConfigFlag :: ConfigFlag;
TraceLogType :: TraceLogType;
KeyboardKey :: KeyboardKey;
AndroidButton :: AndroidButton;
MouseButton :: MouseButton;
GamepadNumber :: GamepadNumber;
GamepadPS3Button :: GamepadPS3Button;
GamepadPS3Axis :: GamepadPS3Axis;
GamepadXbox360Button :: GamepadXbox360Button;
GamepadXbox360Axis :: GamepadXbox360Axis;
GamepadAndroid :: GamepadAndroid;
ShaderLocationIndex :: ShaderLocationIndex;
ShaderUniformDataType :: ShaderUniformDataType;
TexmapIndex :: TexmapIndex;
PixelFormat :: PixelFormat;
TextureFilterMode :: TextureFilterMode;
CubemapLayoutType :: CubemapLayoutType;
TextureWrapMode :: TextureWrapMode;
FontType :: FontType;
BlendMode :: BlendMode;
GestureType :: GestureType;
CameraMode :: CameraMode;
CameraType :: CameraType;
VrDeviceType :: VrDeviceType;
NPatchType :: NPatchType;
TraceLogCallback :: TraceLogCallback;

Vector2 :: Vector2;
Vector3 :: Vector3;
Vector4 :: Vector4;
Matrix :: Matrix;
Color :: Color;
Rectangle :: Rectangle;
Image :: Image;
Texture2D :: Texture2D;
RenderTexture2D :: RenderTexture2D;
NPatchInfo :: NPatchInfo;
CharInfo :: CharInfo;
Font :: Font;
Camera3D :: Camera3D;
Camera2D :: Camera2D;
BoundingBox :: BoundingBox;
Mesh :: Mesh;
Shader :: Shader;
MaterialMap :: MaterialMap;
Material :: Material;
Model :: Model;
Ray :: Ray;
RayHitInfo :: RayHitInfo;
Wave :: Wave;
Sound :: Sound;
MusicData :: MusicData;
AudioStream :: AudioStream;
VrDeviceInfo :: VrDeviceInfo;
VrStereoConfig :: VrStereoConfig;


import _c "core:c"

bridge_init :: proc(funcs: ^raylib_Funcs) {
    assert(funcs != nil);
    assert(funcs.init_window != nil);

    init_window = funcs.init_window;
    window_should_close = funcs.window_should_close;
    close_window = funcs.close_window;
    is_window_ready = funcs.is_window_ready;
    is_window_minimized = funcs.is_window_minimized;
    is_window_resized = funcs.is_window_resized;
    is_window_hidden = funcs.is_window_hidden;
    toggle_fullscreen = funcs.toggle_fullscreen;
    unhide_window = funcs.unhide_window;
    hide_window = funcs.hide_window;
    set_window_icon = funcs.set_window_icon;
    set_window_title = funcs.set_window_title;
    set_window_position = funcs.set_window_position;
    set_window_monitor = funcs.set_window_monitor;
    set_window_min_size = funcs.set_window_min_size;
    set_window_size = funcs.set_window_size;
    get_window_handle = funcs.get_window_handle;
    get_screen_width = funcs.get_screen_width;
    get_screen_height = funcs.get_screen_height;
    get_monitor_count = funcs.get_monitor_count;
    get_monitor_width = funcs.get_monitor_width;
    get_monitor_height = funcs.get_monitor_height;
    get_monitor_physical_width = funcs.get_monitor_physical_width;
    get_monitor_physical_height = funcs.get_monitor_physical_height;
    get_monitor_name = funcs.get_monitor_name;
    get_clipboard_text = funcs.get_clipboard_text;
    set_clipboard_text = funcs.set_clipboard_text;
    is_cursor_hidden = funcs.is_cursor_hidden;
    enable_cursor = funcs.enable_cursor;
    disable_cursor = funcs.disable_cursor;
    clear_background = funcs.clear_background;
    begin_drawing = funcs.begin_drawing;
    end_drawing = funcs.end_drawing;
    begin_mode_2d = funcs.begin_mode_2d;
    end_mode_2d = funcs.end_mode_2d;
    begin_mode_3d = funcs.begin_mode_3d;
    end_mode_3d = funcs.end_mode_3d;
    begin_texture_mode = funcs.begin_texture_mode;
    end_texture_mode = funcs.end_texture_mode;
    get_mouse_ray = funcs.get_mouse_ray;
    get_world_to_screen = funcs.get_world_to_screen;
    get_camera_matrix = funcs.get_camera_matrix;
    set_target_fps = funcs.set_target_fps;
    get_fps = funcs.get_fps;
    get_frame_time = funcs.get_frame_time;
    get_time = funcs.get_time;
    color_to_int = funcs.color_to_int;
    color_normalize = funcs.color_normalize;
    color_to_hsv = funcs.color_to_hsv;
    color_from_hsv = funcs.color_from_hsv;
    get_color = funcs.get_color;
    fade = funcs.fade;
    set_config_flags = funcs.set_config_flags;
    set_trace_log_level = funcs.set_trace_log_level;
    set_trace_log_exit = funcs.set_trace_log_exit;
    set_trace_log_callback = funcs.set_trace_log_callback;
    trace_log = funcs.trace_log;
    take_screenshot = funcs.take_screenshot;
    get_random_value = funcs.get_random_value;
    file_exists = funcs.file_exists;
    is_file_extension = funcs.is_file_extension;
    get_extension = funcs.get_extension;
    get_file_name = funcs.get_file_name;
    get_file_name_without_ext = funcs.get_file_name_without_ext;
    get_directory_path = funcs.get_directory_path;
    get_working_directory = funcs.get_working_directory;
    get_directory_files = funcs.get_directory_files;
    clear_directory_files = funcs.clear_directory_files;
    change_directory = funcs.change_directory;
    is_file_dropped = funcs.is_file_dropped;
    get_dropped_files = funcs.get_dropped_files;
    clear_dropped_files = funcs.clear_dropped_files;
    get_file_mod_time = funcs.get_file_mod_time;
    storage_save_value = funcs.storage_save_value;
    storage_load_value = funcs.storage_load_value;
    open_url = funcs.open_url;
    is_key_pressed = funcs.is_key_pressed;
    is_key_down = funcs.is_key_down;
    is_key_released = funcs.is_key_released;
    is_key_up = funcs.is_key_up;
    get_key_pressed = funcs.get_key_pressed;
    set_exit_key = funcs.set_exit_key;
    is_gamepad_available = funcs.is_gamepad_available;
    is_gamepad_name = funcs.is_gamepad_name;
    get_gamepad_name = funcs.get_gamepad_name;
    is_gamepad_button_pressed = funcs.is_gamepad_button_pressed;
    is_gamepad_button_down = funcs.is_gamepad_button_down;
    is_gamepad_button_released = funcs.is_gamepad_button_released;
    is_gamepad_button_up = funcs.is_gamepad_button_up;
    get_gamepad_button_pressed = funcs.get_gamepad_button_pressed;
    get_gamepad_axis_count = funcs.get_gamepad_axis_count;
    get_gamepad_axis_movement = funcs.get_gamepad_axis_movement;
    is_mouse_button_pressed = funcs.is_mouse_button_pressed;
    is_mouse_button_down = funcs.is_mouse_button_down;
    is_mouse_button_released = funcs.is_mouse_button_released;
    is_mouse_button_up = funcs.is_mouse_button_up;
    get_mouse_x = funcs.get_mouse_x;
    get_mouse_y = funcs.get_mouse_y;
    get_mouse_position = funcs.get_mouse_position;
    set_mouse_position = funcs.set_mouse_position;
    set_mouse_offset = funcs.set_mouse_offset;
    set_mouse_scale = funcs.set_mouse_scale;
    get_mouse_wheel_move = funcs.get_mouse_wheel_move;
    get_touch_x = funcs.get_touch_x;
    get_touch_y = funcs.get_touch_y;
    get_touch_position = funcs.get_touch_position;
    set_gestures_enabled = funcs.set_gestures_enabled;
    is_gesture_detected = funcs.is_gesture_detected;
    get_gesture_detected = funcs.get_gesture_detected;
    get_touch_points_count = funcs.get_touch_points_count;
    get_gesture_hold_duration = funcs.get_gesture_hold_duration;
    get_gesture_drag_vector = funcs.get_gesture_drag_vector;
    get_gesture_drag_angle = funcs.get_gesture_drag_angle;
    get_gesture_pinch_vector = funcs.get_gesture_pinch_vector;
    get_gesture_pinch_angle = funcs.get_gesture_pinch_angle;
    set_camera_mode = funcs.set_camera_mode;
    update_camera = funcs.update_camera;
    set_camera_pan_control = funcs.set_camera_pan_control;
    set_camera_alt_control = funcs.set_camera_alt_control;
    set_camera_smooth_zoom_control = funcs.set_camera_smooth_zoom_control;
    set_camera_move_controls = funcs.set_camera_move_controls;
    draw_pixel = funcs.draw_pixel;
    draw_pixel_v = funcs.draw_pixel_v;
    draw_line = funcs.draw_line;
    draw_line_v = funcs.draw_line_v;
    draw_line_ex = funcs.draw_line_ex;
    draw_line_bezier = funcs.draw_line_bezier;
    draw_circle = funcs.draw_circle;
    draw_circle_sector = funcs.draw_circle_sector;
    draw_circle_gradient = funcs.draw_circle_gradient;
    draw_circle_v = funcs.draw_circle_v;
    draw_circle_lines = funcs.draw_circle_lines;
    draw_rectangle = funcs.draw_rectangle;
    draw_rectangle_v = funcs.draw_rectangle_v;
    draw_rectangle_rec = funcs.draw_rectangle_rec;
    draw_rectangle_pro = funcs.draw_rectangle_pro;
    draw_rectangle_gradient_v = funcs.draw_rectangle_gradient_v;
    draw_rectangle_gradient_h = funcs.draw_rectangle_gradient_h;
    draw_rectangle_gradient_ex = funcs.draw_rectangle_gradient_ex;
    draw_rectangle_lines = funcs.draw_rectangle_lines;
    draw_rectangle_lines_ex = funcs.draw_rectangle_lines_ex;
    draw_triangle = funcs.draw_triangle;
    draw_triangle_lines = funcs.draw_triangle_lines;
    draw_poly = funcs.draw_poly;
    draw_poly_ex = funcs.draw_poly_ex;
    draw_poly_ex_lines = funcs.draw_poly_ex_lines;
    set_shapes_texture = funcs.set_shapes_texture;
    check_collision_recs = funcs.check_collision_recs;
    check_collision_circles = funcs.check_collision_circles;
    check_collision_circle_rec = funcs.check_collision_circle_rec;
    get_collision_rec = funcs.get_collision_rec;
    check_collision_point_rec = funcs.check_collision_point_rec;
    check_collision_point_circle = funcs.check_collision_point_circle;
    check_collision_point_triangle = funcs.check_collision_point_triangle;
    load_image = funcs.load_image;
    load_image_ex = funcs.load_image_ex;
    load_image_pro = funcs.load_image_pro;
    load_image_raw = funcs.load_image_raw;
    export_image = funcs.export_image;
    export_image_as_code = funcs.export_image_as_code;
    load_texture = funcs.load_texture;
    load_texture_from_image = funcs.load_texture_from_image;
    load_texture_cubemap = funcs.load_texture_cubemap;
    load_render_texture = funcs.load_render_texture;
    unload_image = funcs.unload_image;
    unload_texture = funcs.unload_texture;
    unload_render_texture = funcs.unload_render_texture;
    get_image_data = funcs.get_image_data;
    get_image_data_normalized = funcs.get_image_data_normalized;
    get_pixel_data_size = funcs.get_pixel_data_size;
    get_texture_data = funcs.get_texture_data;
    get_screen_data = funcs.get_screen_data;
    update_texture = funcs.update_texture;
    image_copy = funcs.image_copy;
    image_to_pot = funcs.image_to_pot;
    image_format = funcs.image_format;
    image_alpha_mask = funcs.image_alpha_mask;
    image_alpha_clear = funcs.image_alpha_clear;
    image_alpha_crop = funcs.image_alpha_crop;
    image_alpha_premultiply = funcs.image_alpha_premultiply;
    image_crop = funcs.image_crop;
    image_resize = funcs.image_resize;
    image_resize_nn = funcs.image_resize_nn;
    image_resize_canvas = funcs.image_resize_canvas;
    image_mipmaps = funcs.image_mipmaps;
    image_dither = funcs.image_dither;
    image_extract_palette = funcs.image_extract_palette;
    image_text = funcs.image_text;
    image_text_ex = funcs.image_text_ex;
    image_draw = funcs.image_draw;
    image_draw_rectangle = funcs.image_draw_rectangle;
    image_draw_rectangle_lines = funcs.image_draw_rectangle_lines;
    image_draw_text = funcs.image_draw_text;
    image_draw_text_ex = funcs.image_draw_text_ex;
    image_flip_vertical = funcs.image_flip_vertical;
    image_flip_horizontal = funcs.image_flip_horizontal;
    image_rotate_cw = funcs.image_rotate_cw;
    image_rotate_ccw = funcs.image_rotate_ccw;
    image_color_tint = funcs.image_color_tint;
    image_color_invert = funcs.image_color_invert;
    image_color_grayscale = funcs.image_color_grayscale;
    image_color_contrast = funcs.image_color_contrast;
    image_color_brightness = funcs.image_color_brightness;
    image_color_replace = funcs.image_color_replace;
    gen_image_color = funcs.gen_image_color;
    gen_image_gradient_v = funcs.gen_image_gradient_v;
    gen_image_gradient_h = funcs.gen_image_gradient_h;
    gen_image_gradient_radial = funcs.gen_image_gradient_radial;
    gen_image_checked = funcs.gen_image_checked;
    gen_image_white_noise = funcs.gen_image_white_noise;
    gen_image_perlin_noise = funcs.gen_image_perlin_noise;
    gen_image_cellular = funcs.gen_image_cellular;
    gen_texture_mipmaps = funcs.gen_texture_mipmaps;
    set_texture_filter = funcs.set_texture_filter;
    set_texture_wrap = funcs.set_texture_wrap;
    draw_texture = funcs.draw_texture;
    draw_texture_v = funcs.draw_texture_v;
    draw_texture_ex = funcs.draw_texture_ex;
    draw_texture_rec = funcs.draw_texture_rec;
    draw_texture_quad = funcs.draw_texture_quad;
    draw_texture_pro = funcs.draw_texture_pro;
    draw_texture_n_patch = funcs.draw_texture_n_patch;
    get_font_default = funcs.get_font_default;
    load_font = funcs.load_font;
    load_font_ex = funcs.load_font_ex;
    load_font_from_image = funcs.load_font_from_image;
    load_font_data = funcs.load_font_data;
    gen_image_font_atlas = funcs.gen_image_font_atlas;
    unload_font = funcs.unload_font;
    draw_fps = funcs.draw_fps;
    draw_text = funcs.draw_text;
    draw_text_ex = funcs.draw_text_ex;
    draw_text_rec = funcs.draw_text_rec;
    draw_text_rec_ex = funcs.draw_text_rec_ex;
    measure_text = funcs.measure_text;
    measure_text_ex = funcs.measure_text_ex;
    get_glyph_index = funcs.get_glyph_index;
    text_is_equal = funcs.text_is_equal;
    text_length = funcs.text_length;
    text_format = funcs.text_format;
    text_subtext = funcs.text_subtext;
    text_replace = funcs.text_replace;
    text_insert = funcs.text_insert;
    text_join = funcs.text_join;
    text_split = funcs.text_split;
    text_append = funcs.text_append;
    text_find_index = funcs.text_find_index;
    text_to_upper = funcs.text_to_upper;
    text_to_lower = funcs.text_to_lower;
    text_to_pascal = funcs.text_to_pascal;
    text_to_integer = funcs.text_to_integer;
    draw_line_3d = funcs.draw_line_3d;
    draw_circle_3d = funcs.draw_circle_3d;
    draw_cube = funcs.draw_cube;
    draw_cube_v = funcs.draw_cube_v;
    draw_cube_wires = funcs.draw_cube_wires;
    draw_cube_wires_v = funcs.draw_cube_wires_v;
    draw_cube_texture = funcs.draw_cube_texture;
    draw_sphere = funcs.draw_sphere;
    draw_sphere_ex = funcs.draw_sphere_ex;
    draw_sphere_wires = funcs.draw_sphere_wires;
    draw_cylinder = funcs.draw_cylinder;
    draw_cylinder_wires = funcs.draw_cylinder_wires;
    draw_plane = funcs.draw_plane;
    draw_ray = funcs.draw_ray;
    draw_grid = funcs.draw_grid;
    draw_gizmo = funcs.draw_gizmo;
    load_model = funcs.load_model;
    load_model_from_mesh = funcs.load_model_from_mesh;
    unload_model = funcs.unload_model;
    load_mesh = funcs.load_mesh;
    unload_mesh = funcs.unload_mesh;
    export_mesh = funcs.export_mesh;
    mesh_bounding_box = funcs.mesh_bounding_box;
    mesh_tangents = funcs.mesh_tangents;
    mesh_binormals = funcs.mesh_binormals;
    gen_mesh_poly = funcs.gen_mesh_poly;
    gen_mesh_plane = funcs.gen_mesh_plane;
    gen_mesh_cube = funcs.gen_mesh_cube;
    gen_mesh_sphere = funcs.gen_mesh_sphere;
    gen_mesh_hemi_sphere = funcs.gen_mesh_hemi_sphere;
    gen_mesh_cylinder = funcs.gen_mesh_cylinder;
    gen_mesh_torus = funcs.gen_mesh_torus;
    gen_mesh_knot = funcs.gen_mesh_knot;
    gen_mesh_heightmap = funcs.gen_mesh_heightmap;
    gen_mesh_cubicmap = funcs.gen_mesh_cubicmap;
    load_material = funcs.load_material;
    load_material_default = funcs.load_material_default;
    unload_material = funcs.unload_material;
    draw_model = funcs.draw_model;
    draw_model_ex = funcs.draw_model_ex;
    draw_model_wires = funcs.draw_model_wires;
    draw_model_wires_ex = funcs.draw_model_wires_ex;
    draw_bounding_box = funcs.draw_bounding_box;
    draw_billboard = funcs.draw_billboard;
    draw_billboard_rec = funcs.draw_billboard_rec;
    check_collision_spheres = funcs.check_collision_spheres;
    check_collision_boxes = funcs.check_collision_boxes;
    check_collision_box_sphere = funcs.check_collision_box_sphere;
    check_collision_ray_sphere = funcs.check_collision_ray_sphere;
    check_collision_ray_sphere_ex = funcs.check_collision_ray_sphere_ex;
    check_collision_ray_box = funcs.check_collision_ray_box;
    get_collision_ray_model = funcs.get_collision_ray_model;
    get_collision_ray_triangle = funcs.get_collision_ray_triangle;
    get_collision_ray_ground = funcs.get_collision_ray_ground;
    load_text = funcs.load_text;
    load_shader = funcs.load_shader;
    load_shader_code = funcs.load_shader_code;
    unload_shader = funcs.unload_shader;
    get_shader_default = funcs.get_shader_default;
    get_texture_default = funcs.get_texture_default;
    get_shader_location = funcs.get_shader_location;
    set_shader_value = funcs.set_shader_value;
    set_shader_value_v = funcs.set_shader_value_v;
    set_shader_value_matrix = funcs.set_shader_value_matrix;
    set_matrix_projection = funcs.set_matrix_projection;
    set_matrix_modelview = funcs.set_matrix_modelview;
    get_matrix_modelview = funcs.get_matrix_modelview;
    gen_texture_cubemap = funcs.gen_texture_cubemap;
    gen_texture_irradiance = funcs.gen_texture_irradiance;
    gen_texture_prefilter = funcs.gen_texture_prefilter;
    gen_texture_brdf = funcs.gen_texture_brdf;
    begin_shader_mode = funcs.begin_shader_mode;
    end_shader_mode = funcs.end_shader_mode;
    begin_blend_mode = funcs.begin_blend_mode;
    end_blend_mode = funcs.end_blend_mode;
    begin_scissor_mode = funcs.begin_scissor_mode;
    end_scissor_mode = funcs.end_scissor_mode;
    get_vr_device_info = funcs.get_vr_device_info;
    init_vr_simulator = funcs.init_vr_simulator;
    update_vr_tracking = funcs.update_vr_tracking;
    close_vr_simulator = funcs.close_vr_simulator;
    is_vr_simulator_ready = funcs.is_vr_simulator_ready;
    toggle_vr_mode = funcs.toggle_vr_mode;
    begin_vr_drawing = funcs.begin_vr_drawing;
    end_vr_drawing = funcs.end_vr_drawing;
    init_audio_device = funcs.init_audio_device;
    close_audio_device = funcs.close_audio_device;
    is_audio_device_ready = funcs.is_audio_device_ready;
    set_master_volume = funcs.set_master_volume;
    load_wave = funcs.load_wave;
    load_wave_ex = funcs.load_wave_ex;
    load_sound = funcs.load_sound;
    load_sound_from_wave = funcs.load_sound_from_wave;
    update_sound = funcs.update_sound;
    unload_wave = funcs.unload_wave;
    unload_sound = funcs.unload_sound;
    export_wave = funcs.export_wave;
    export_wave_as_code = funcs.export_wave_as_code;
    play_sound = funcs.play_sound;
    pause_sound = funcs.pause_sound;
    resume_sound = funcs.resume_sound;
    stop_sound = funcs.stop_sound;
    is_sound_playing = funcs.is_sound_playing;
    set_sound_volume = funcs.set_sound_volume;
    set_sound_pitch = funcs.set_sound_pitch;
    wave_format = funcs.wave_format;
    wave_copy = funcs.wave_copy;
    wave_crop = funcs.wave_crop;
    get_wave_data = funcs.get_wave_data;
    load_music_stream = funcs.load_music_stream;
    unload_music_stream = funcs.unload_music_stream;
    play_music_stream = funcs.play_music_stream;
    update_music_stream = funcs.update_music_stream;
    stop_music_stream = funcs.stop_music_stream;
    pause_music_stream = funcs.pause_music_stream;
    resume_music_stream = funcs.resume_music_stream;
    is_music_playing = funcs.is_music_playing;
    set_music_volume = funcs.set_music_volume;
    set_music_pitch = funcs.set_music_pitch;
    set_music_loop_count = funcs.set_music_loop_count;
    get_music_time_length = funcs.get_music_time_length;
    get_music_time_played = funcs.get_music_time_played;
    init_audio_stream = funcs.init_audio_stream;
    update_audio_stream = funcs.update_audio_stream;
    close_audio_stream = funcs.close_audio_stream;
    is_audio_buffer_processed = funcs.is_audio_buffer_processed;
    play_audio_stream = funcs.play_audio_stream;
    pause_audio_stream = funcs.pause_audio_stream;
    resume_audio_stream = funcs.resume_audio_stream;
    is_audio_stream_playing = funcs.is_audio_stream_playing;
    stop_audio_stream = funcs.stop_audio_stream;
    set_audio_stream_volume = funcs.set_audio_stream_volume;
    set_audio_stream_pitch = funcs.set_audio_stream_pitch;
}

bridge_deinit :: proc() {
}

init_window : proc "c" (
        width : _c.int,
        height : _c.int,
        title : cstring
    );
window_should_close : proc "c" () -> bool;
close_window : proc "c" ();
is_window_ready : proc "c" () -> bool;
is_window_minimized : proc "c" () -> bool;
is_window_resized : proc "c" () -> bool;
is_window_hidden : proc "c" () -> bool;
toggle_fullscreen : proc "c" ();
unhide_window : proc "c" ();
hide_window : proc "c" ();
set_window_icon : proc "c" (image : Image);
set_window_title : proc "c" (title : cstring);
set_window_position : proc "c" (
        x : _c.int,
        y : _c.int
    );
set_window_monitor : proc "c" (monitor : _c.int);
set_window_min_size : proc "c" (
        width : _c.int,
        height : _c.int
    );
set_window_size : proc "c" (
        width : _c.int,
        height : _c.int
    );
get_window_handle : proc "c" () -> rawptr;
get_screen_width : proc "c" () -> _c.int;
get_screen_height : proc "c" () -> _c.int;
get_monitor_count : proc "c" () -> _c.int;
get_monitor_width : proc "c" (monitor : _c.int) -> _c.int;
get_monitor_height : proc "c" (monitor : _c.int) -> _c.int;
get_monitor_physical_width : proc "c" (monitor : _c.int) -> _c.int;
get_monitor_physical_height : proc "c" (monitor : _c.int) -> _c.int;
get_monitor_name : proc "c" (monitor : _c.int) -> cstring;
get_clipboard_text : proc "c" () -> cstring;
set_clipboard_text : proc "c" (text : cstring);
is_cursor_hidden : proc "c" () -> bool;
enable_cursor : proc "c" ();
disable_cursor : proc "c" ();
clear_background : proc "c" (color : Color);
begin_drawing : proc "c" ();
end_drawing : proc "c" ();
begin_mode_2d : proc "c" (camera : Camera2D);
end_mode_2d : proc "c" ();
begin_mode_3d : proc "c" (camera : Camera3D);
end_mode_3d : proc "c" ();
begin_texture_mode : proc "c" (target : RenderTexture2D);
end_texture_mode : proc "c" ();
get_mouse_ray : proc "c" (
        mouse_position : Vector2,
        camera : Camera
    ) -> Ray;
get_world_to_screen : proc "c" (
        position : Vector3,
        camera : Camera
    ) -> Vector2;
get_camera_matrix : proc "c" (camera : Camera) -> Matrix;
set_target_fps : proc "c" (fps : _c.int);
get_fps : proc "c" () -> _c.int;
get_frame_time : proc "c" () -> _c.float;
get_time : proc "c" () -> _c.double;
color_to_int : proc "c" (color : Color) -> _c.int;
color_normalize : proc "c" (color : Color) -> Vector4;
color_to_hsv : proc "c" (color : Color) -> Vector3;
color_from_hsv : proc "c" (hsv : Vector3) -> Color;
get_color : proc "c" (hex_value : _c.int) -> Color;
fade : proc "c" (
        color : Color,
        alpha : _c.float
    ) -> Color;
set_config_flags : proc "c" (flags : ConfigFlag);
set_trace_log_level : proc "c" (log_type : TraceLogType);
set_trace_log_exit : proc "c" (log_type : TraceLogType);
set_trace_log_callback : proc "c" (callback : TraceLogCallback);
trace_log : proc "c" (
        log_type : TraceLogType,
        text : cstring
    );
take_screenshot : proc "c" (file_name : cstring);
get_random_value : proc "c" (
        min : _c.int,
        max : _c.int
    ) -> _c.int;
file_exists : proc "c" (file_name : cstring) -> bool;
is_file_extension : proc "c" (
        file_name : cstring,
        ext : cstring
    ) -> bool;
get_extension : proc "c" (file_name : cstring) -> cstring;
get_file_name : proc "c" (file_path : cstring) -> cstring;
get_file_name_without_ext : proc "c" (file_path : cstring) -> cstring;
get_directory_path : proc "c" (file_name : cstring) -> cstring;
get_working_directory : proc "c" () -> cstring;
get_directory_files : proc "c" (
        dir_path : cstring,
        count : ^_c.int
    ) -> ^cstring;
clear_directory_files : proc "c" ();
change_directory : proc "c" (dir : cstring) -> bool;
is_file_dropped : proc "c" () -> bool;
get_dropped_files : proc "c" (count : ^_c.int) -> ^cstring;
clear_dropped_files : proc "c" ();
get_file_mod_time : proc "c" (file_name : cstring) -> _c.long;
storage_save_value : proc "c" (
        position : _c.int,
        value : _c.int
    );
storage_load_value : proc "c" (position : _c.int) -> _c.int;
open_url : proc "c" (url : cstring);
is_key_pressed : proc "c" (key : KeyboardKey) -> bool;
is_key_down : proc "c" (key : KeyboardKey) -> bool;
is_key_released : proc "c" (key : KeyboardKey) -> bool;
is_key_up : proc "c" (key : KeyboardKey) -> bool;
get_key_pressed : proc "c" () -> _c.int;
set_exit_key : proc "c" (key : KeyboardKey);
is_gamepad_available : proc "c" (gamepad : GamepadNumber) -> bool;
is_gamepad_name : proc "c" (
        gamepad : GamepadNumber,
        name : cstring
    ) -> bool;
get_gamepad_name : proc "c" (gamepad : GamepadNumber) -> cstring;
is_gamepad_button_pressed : proc "c" (
        gamepad : GamepadNumber,
        button : _c.int
    ) -> bool;
is_gamepad_button_down : proc "c" (
        gamepad : GamepadNumber,
        button : _c.int
    ) -> bool;
is_gamepad_button_released : proc "c" (
        gamepad : GamepadNumber,
        button : _c.int
    ) -> bool;
is_gamepad_button_up : proc "c" (
        gamepad : GamepadNumber,
        button : _c.int
    ) -> bool;
get_gamepad_button_pressed : proc "c" () -> _c.int;
get_gamepad_axis_count : proc "c" (gamepad : GamepadNumber) -> _c.int;
get_gamepad_axis_movement : proc "c" (
        gamepad : GamepadNumber,
        axis : _c.int
    ) -> _c.float;
is_mouse_button_pressed : proc "c" (button : MouseButton) -> bool;
is_mouse_button_down : proc "c" (button : MouseButton) -> bool;
is_mouse_button_released : proc "c" (button : MouseButton) -> bool;
is_mouse_button_up : proc "c" (button : MouseButton) -> bool;
get_mouse_x : proc "c" () -> _c.int;
get_mouse_y : proc "c" () -> _c.int;
get_mouse_position : proc "c" () -> Vector2;
set_mouse_position : proc "c" (
        x : _c.int,
        y : _c.int
    );
set_mouse_offset : proc "c" (
        offset_x : _c.int,
        offset_y : _c.int
    );
set_mouse_scale : proc "c" (
        scale_x : _c.float,
        scale_y : _c.float
    );
get_mouse_wheel_move : proc "c" () -> _c.int;
get_touch_x : proc "c" () -> _c.int;
get_touch_y : proc "c" () -> _c.int;
get_touch_position : proc "c" (index : _c.int) -> Vector2;
set_gestures_enabled : proc "c" (gesture_flags : _c.uint);
is_gesture_detected : proc "c" (gesture : _c.int) -> bool;
get_gesture_detected : proc "c" () -> _c.int;
get_touch_points_count : proc "c" () -> _c.int;
get_gesture_hold_duration : proc "c" () -> _c.float;
get_gesture_drag_vector : proc "c" () -> Vector2;
get_gesture_drag_angle : proc "c" () -> _c.float;
get_gesture_pinch_vector : proc "c" () -> Vector2;
get_gesture_pinch_angle : proc "c" () -> _c.float;
set_camera_mode : proc "c" (
        camera : CameraMode,
        mode : _c.int
    );
update_camera : proc "c" (camera : ^Camera);
set_camera_pan_control : proc "c" (pan_key : _c.int);
set_camera_alt_control : proc "c" (alt_key : _c.int);
set_camera_smooth_zoom_control : proc "c" (sz_key : _c.int);
set_camera_move_controls : proc "c" (
        front_key : _c.int,
        back_key : _c.int,
        right_key : _c.int,
        left_key : _c.int,
        up_key : _c.int,
        down_key : _c.int
    );
draw_pixel : proc "c" (
        pos_x : _c.int,
        pos_y : _c.int,
        color : Color
    );
draw_pixel_v : proc "c" (
        position : Vector2,
        color : Color
    );
draw_line : proc "c" (
        start_pos_x : _c.int,
        start_pos_y : _c.int,
        end_pos_x : _c.int,
        end_pos_y : _c.int,
        color : Color
    );
draw_line_v : proc "c" (
        start_pos : Vector2,
        end_pos : Vector2,
        color : Color
    );
draw_line_ex : proc "c" (
        start_pos : Vector2,
        end_pos : Vector2,
        thick : _c.float,
        color : Color
    );
draw_line_bezier : proc "c" (
        start_pos : Vector2,
        end_pos : Vector2,
        thick : _c.float,
        color : Color
    );
draw_circle : proc "c" (
        center_x : _c.int,
        center_y : _c.int,
        radius : _c.float,
        color : Color
    );
draw_circle_sector : proc "c" (
        center : Vector2,
        radius : _c.float,
        start_angle : _c.int,
        end_angle : _c.int,
        color : Color
    );
draw_circle_gradient : proc "c" (
        center_x : _c.int,
        center_y : _c.int,
        radius : _c.float,
        color1 : Color,
        color2 : Color
    );
draw_circle_v : proc "c" (
        center : Vector2,
        radius : _c.float,
        color : Color
    );
draw_circle_lines : proc "c" (
        center_x : _c.int,
        center_y : _c.int,
        radius : _c.float,
        color : Color
    );
draw_rectangle : proc "c" (
        pos_x : _c.int,
        pos_y : _c.int,
        width : _c.int,
        height : _c.int,
        color : Color
    );
draw_rectangle_v : proc "c" (
        position : Vector2,
        size : Vector2,
        color : Color
    );
draw_rectangle_rec : proc "c" (
        rec : Rectangle,
        color : Color
    );
draw_rectangle_pro : proc "c" (
        rec : Rectangle,
        origin : Vector2,
        rotation : _c.float,
        color : Color
    );
draw_rectangle_gradient_v : proc "c" (
        pos_x : _c.int,
        pos_y : _c.int,
        width : _c.int,
        height : _c.int,
        color1 : Color,
        color2 : Color
    );
draw_rectangle_gradient_h : proc "c" (
        pos_x : _c.int,
        pos_y : _c.int,
        width : _c.int,
        height : _c.int,
        color1 : Color,
        color2 : Color
    );
draw_rectangle_gradient_ex : proc "c" (
        rec : Rectangle,
        col1 : Color,
        col2 : Color,
        col3 : Color,
        col4 : Color
    );
draw_rectangle_lines : proc "c" (
        pos_x : _c.int,
        pos_y : _c.int,
        width : _c.int,
        height : _c.int,
        color : Color
    );
draw_rectangle_lines_ex : proc "c" (
        rec : Rectangle,
        line_thick : _c.int,
        color : Color
    );
draw_triangle : proc "c" (
        v1 : Vector2,
        v2 : Vector2,
        v3 : Vector2,
        color : Color
    );
draw_triangle_lines : proc "c" (
        v1 : Vector2,
        v2 : Vector2,
        v3 : Vector2,
        color : Color
    );
draw_poly : proc "c" (
        center : Vector2,
        sides : _c.int,
        radius : _c.float,
        rotation : _c.float,
        color : Color
    );
draw_poly_ex : proc "c" (
        points : ^Vector2,
        num_points : _c.int,
        color : Color
    );
draw_poly_ex_lines : proc "c" (
        points : ^Vector2,
        num_points : _c.int,
        color : Color
    );
set_shapes_texture : proc "c" (
        texture : Texture2D,
        source : Rectangle
    );
check_collision_recs : proc "c" (
        rec1 : Rectangle,
        rec2 : Rectangle
    ) -> bool;
check_collision_circles : proc "c" (
        center1 : Vector2,
        radius1 : _c.float,
        center2 : Vector2,
        radius2 : _c.float
    ) -> bool;
check_collision_circle_rec : proc "c" (
        center : Vector2,
        radius : _c.float,
        rec : Rectangle
    ) -> bool;
get_collision_rec : proc "c" (
        rec1 : Rectangle,
        rec2 : Rectangle
    ) -> Rectangle;
check_collision_point_rec : proc "c" (
        point : Vector2,
        rec : Rectangle
    ) -> bool;
check_collision_point_circle : proc "c" (
        point : Vector2,
        center : Vector2,
        radius : _c.float
    ) -> bool;
check_collision_point_triangle : proc "c" (
        point : Vector2,
        p1 : Vector2,
        p2 : Vector2,
        p3 : Vector2
    ) -> bool;
load_image : proc "c" (file_name : cstring) -> Image;
load_image_ex : proc "c" (
        pixels : ^Color,
        width : _c.int,
        height : _c.int
    ) -> Image;
load_image_pro : proc "c" (
        data : rawptr,
        width : _c.int,
        height : _c.int,
        format : _c.int
    ) -> Image;
load_image_raw : proc "c" (
        file_name : cstring,
        width : _c.int,
        height : _c.int,
        format : _c.int,
        header_size : _c.int
    ) -> Image;
export_image : proc "c" (
        image : Image,
        file_name : cstring
    );
export_image_as_code : proc "c" (
        image : Image,
        file_name : cstring
    );
load_texture : proc "c" (file_name : cstring) -> Texture2D;
load_texture_from_image : proc "c" (image : Image) -> Texture2D;
load_texture_cubemap : proc "c" (
        image : Image,
        layout_type : _c.int
    ) -> TextureCubemap;
load_render_texture : proc "c" (
        width : _c.int,
        height : _c.int
    ) -> RenderTexture2D;
unload_image : proc "c" (image : Image);
unload_texture : proc "c" (texture : Texture2D);
unload_render_texture : proc "c" (target : RenderTexture2D);
get_image_data : proc "c" (image : Image) -> ^Color;
get_image_data_normalized : proc "c" (image : Image) -> ^Vector4;
get_pixel_data_size : proc "c" (
        width : _c.int,
        height : _c.int,
        format : _c.int
    ) -> _c.int;
get_texture_data : proc "c" (texture : Texture2D) -> Image;
get_screen_data : proc "c" () -> Image;
update_texture : proc "c" (
        texture : Texture2D,
        pixels : rawptr
    );
image_copy : proc "c" (image : Image) -> Image;
image_to_pot : proc "c" (
        image : ^Image,
        fill_color : Color
    );
image_format : proc "c" (
        image : ^Image,
        new_format : _c.int
    );
image_alpha_mask : proc "c" (
        image : ^Image,
        alpha_mask : Image
    );
image_alpha_clear : proc "c" (
        image : ^Image,
        color : Color,
        threshold : _c.float
    );
image_alpha_crop : proc "c" (
        image : ^Image,
        threshold : _c.float
    );
image_alpha_premultiply : proc "c" (image : ^Image);
image_crop : proc "c" (
        image : ^Image,
        crop : Rectangle
    );
image_resize : proc "c" (
        image : ^Image,
        new_width : _c.int,
        new_height : _c.int
    );
image_resize_nn : proc "c" (
        image : ^Image,
        new_width : _c.int,
        new_height : _c.int
    );
image_resize_canvas : proc "c" (
        image : ^Image,
        new_width : _c.int,
        new_height : _c.int,
        offset_x : _c.int,
        offset_y : _c.int,
        color : Color
    );
image_mipmaps : proc "c" (image : ^Image);
image_dither : proc "c" (
        image : ^Image,
        r_bpp : _c.int,
        g_bpp : _c.int,
        b_bpp : _c.int,
        a_bpp : _c.int
    );
image_extract_palette : proc "c" (
        image : Image,
        max_palette_size : _c.int,
        extract_count : ^_c.int
    ) -> ^Color;
image_text : proc "c" (
        text : cstring,
        font_size : _c.int,
        color : Color
    ) -> Image;
image_text_ex : proc "c" (
        font : Font,
        text : cstring,
        font_size : _c.float,
        spacing : _c.float,
        tint : Color
    ) -> Image;
image_draw : proc "c" (
        dst : ^Image,
        src : Image,
        src_rec : Rectangle,
        dst_rec : Rectangle
    );
image_draw_rectangle : proc "c" (
        dst : ^Image,
        rec : Rectangle,
        color : Color
    );
image_draw_rectangle_lines : proc "c" (
        dst : ^Image,
        rec : Rectangle,
        thick : _c.int,
        color : Color
    );
image_draw_text : proc "c" (
        dst : ^Image,
        position : Vector2,
        text : cstring,
        font_size : _c.int,
        color : Color
    );
image_draw_text_ex : proc "c" (
        dst : ^Image,
        position : Vector2,
        font : Font,
        text : cstring,
        font_size : _c.float,
        spacing : _c.float,
        color : Color
    );
image_flip_vertical : proc "c" (image : ^Image);
image_flip_horizontal : proc "c" (image : ^Image);
image_rotate_cw : proc "c" (image : ^Image);
image_rotate_ccw : proc "c" (image : ^Image);
image_color_tint : proc "c" (
        image : ^Image,
        color : Color
    );
image_color_invert : proc "c" (image : ^Image);
image_color_grayscale : proc "c" (image : ^Image);
image_color_contrast : proc "c" (
        image : ^Image,
        contrast : _c.float
    );
image_color_brightness : proc "c" (
        image : ^Image,
        brightness : _c.int
    );
image_color_replace : proc "c" (
        image : ^Image,
        color : Color,
        replace : Color
    );
gen_image_color : proc "c" (
        width : _c.int,
        height : _c.int,
        color : Color
    ) -> Image;
gen_image_gradient_v : proc "c" (
        width : _c.int,
        height : _c.int,
        top : Color,
        bottom : Color
    ) -> Image;
gen_image_gradient_h : proc "c" (
        width : _c.int,
        height : _c.int,
        left : Color,
        right : Color
    ) -> Image;
gen_image_gradient_radial : proc "c" (
        width : _c.int,
        height : _c.int,
        density : _c.float,
        inner : Color,
        outer : Color
    ) -> Image;
gen_image_checked : proc "c" (
        width : _c.int,
        height : _c.int,
        checks_x : _c.int,
        checks_y : _c.int,
        col1 : Color,
        col2 : Color
    ) -> Image;
gen_image_white_noise : proc "c" (
        width : _c.int,
        height : _c.int,
        factor : _c.float
    ) -> Image;
gen_image_perlin_noise : proc "c" (
        width : _c.int,
        height : _c.int,
        offset_x : _c.int,
        offset_y : _c.int,
        scale : _c.float
    ) -> Image;
gen_image_cellular : proc "c" (
        width : _c.int,
        height : _c.int,
        tile_size : _c.int
    ) -> Image;
gen_texture_mipmaps : proc "c" (texture : ^Texture2D);
set_texture_filter : proc "c" (
        texture : Texture2D,
        filter_mode : _c.int
    );
set_texture_wrap : proc "c" (
        texture : Texture2D,
        wrap_mode : _c.int
    );
draw_texture : proc "c" (
        texture : Texture2D,
        pos_x : _c.int,
        pos_y : _c.int,
        tint : Color
    );
draw_texture_v : proc "c" (
        texture : Texture2D,
        position : Vector2,
        tint : Color
    );
draw_texture_ex : proc "c" (
        texture : Texture2D,
        position : Vector2,
        rotation : _c.float,
        scale : _c.float,
        tint : Color
    );
draw_texture_rec : proc "c" (
        texture : Texture2D,
        source_rec : Rectangle,
        position : Vector2,
        tint : Color
    );
draw_texture_quad : proc "c" (
        texture : Texture2D,
        tiling : Vector2,
        offset : Vector2,
        quad : Rectangle,
        tint : Color
    );
draw_texture_pro : proc "c" (
        texture : Texture2D,
        source_rec : Rectangle,
        dest_rec : Rectangle,
        origin : Vector2,
        rotation : _c.float,
        tint : Color
    );
draw_texture_n_patch : proc "c" (
        texture : Texture2D,
        n_patch_info : NPatchInfo,
        dest_rec : Rectangle,
        origin : Vector2,
        rotation : _c.float,
        tint : Color
    );
get_font_default : proc "c" () -> Font;
load_font : proc "c" (file_name : cstring) -> Font;
load_font_ex : proc "c" (
        file_name : cstring,
        font_size : _c.int,
        font_chars : ^_c.int,
        chars_count : _c.int
    ) -> Font;
load_font_from_image : proc "c" (
        image : Image,
        key : Color,
        first_char : _c.int
    ) -> Font;
load_font_data : proc "c" (
        file_name : cstring,
        font_size : _c.int,
        font_chars : ^_c.int,
        chars_count : _c.int,
        type : _c.int
    ) -> ^CharInfo;
gen_image_font_atlas : proc "c" (
        chars : ^CharInfo,
        chars_count : _c.int,
        font_size : _c.int,
        padding : _c.int,
        pack_method : _c.int
    ) -> Image;
unload_font : proc "c" (font : Font);
draw_fps : proc "c" (
        pos_x : _c.int,
        pos_y : _c.int
    );
draw_text : proc "c" (
        text : cstring,
        pos_x : _c.int,
        pos_y : _c.int,
        font_size : _c.int,
        color : Color
    );
draw_text_ex : proc "c" (
        font : Font,
        text : cstring,
        position : Vector2,
        font_size : _c.float,
        spacing : _c.float,
        tint : Color
    );
draw_text_rec : proc "c" (
        font : Font,
        text : cstring,
        rec : Rectangle,
        font_size : _c.float,
        spacing : _c.float,
        word_wrap : bool,
        tint : Color
    );
draw_text_rec_ex : proc "c" (
        font : Font,
        text : cstring,
        rec : Rectangle,
        font_size : _c.float,
        spacing : _c.float,
        word_wrap : bool,
        tint : Color,
        select_start : _c.int,
        select_length : _c.int,
        select_text : Color,
        select_back : Color
    );
measure_text : proc "c" (
        text : cstring,
        font_size : _c.int
    ) -> _c.int;
measure_text_ex : proc "c" (
        font : Font,
        text : cstring,
        font_size : _c.float,
        spacing : _c.float
    ) -> Vector2;
get_glyph_index : proc "c" (
        font : Font,
        character : _c.int
    ) -> _c.int;
text_is_equal : proc "c" (
        text1 : cstring,
        text2 : cstring
    ) -> bool;
text_length : proc "c" (text : cstring) -> _c.uint;
text_format : proc "c" (text : cstring) -> cstring;
text_subtext : proc "c" (
        text : cstring,
        position : _c.int,
        length : _c.int
    ) -> cstring;
text_replace : proc "c" (
        text : cstring,
        replace : cstring,
        by : cstring
    ) -> cstring;
text_insert : proc "c" (
        text : cstring,
        insert : cstring,
        position : _c.int
    ) -> cstring;
text_join : proc "c" (
        text_list : ^cstring,
        count : _c.int,
        delimiter : cstring
    ) -> cstring;
text_split : proc "c" (
        text : cstring,
        delimiter : _c.char,
        count : ^_c.int
    ) -> ^cstring;
text_append : proc "c" (
        text : cstring,
        append : cstring,
        position : ^_c.int
    );
text_find_index : proc "c" (
        text : cstring,
        find : cstring
    ) -> _c.int;
text_to_upper : proc "c" (text : cstring) -> cstring;
text_to_lower : proc "c" (text : cstring) -> cstring;
text_to_pascal : proc "c" (text : cstring) -> cstring;
text_to_integer : proc "c" (text : cstring) -> _c.int;
draw_line_3d : proc "c" (
        start_pos : Vector3,
        end_pos : Vector3,
        color : Color
    );
draw_circle_3d : proc "c" (
        center : Vector3,
        radius : _c.float,
        rotation_axis : Vector3,
        rotation_angle : _c.float,
        color : Color
    );
draw_cube : proc "c" (
        position : Vector3,
        width : _c.float,
        height : _c.float,
        length : _c.float,
        color : Color
    );
draw_cube_v : proc "c" (
        position : Vector3,
        size : Vector3,
        color : Color
    );
draw_cube_wires : proc "c" (
        position : Vector3,
        width : _c.float,
        height : _c.float,
        length : _c.float,
        color : Color
    );
draw_cube_wires_v : proc "c" (
        position : Vector3,
        size : Vector3,
        color : Color
    );
draw_cube_texture : proc "c" (
        texture : Texture2D,
        position : Vector3,
        width : _c.float,
        height : _c.float,
        length : _c.float,
        color : Color
    );
draw_sphere : proc "c" (
        center_pos : Vector3,
        radius : _c.float,
        color : Color
    );
draw_sphere_ex : proc "c" (
        center_pos : Vector3,
        radius : _c.float,
        rings : _c.int,
        slices : _c.int,
        color : Color
    );
draw_sphere_wires : proc "c" (
        center_pos : Vector3,
        radius : _c.float,
        rings : _c.int,
        slices : _c.int,
        color : Color
    );
draw_cylinder : proc "c" (
        position : Vector3,
        radius_top : _c.float,
        radius_bottom : _c.float,
        height : _c.float,
        slices : _c.int,
        color : Color
    );
draw_cylinder_wires : proc "c" (
        position : Vector3,
        radius_top : _c.float,
        radius_bottom : _c.float,
        height : _c.float,
        slices : _c.int,
        color : Color
    );
draw_plane : proc "c" (
        center_pos : Vector3,
        size : Vector2,
        color : Color
    );
draw_ray : proc "c" (
        ray : Ray,
        color : Color
    );
draw_grid : proc "c" (
        slices : _c.int,
        spacing : _c.float
    );
draw_gizmo : proc "c" (position : Vector3);
load_model : proc "c" (file_name : cstring) -> Model;
load_model_from_mesh : proc "c" (mesh : Mesh) -> Model;
unload_model : proc "c" (model : Model);
load_mesh : proc "c" (file_name : cstring) -> Mesh;
unload_mesh : proc "c" (mesh : ^Mesh);
export_mesh : proc "c" (
        mesh : Mesh,
        file_name : cstring
    );
mesh_bounding_box : proc "c" (mesh : Mesh) -> BoundingBox;
mesh_tangents : proc "c" (mesh : ^Mesh);
mesh_binormals : proc "c" (mesh : ^Mesh);
gen_mesh_poly : proc "c" (
        sides : _c.int,
        radius : _c.float
    ) -> Mesh;
gen_mesh_plane : proc "c" (
        width : _c.float,
        length : _c.float,
        res_x : _c.int,
        res_z : _c.int
    ) -> Mesh;
gen_mesh_cube : proc "c" (
        width : _c.float,
        height : _c.float,
        length : _c.float
    ) -> Mesh;
gen_mesh_sphere : proc "c" (
        radius : _c.float,
        rings : _c.int,
        slices : _c.int
    ) -> Mesh;
gen_mesh_hemi_sphere : proc "c" (
        radius : _c.float,
        rings : _c.int,
        slices : _c.int
    ) -> Mesh;
gen_mesh_cylinder : proc "c" (
        radius : _c.float,
        height : _c.float,
        slices : _c.int
    ) -> Mesh;
gen_mesh_torus : proc "c" (
        radius : _c.float,
        size : _c.float,
        rad_seg : _c.int,
        sides : _c.int
    ) -> Mesh;
gen_mesh_knot : proc "c" (
        radius : _c.float,
        size : _c.float,
        rad_seg : _c.int,
        sides : _c.int
    ) -> Mesh;
gen_mesh_heightmap : proc "c" (
        heightmap : Image,
        size : Vector3
    ) -> Mesh;
gen_mesh_cubicmap : proc "c" (
        cubicmap : Image,
        cube_size : Vector3
    ) -> Mesh;
load_material : proc "c" (file_name : cstring) -> Material;
load_material_default : proc "c" () -> Material;
unload_material : proc "c" (material : Material);
draw_model : proc "c" (
        model : Model,
        position : Vector3,
        scale : _c.float,
        tint : Color
    );
draw_model_ex : proc "c" (
        model : Model,
        position : Vector3,
        rotation_axis : Vector3,
        rotation_angle : _c.float,
        scale : Vector3,
        tint : Color
    );
draw_model_wires : proc "c" (
        model : Model,
        position : Vector3,
        scale : _c.float,
        tint : Color
    );
draw_model_wires_ex : proc "c" (
        model : Model,
        position : Vector3,
        rotation_axis : Vector3,
        rotation_angle : _c.float,
        scale : Vector3,
        tint : Color
    );
draw_bounding_box : proc "c" (
        box : BoundingBox,
        color : Color
    );
draw_billboard : proc "c" (
        camera : Camera,
        texture : Texture2D,
        center : Vector3,
        size : _c.float,
        tint : Color
    );
draw_billboard_rec : proc "c" (
        camera : Camera,
        texture : Texture2D,
        source_rec : Rectangle,
        center : Vector3,
        size : _c.float,
        tint : Color
    );
check_collision_spheres : proc "c" (
        center_a : Vector3,
        radius_a : _c.float,
        center_b : Vector3,
        radius_b : _c.float
    ) -> bool;
check_collision_boxes : proc "c" (
        box1 : BoundingBox,
        box2 : BoundingBox
    ) -> bool;
check_collision_box_sphere : proc "c" (
        box : BoundingBox,
        center_sphere : Vector3,
        radius_sphere : _c.float
    ) -> bool;
check_collision_ray_sphere : proc "c" (
        ray : Ray,
        sphere_position : Vector3,
        sphere_radius : _c.float
    ) -> bool;
check_collision_ray_sphere_ex : proc "c" (
        ray : Ray,
        sphere_position : Vector3,
        sphere_radius : _c.float,
        collision_point : ^Vector3
    ) -> bool;
check_collision_ray_box : proc "c" (
        ray : Ray,
        box : BoundingBox
    ) -> bool;
get_collision_ray_model : proc "c" (
        ray : Ray,
        model : ^Model
    ) -> RayHitInfo;
get_collision_ray_triangle : proc "c" (
        ray : Ray,
        p1 : Vector3,
        p2 : Vector3,
        p3 : Vector3
    ) -> RayHitInfo;
get_collision_ray_ground : proc "c" (
        ray : Ray,
        ground_height : _c.float
    ) -> RayHitInfo;
load_text : proc "c" (file_name : cstring) -> cstring;
load_shader : proc "c" (
        vs_file_name : cstring,
        fs_file_name : cstring
    ) -> Shader;
load_shader_code : proc "c" (
        vs_code : cstring,
        fs_code : cstring
    ) -> Shader;
unload_shader : proc "c" (shader : Shader);
get_shader_default : proc "c" () -> Shader;
get_texture_default : proc "c" () -> Texture2D;
get_shader_location : proc "c" (
        shader : Shader,
        uniform_name : cstring
    ) -> _c.int;
set_shader_value : proc "c" (
        shader : Shader,
        uniform_loc : _c.int,
        value : rawptr,
        uniform_type : _c.int
    );
set_shader_value_v : proc "c" (
        shader : Shader,
        uniform_loc : _c.int,
        value : rawptr,
        uniform_type : _c.int,
        count : _c.int
    );
set_shader_value_matrix : proc "c" (
        shader : Shader,
        uniform_loc : _c.int,
        mat : Matrix
    );
set_matrix_projection : proc "c" (proj : Matrix);
set_matrix_modelview : proc "c" (view : Matrix);
get_matrix_modelview : proc "c" () -> Matrix;
gen_texture_cubemap : proc "c" (
        shader : Shader,
        sky_hdr : Texture2D,
        size : _c.int
    ) -> Texture2D;
gen_texture_irradiance : proc "c" (
        shader : Shader,
        cubemap : Texture2D,
        size : _c.int
    ) -> Texture2D;
gen_texture_prefilter : proc "c" (
        shader : Shader,
        cubemap : Texture2D,
        size : _c.int
    ) -> Texture2D;
gen_texture_brdf : proc "c" (
        shader : Shader,
        size : _c.int
    ) -> Texture2D;
begin_shader_mode : proc "c" (shader : Shader);
end_shader_mode : proc "c" ();
begin_blend_mode : proc "c" (mode : BlendMode);
end_blend_mode : proc "c" ();
begin_scissor_mode : proc "c" (
        x : _c.int,
        y : _c.int,
        width : _c.int,
        height : _c.int
    );
end_scissor_mode : proc "c" ();
get_vr_device_info : proc "c" (vr_device_type : _c.int) -> VrDeviceInfo;
init_vr_simulator : proc "c" (info : VrDeviceInfo);
update_vr_tracking : proc "c" (camera : ^Camera);
close_vr_simulator : proc "c" ();
is_vr_simulator_ready : proc "c" () -> bool;
toggle_vr_mode : proc "c" ();
begin_vr_drawing : proc "c" ();
end_vr_drawing : proc "c" ();
init_audio_device : proc "c" ();
close_audio_device : proc "c" ();
is_audio_device_ready : proc "c" () -> bool;
set_master_volume : proc "c" (volume : _c.float);
load_wave : proc "c" (file_name : cstring) -> Wave;
load_wave_ex : proc "c" (
        data : rawptr,
        sample_count : _c.int,
        sample_rate : _c.int,
        sample_size : _c.int,
        channels : _c.int
    ) -> Wave;
load_sound : proc "c" (file_name : cstring) -> Sound;
load_sound_from_wave : proc "c" (wave : Wave) -> Sound;
update_sound : proc "c" (
        sound : Sound,
        data : rawptr,
        samples_count : _c.int
    );
unload_wave : proc "c" (wave : Wave);
unload_sound : proc "c" (sound : Sound);
export_wave : proc "c" (
        wave : Wave,
        file_name : cstring
    );
export_wave_as_code : proc "c" (
        wave : Wave,
        file_name : cstring
    );
play_sound : proc "c" (sound : Sound);
pause_sound : proc "c" (sound : Sound);
resume_sound : proc "c" (sound : Sound);
stop_sound : proc "c" (sound : Sound);
is_sound_playing : proc "c" (sound : Sound) -> bool;
set_sound_volume : proc "c" (
        sound : Sound,
        volume : _c.float
    );
set_sound_pitch : proc "c" (
        sound : Sound,
        pitch : _c.float
    );
wave_format : proc "c" (
        wave : ^Wave,
        sample_rate : _c.int,
        sample_size : _c.int,
        channels : _c.int
    );
wave_copy : proc "c" (wave : Wave) -> Wave;
wave_crop : proc "c" (
        wave : ^Wave,
        init_sample : _c.int,
        final_sample : _c.int
    );
get_wave_data : proc "c" (wave : Wave) -> ^_c.float;
load_music_stream : proc "c" (file_name : cstring) -> Music;
unload_music_stream : proc "c" (music : Music);
play_music_stream : proc "c" (music : Music);
update_music_stream : proc "c" (music : Music);
stop_music_stream : proc "c" (music : Music);
pause_music_stream : proc "c" (music : Music);
resume_music_stream : proc "c" (music : Music);
is_music_playing : proc "c" (music : Music) -> bool;
set_music_volume : proc "c" (
        music : Music,
        volume : _c.float
    );
set_music_pitch : proc "c" (
        music : Music,
        pitch : _c.float
    );
set_music_loop_count : proc "c" (
        music : Music,
        count : _c.int
    );
get_music_time_length : proc "c" (music : Music) -> _c.float;
get_music_time_played : proc "c" (music : Music) -> _c.float;
init_audio_stream : proc "c" (
        sample_rate : _c.uint,
        sample_size : _c.uint,
        channels : _c.uint
    ) -> AudioStream;
update_audio_stream : proc "c" (
        stream : AudioStream,
        data : rawptr,
        samples_count : _c.int
    );
close_audio_stream : proc "c" (stream : AudioStream);
is_audio_buffer_processed : proc "c" (stream : AudioStream) -> bool;
play_audio_stream : proc "c" (stream : AudioStream);
pause_audio_stream : proc "c" (stream : AudioStream);
resume_audio_stream : proc "c" (stream : AudioStream);
is_audio_stream_playing : proc "c" (stream : AudioStream) -> bool;
stop_audio_stream : proc "c" (stream : AudioStream);
set_audio_stream_volume : proc "c" (
        stream : AudioStream,
        volume : _c.float
    );
set_audio_stream_pitch : proc "c" (
        stream : AudioStream,
        pitch : _c.float
    );
