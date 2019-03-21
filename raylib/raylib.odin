package raylib

foreign import "raylib.lib"

import _c "core:c"

RAYLIB_H :: 1;
PI :: 3.142;
DEG2RAD :: 0.017;
RAD2DEG :: 57.296;
MAX_TOUCH_POINTS :: 10;
MAX_SHADER_LOCATIONS :: 32;
MAX_MATERIAL_MAPS :: 12;
LIGHTGRAY := Color { 200, 200, 200, 255 };
GRAY := Color { 130, 130, 130, 255 };
DARKGRAY := Color { 80, 80, 80, 255 };
YELLOW := Color { 253, 249, 0, 255 };
GOLD := Color { 255, 203, 0, 255 };
ORANGE := Color { 255, 161, 0, 255 };
PINK := Color { 255, 109, 194, 255 };
RED := Color { 230, 41, 55, 255 };
MAROON := Color { 190, 33, 55, 255 };
GREEN := Color { 0, 228, 48, 255 };
LIME := Color { 0, 158, 47, 255 };
DARKGREEN := Color { 0, 117, 44, 255 };
SKYBLUE := Color { 102, 191, 255, 255 };
BLUE := Color { 0, 121, 241, 255 };
DARKBLUE := Color { 0, 82, 172, 255 };
PURPLE := Color { 200, 122, 255, 255 };
VIOLET := Color { 135, 60, 190, 255 };
DARKPURPLE := Color { 112, 31, 126, 255 };
BEIGE := Color { 211, 176, 131, 255 };
BROWN := Color { 127, 106, 79, 255 };
DARKBROWN := Color { 76, 63, 47, 255 };
WHITE := Color { 255, 255, 255, 255 };
BLACK := Color { 0, 0, 0, 255 };
BLANK := Color { 0, 0, 0, 0 };
MAGENTA := Color { 255, 0, 255, 255 };
RAYWHITE := Color { 245, 245, 245, 255 };
SpriteFont :: Font;
Camera :: Camera3D;
LOC_MAP_DIFFUSE :: 14;
LOC_MAP_SPECULAR :: 15;
MAP_DIFFUSE :: 0;
MAP_SPECULAR :: 1;

Quaternion :: Vector4;
Texture :: Texture2D;
TextureCubemap :: Texture2D;
RenderTexture :: RenderTexture2D;
Music :: ^MusicData;
ConfigFlag :: AnonymousEnum0;
TraceLogType :: AnonymousEnum1;
KeyboardKey :: AnonymousEnum2;
AndroidButton :: AnonymousEnum3;
MouseButton :: AnonymousEnum4;
GamepadNumber :: AnonymousEnum5;
GamepadPS3Button :: AnonymousEnum6;
GamepadPS3Axis :: AnonymousEnum7;
GamepadXbox360Button :: AnonymousEnum8;
GamepadXbox360Axis :: AnonymousEnum9;
GamepadAndroid :: AnonymousEnum10;
ShaderLocationIndex :: AnonymousEnum11;
ShaderUniformDataType :: AnonymousEnum12;
TexmapIndex :: AnonymousEnum13;
PixelFormat :: AnonymousEnum14;
TextureFilterMode :: AnonymousEnum15;
CubemapLayoutType :: AnonymousEnum16;
TextureWrapMode :: AnonymousEnum17;
FontType :: AnonymousEnum18;
BlendMode :: AnonymousEnum19;
GestureType :: AnonymousEnum20;
CameraMode :: AnonymousEnum21;
CameraType :: AnonymousEnum22;
VrDeviceType :: AnonymousEnum23;
NPatchType :: AnonymousEnum24;
TraceLogCallback :: #type proc();

AnonymousEnum0 :: enum i32 {
    FLAG_SHOW_LOGO = 1,
    FLAG_FULLSCREEN_MODE = 2,
    FLAG_WINDOW_RESIZABLE = 4,
    FLAG_WINDOW_UNDECORATED = 8,
    FLAG_WINDOW_TRANSPARENT = 16,
    FLAG_WINDOW_HIDDEN = 128,
    FLAG_MSAA_4X_HINT = 32,
    FLAG_VSYNC_HINT = 64,
};

AnonymousEnum1 :: enum i32 {
    LOG_ALL,
    LOG_TRACE,
    LOG_DEBUG,
    LOG_INFO,
    LOG_WARNING,
    LOG_ERROR,
    LOG_FATAL,
    LOG_NONE,
};

AnonymousEnum2 :: enum i32 {
    KEY_APOSTROPHE = 39,
    KEY_COMMA = 44,
    KEY_MINUS = 45,
    KEY_PERIOD = 46,
    KEY_SLASH = 47,
    KEY_ZERO = 48,
    KEY_ONE = 49,
    KEY_TWO = 50,
    KEY_THREE = 51,
    KEY_FOUR = 52,
    KEY_FIVE = 53,
    KEY_SIX = 54,
    KEY_SEVEN = 55,
    KEY_EIGHT = 56,
    KEY_NINE = 57,
    KEY_SEMICOLON = 59,
    KEY_EQUAL = 61,
    KEY_A = 65,
    KEY_B = 66,
    KEY_C = 67,
    KEY_D = 68,
    KEY_E = 69,
    KEY_F = 70,
    KEY_G = 71,
    KEY_H = 72,
    KEY_I = 73,
    KEY_J = 74,
    KEY_K = 75,
    KEY_L = 76,
    KEY_M = 77,
    KEY_N = 78,
    KEY_O = 79,
    KEY_P = 80,
    KEY_Q = 81,
    KEY_R = 82,
    KEY_S = 83,
    KEY_T = 84,
    KEY_U = 85,
    KEY_V = 86,
    KEY_W = 87,
    KEY_X = 88,
    KEY_Y = 89,
    KEY_Z = 90,
    KEY_SPACE = 32,
    KEY_ESCAPE = 256,
    KEY_ENTER = 257,
    KEY_TAB = 258,
    KEY_BACKSPACE = 259,
    KEY_INSERT = 260,
    KEY_DELETE = 261,
    KEY_RIGHT = 262,
    KEY_LEFT = 263,
    KEY_DOWN = 264,
    KEY_UP = 265,
    KEY_PAGE_UP = 266,
    KEY_PAGE_DOWN = 267,
    KEY_HOME = 268,
    KEY_END = 269,
    KEY_CAPS_LOCK = 280,
    KEY_SCROLL_LOCK = 281,
    KEY_NUM_LOCK = 282,
    KEY_PRINT_SCREEN = 283,
    KEY_PAUSE = 284,
    KEY_F1 = 290,
    KEY_F2 = 291,
    KEY_F3 = 292,
    KEY_F4 = 293,
    KEY_F5 = 294,
    KEY_F6 = 295,
    KEY_F7 = 296,
    KEY_F8 = 297,
    KEY_F9 = 298,
    KEY_F10 = 299,
    KEY_F11 = 300,
    KEY_F12 = 301,
    KEY_LEFT_SHIFT = 340,
    KEY_LEFT_CONTROL = 341,
    KEY_LEFT_ALT = 342,
    KEY_LEFT_SUPER = 343,
    KEY_RIGHT_SHIFT = 344,
    KEY_RIGHT_CONTROL = 345,
    KEY_RIGHT_ALT = 346,
    KEY_RIGHT_SUPER = 347,
    KEY_KB_MENU = 348,
    KEY_LEFT_BRACKET = 91,
    KEY_BACKSLASH = 92,
    KEY_RIGHT_BRACKET = 93,
    KEY_GRAVE = 96,
    KEY_KP_0 = 320,
    KEY_KP_1 = 321,
    KEY_KP_2 = 322,
    KEY_KP_3 = 323,
    KEY_KP_4 = 324,
    KEY_KP_5 = 325,
    KEY_KP_6 = 326,
    KEY_KP_7 = 327,
    KEY_KP_8 = 328,
    KEY_KP_9 = 329,
    KEY_KP_DECIMAL = 330,
    KEY_KP_DIVIDE = 331,
    KEY_KP_MULTIPLY = 332,
    KEY_KP_SUBTRACT = 333,
    KEY_KP_ADD = 334,
    KEY_KP_ENTER = 335,
    KEY_KP_EQUAL = 336,
};

AnonymousEnum3 :: enum i32 {
    KEY_BACK = 4,
    KEY_MENU = 82,
    KEY_VOLUME_UP = 24,
    KEY_VOLUME_DOWN = 25,
};

AnonymousEnum4 :: enum i32 {
    MOUSE_LEFT_BUTTON = 0,
    MOUSE_RIGHT_BUTTON = 1,
    MOUSE_MIDDLE_BUTTON = 2,
};

AnonymousEnum5 :: enum i32 {
    GAMEPAD_PLAYER1 = 0,
    GAMEPAD_PLAYER2 = 1,
    GAMEPAD_PLAYER3 = 2,
    GAMEPAD_PLAYER4 = 3,
};

AnonymousEnum6 :: enum i32 {
    GAMEPAD_PS3_BUTTON_TRIANGLE = 0,
    GAMEPAD_PS3_BUTTON_CIRCLE = 1,
    GAMEPAD_PS3_BUTTON_CROSS = 2,
    GAMEPAD_PS3_BUTTON_SQUARE = 3,
    GAMEPAD_PS3_BUTTON_L1 = 6,
    GAMEPAD_PS3_BUTTON_R1 = 7,
    GAMEPAD_PS3_BUTTON_L2 = 4,
    GAMEPAD_PS3_BUTTON_R2 = 5,
    GAMEPAD_PS3_BUTTON_START = 8,
    GAMEPAD_PS3_BUTTON_SELECT = 9,
    GAMEPAD_PS3_BUTTON_PS = 12,
    GAMEPAD_PS3_BUTTON_UP = 24,
    GAMEPAD_PS3_BUTTON_RIGHT = 25,
    GAMEPAD_PS3_BUTTON_DOWN = 26,
    GAMEPAD_PS3_BUTTON_LEFT = 27,
};

AnonymousEnum7 :: enum i32 {
    GAMEPAD_PS3_AXIS_LEFT_X = 0,
    GAMEPAD_PS3_AXIS_LEFT_Y = 1,
    GAMEPAD_PS3_AXIS_RIGHT_X = 2,
    GAMEPAD_PS3_AXIS_RIGHT_Y = 5,
    GAMEPAD_PS3_AXIS_L2 = 3,
    GAMEPAD_PS3_AXIS_R2 = 4,
};

AnonymousEnum8 :: enum i32 {
    GAMEPAD_XBOX_BUTTON_A = 0,
    GAMEPAD_XBOX_BUTTON_B = 1,
    GAMEPAD_XBOX_BUTTON_X = 2,
    GAMEPAD_XBOX_BUTTON_Y = 3,
    GAMEPAD_XBOX_BUTTON_LB = 4,
    GAMEPAD_XBOX_BUTTON_RB = 5,
    GAMEPAD_XBOX_BUTTON_SELECT = 6,
    GAMEPAD_XBOX_BUTTON_START = 7,
    GAMEPAD_XBOX_BUTTON_HOME = 8,
    GAMEPAD_XBOX_BUTTON_UP = 10,
    GAMEPAD_XBOX_BUTTON_RIGHT = 11,
    GAMEPAD_XBOX_BUTTON_DOWN = 12,
    GAMEPAD_XBOX_BUTTON_LEFT = 13,
};

AnonymousEnum9 :: enum i32 {
    GAMEPAD_XBOX_AXIS_LEFT_X = 0,
    GAMEPAD_XBOX_AXIS_LEFT_Y = 1,
    GAMEPAD_XBOX_AXIS_RIGHT_X = 2,
    GAMEPAD_XBOX_AXIS_RIGHT_Y = 3,
    GAMEPAD_XBOX_AXIS_LT = 4,
    GAMEPAD_XBOX_AXIS_RT = 5,
};

AnonymousEnum10 :: enum i32 {
    GAMEPAD_ANDROID_DPAD_UP = 19,
    GAMEPAD_ANDROID_DPAD_DOWN = 20,
    GAMEPAD_ANDROID_DPAD_LEFT = 21,
    GAMEPAD_ANDROID_DPAD_RIGHT = 22,
    GAMEPAD_ANDROID_DPAD_CENTER = 23,
    GAMEPAD_ANDROID_BUTTON_A = 96,
    GAMEPAD_ANDROID_BUTTON_B = 97,
    GAMEPAD_ANDROID_BUTTON_C = 98,
    GAMEPAD_ANDROID_BUTTON_X = 99,
    GAMEPAD_ANDROID_BUTTON_Y = 100,
    GAMEPAD_ANDROID_BUTTON_Z = 101,
    GAMEPAD_ANDROID_BUTTON_L1 = 102,
    GAMEPAD_ANDROID_BUTTON_R1 = 103,
    GAMEPAD_ANDROID_BUTTON_L2 = 104,
    GAMEPAD_ANDROID_BUTTON_R2 = 105,
};

AnonymousEnum11 :: enum i32 {
    LOC_VERTEX_POSITION = 0,
    LOC_VERTEX_TEXCOORD01,
    LOC_VERTEX_TEXCOORD02,
    LOC_VERTEX_NORMAL,
    LOC_VERTEX_TANGENT,
    LOC_VERTEX_COLOR,
    LOC_MATRIX_MVP,
    LOC_MATRIX_MODEL,
    LOC_MATRIX_VIEW,
    LOC_MATRIX_PROJECTION,
    LOC_VECTOR_VIEW,
    LOC_COLOR_DIFFUSE,
    LOC_COLOR_SPECULAR,
    LOC_COLOR_AMBIENT,
    LOC_MAP_ALBEDO,
    LOC_MAP_METALNESS,
    LOC_MAP_NORMAL,
    LOC_MAP_ROUGHNESS,
    LOC_MAP_OCCLUSION,
    LOC_MAP_EMISSION,
    LOC_MAP_HEIGHT,
    LOC_MAP_CUBEMAP,
    LOC_MAP_IRRADIANCE,
    LOC_MAP_PREFILTER,
    LOC_MAP_BRDF,
};

AnonymousEnum12 :: enum i32 {
    UNIFORM_FLOAT = 0,
    UNIFORM_VEC2,
    UNIFORM_VEC3,
    UNIFORM_VEC4,
    UNIFORM_INT,
    UNIFORM_IVEC2,
    UNIFORM_IVEC3,
    UNIFORM_IVEC4,
    UNIFORM_SAMPLER2D,
};

AnonymousEnum13 :: enum i32 {
    MAP_ALBEDO = 0,
    MAP_METALNESS = 1,
    MAP_NORMAL = 2,
    MAP_ROUGHNESS = 3,
    MAP_OCCLUSION,
    MAP_EMISSION,
    MAP_HEIGHT,
    MAP_CUBEMAP,
    MAP_IRRADIANCE,
    MAP_PREFILTER,
    MAP_BRDF,
};

AnonymousEnum14 :: enum i32 {
    UNCOMPRESSED_GRAYSCALE = 1,
    UNCOMPRESSED_GRAY_ALPHA,
    UNCOMPRESSED_R5G6B5,
    UNCOMPRESSED_R8G8B8,
    UNCOMPRESSED_R5G5B5A1,
    UNCOMPRESSED_R4G4B4A4,
    UNCOMPRESSED_R8G8B8A8,
    UNCOMPRESSED_R32,
    UNCOMPRESSED_R32G32B32,
    UNCOMPRESSED_R32G32B32A32,
    COMPRESSED_DXT1_RGB,
    COMPRESSED_DXT1_RGBA,
    COMPRESSED_DXT3_RGBA,
    COMPRESSED_DXT5_RGBA,
    COMPRESSED_ETC1_RGB,
    COMPRESSED_ETC2_RGB,
    COMPRESSED_ETC2_EAC_RGBA,
    COMPRESSED_PVRT_RGB,
    COMPRESSED_PVRT_RGBA,
    COMPRESSED_ASTC_4x4_RGBA,
    COMPRESSED_ASTC_8x8_RGBA,
};

AnonymousEnum15 :: enum i32 {
    FILTER_POINT = 0,
    FILTER_BILINEAR,
    FILTER_TRILINEAR,
    FILTER_ANISOTROPIC_4X,
    FILTER_ANISOTROPIC_8X,
    FILTER_ANISOTROPIC_16X,
};

AnonymousEnum16 :: enum i32 {
    CUBEMAP_AUTO_DETECT = 0,
    CUBEMAP_LINE_VERTICAL,
    CUBEMAP_LINE_HORIZONTAL,
    CUBEMAP_CROSS_THREE_BY_FOUR,
    CUBEMAP_CROSS_FOUR_BY_THREE,
    CUBEMAP_PANORAMA,
};

AnonymousEnum17 :: enum i32 {
    WRAP_REPEAT = 0,
    WRAP_CLAMP,
    WRAP_MIRROR_REPEAT,
    WRAP_MIRROR_CLAMP,
};

AnonymousEnum18 :: enum i32 {
    FONT_DEFAULT = 0,
    FONT_BITMAP,
    FONT_SDF,
};

AnonymousEnum19 :: enum i32 {
    BLEND_ALPHA = 0,
    BLEND_ADDITIVE,
    BLEND_MULTIPLIED,
};

AnonymousEnum20 :: enum i32 {
    GESTURE_NONE = 0,
    GESTURE_TAP = 1,
    GESTURE_DOUBLETAP = 2,
    GESTURE_HOLD = 4,
    GESTURE_DRAG = 8,
    GESTURE_SWIPE_RIGHT = 16,
    GESTURE_SWIPE_LEFT = 32,
    GESTURE_SWIPE_UP = 64,
    GESTURE_SWIPE_DOWN = 128,
    GESTURE_PINCH_IN = 256,
    GESTURE_PINCH_OUT = 512,
};

AnonymousEnum21 :: enum i32 {
    CAMERA_CUSTOM = 0,
    CAMERA_FREE,
    CAMERA_ORBITAL,
    CAMERA_FIRST_PERSON,
    CAMERA_THIRD_PERSON,
};

AnonymousEnum22 :: enum i32 {
    CAMERA_PERSPECTIVE = 0,
    CAMERA_ORTHOGRAPHIC,
};

AnonymousEnum23 :: enum i32 {
    HMD_DEFAULT_DEVICE = 0,
    HMD_OCULUS_RIFT_DK2,
    HMD_OCULUS_RIFT_CV1,
    HMD_OCULUS_GO,
    HMD_VALVE_HTC_VIVE,
    HMD_SONY_PSVR,
};

AnonymousEnum24 :: enum i32 {
    NPT_9PATCH = 0,
    NPT_3PATCH_VERTICAL,
    NPT_3PATCH_HORIZONTAL,
};

Vector2 :: struct #packed {
    x : _c.float,
    y : _c.float,
};

Vector3 :: struct #packed {
    x : _c.float,
    y : _c.float,
    z : _c.float,
};

Vector4 :: struct #packed {
    x : _c.float,
    y : _c.float,
    z : _c.float,
    w : _c.float,
};

Matrix :: struct #packed {
    m0 : _c.float,
    m1 : _c.float,
    m2 : _c.float,
    m3 : _c.float,
    m4 : _c.float,
    m5 : _c.float,
    m6 : _c.float,
    m7 : _c.float,
    m8 : _c.float,
    m9 : _c.float,
    m10 : _c.float,
    m11 : _c.float,
    m12 : _c.float,
    m13 : _c.float,
    m14 : _c.float,
    m15 : _c.float,
};

Color :: struct #packed {
    r : _c.uchar,
    g : _c.uchar,
    b : _c.uchar,
    a : _c.uchar,
};

Rectangle :: struct #packed {
    x : _c.float,
    y : _c.float,
    width : _c.float,
    height : _c.float,
};

Image :: struct #packed {
    data : rawptr,
    width : _c.int,
    height : _c.int,
    mipmaps : _c.int,
    format : _c.int,
};

Texture2D :: struct #packed {
    id : _c.uint,
    width : _c.int,
    height : _c.int,
    mipmaps : _c.int,
    format : _c.int,
};

RenderTexture2D :: struct #packed {
    id : _c.uint,
    texture : Texture2D,
    depth : Texture2D,
    depth_texture : bool,
};

NPatchInfo :: struct #packed {
    source_rec : Rectangle,
    left : _c.int,
    top : _c.int,
    right : _c.int,
    bottom : _c.int,
    type : _c.int,
};

CharInfo :: struct #packed {
    value : _c.int,
    rec : Rectangle,
    offset_x : _c.int,
    offset_y : _c.int,
    advance_x : _c.int,
    data : ^_c.uchar,
};

Font :: struct #packed {
    texture : Texture2D,
    base_size : _c.int,
    chars_count : _c.int,
    chars : ^CharInfo,
};

Camera3D :: struct #packed {
    position : Vector3,
    target : Vector3,
    up : Vector3,
    fovy : _c.float,
    type : _c.int,
};

Camera2D :: struct #packed {
    offset : Vector2,
    target : Vector2,
    rotation : _c.float,
    zoom : _c.float,
};

BoundingBox :: struct #packed {
    min : Vector3,
    max : Vector3,
};

Mesh :: struct #packed {
    vertex_count : _c.int,
    triangle_count : _c.int,
    vertices : ^_c.float,
    texcoords : ^_c.float,
    texcoords2 : ^_c.float,
    normals : ^_c.float,
    tangents : ^_c.float,
    colors : ^_c.uchar,
    indices : ^_c.ushort,
    base_vertices : ^_c.float,
    base_normals : ^_c.float,
    weight_bias : ^_c.float,
    weight_id : ^_c.int,
    vao_id : _c.uint,
    vbo_id : [7]_c.uint,
};

Shader :: struct #packed {
    id : _c.uint,
    locs : [32]_c.int,
};

MaterialMap :: struct #packed {
    texture : Texture2D,
    color : Color,
    value : _c.float,
};

Material :: struct #packed {
    shader : Shader,
    maps : [12]MaterialMap,
    params : ^_c.float,
};

Model :: struct #packed {
    mesh : Mesh,
    transform : Matrix,
    material : Material,
};

Ray :: struct #packed {
    position : Vector3,
    direction : Vector3,
};

RayHitInfo :: struct #packed {
    hit : bool,
    distance : _c.float,
    position : Vector3,
    normal : Vector3,
};

Wave :: struct #packed {
    sample_count : _c.uint,
    sample_rate : _c.uint,
    sample_size : _c.uint,
    channels : _c.uint,
    data : rawptr,
};

Sound :: struct #packed {
    audio_buffer : rawptr,
    source : _c.uint,
    buffer : _c.uint,
    format : _c.int,
};

MusicData :: struct #packed {};

AudioStream :: struct #packed {
    sample_rate : _c.uint,
    sample_size : _c.uint,
    channels : _c.uint,
    audio_buffer : rawptr,
    format : _c.int,
    source : _c.uint,
    buffers : [2]_c.uint,
};

VrDeviceInfo :: struct #packed {
    h_resolution : _c.int,
    v_resolution : _c.int,
    h_screen_size : _c.float,
    v_screen_size : _c.float,
    v_screen_center : _c.float,
    eye_to_screen_distance : _c.float,
    lens_separation_distance : _c.float,
    interpupillary_distance : _c.float,
    lens_distortion_values : [4]_c.float,
    chroma_ab_correction : [4]_c.float,
};

VrStereoConfig :: struct #packed {
    stereo_fbo : RenderTexture2D,
    distortion_shader : Shader,
    eyes_projection : [2]Matrix,
    eyes_view_offset : [2]Matrix,
    eye_viewport_right : [4]_c.int,
    eye_viewport_left : [4]_c.int,
};

@(default_calling_convention="c")
foreign raylib {

    @(link_name="InitWindow")
    init_window :: proc(
        width : _c.int,
        height : _c.int,
        title : cstring
    ) ---;

    @(link_name="WindowShouldClose")
    window_should_close :: proc() -> bool ---;

    @(link_name="CloseWindow")
    close_window :: proc() ---;

    @(link_name="IsWindowReady")
    is_window_ready :: proc() -> bool ---;

    @(link_name="IsWindowMinimized")
    is_window_minimized :: proc() -> bool ---;

    @(link_name="IsWindowResized")
    is_window_resized :: proc() -> bool ---;

    @(link_name="IsWindowHidden")
    is_window_hidden :: proc() -> bool ---;

    @(link_name="ToggleFullscreen")
    toggle_fullscreen :: proc() ---;

    @(link_name="UnhideWindow")
    unhide_window :: proc() ---;

    @(link_name="HideWindow")
    hide_window :: proc() ---;

    @(link_name="SetWindowIcon")
    set_window_icon :: proc(image : Image) ---;

    @(link_name="SetWindowTitle")
    set_window_title :: proc(title : cstring) ---;

    @(link_name="SetWindowPosition")
    set_window_position :: proc(
        x : _c.int,
        y : _c.int
    ) ---;

    @(link_name="SetWindowMonitor")
    set_window_monitor :: proc(monitor : _c.int) ---;

    @(link_name="SetWindowMinSize")
    set_window_min_size :: proc(
        width : _c.int,
        height : _c.int
    ) ---;

    @(link_name="SetWindowSize")
    set_window_size :: proc(
        width : _c.int,
        height : _c.int
    ) ---;

    @(link_name="GetWindowHandle")
    get_window_handle :: proc() -> rawptr ---;

    @(link_name="GetScreenWidth")
    get_screen_width :: proc() -> _c.int ---;

    @(link_name="GetScreenHeight")
    get_screen_height :: proc() -> _c.int ---;

    @(link_name="GetMonitorCount")
    get_monitor_count :: proc() -> _c.int ---;

    @(link_name="GetMonitorWidth")
    get_monitor_width :: proc(monitor : _c.int) -> _c.int ---;

    @(link_name="GetMonitorHeight")
    get_monitor_height :: proc(monitor : _c.int) -> _c.int ---;

    @(link_name="GetMonitorPhysicalWidth")
    get_monitor_physical_width :: proc(monitor : _c.int) -> _c.int ---;

    @(link_name="GetMonitorPhysicalHeight")
    get_monitor_physical_height :: proc(monitor : _c.int) -> _c.int ---;

    @(link_name="GetMonitorName")
    get_monitor_name :: proc(monitor : _c.int) -> cstring ---;

    @(link_name="GetClipboardText")
    get_clipboard_text :: proc() -> cstring ---;

    @(link_name="SetClipboardText")
    set_clipboard_text :: proc(text : cstring) ---;

    @(link_name="IsCursorHidden")
    is_cursor_hidden :: proc() -> bool ---;

    @(link_name="EnableCursor")
    enable_cursor :: proc() ---;

    @(link_name="DisableCursor")
    disable_cursor :: proc() ---;

    @(link_name="ClearBackground")
    clear_background :: proc(color : Color) ---;

    @(link_name="BeginDrawing")
    begin_drawing :: proc() ---;

    @(link_name="EndDrawing")
    end_drawing :: proc() ---;

    @(link_name="BeginMode2D")
    begin_mode2_d :: proc(camera : Camera2D) ---;

    @(link_name="EndMode2D")
    end_mode2_d :: proc() ---;

    @(link_name="BeginMode3D")
    begin_mode3_d :: proc(camera : Camera3D) ---;

    @(link_name="EndMode3D")
    end_mode3_d :: proc() ---;

    @(link_name="BeginTextureMode")
    begin_texture_mode :: proc(target : RenderTexture2D) ---;

    @(link_name="EndTextureMode")
    end_texture_mode :: proc() ---;

    @(link_name="GetMouseRay")
    get_mouse_ray :: proc(
        mouse_position : Vector2,
        camera : Camera
    ) -> Ray ---;

    @(link_name="GetWorldToScreen")
    get_world_to_screen :: proc(
        position : Vector3,
        camera : Camera
    ) -> Vector2 ---;

    @(link_name="GetCameraMatrix")
    get_camera_matrix :: proc(camera : Camera) -> Matrix ---;

    @(link_name="SetTargetFPS")
    set_target_fps :: proc(fps : _c.int) ---;

    @(link_name="GetFPS")
    get_fps :: proc() -> _c.int ---;

    @(link_name="GetFrameTime")
    get_frame_time :: proc() -> _c.float ---;

    @(link_name="GetTime")
    get_time :: proc() -> _c.double ---;

    @(link_name="ColorToInt")
    color_to_int :: proc(color : Color) -> _c.int ---;

    @(link_name="ColorNormalize")
    color_normalize :: proc(color : Color) -> Vector4 ---;

    @(link_name="ColorToHSV")
    color_to_hsv :: proc(color : Color) -> Vector3 ---;

    @(link_name="ColorFromHSV")
    color_from_hsv :: proc(hsv : Vector3) -> Color ---;

    @(link_name="GetColor")
    get_color :: proc(hex_value : _c.int) -> Color ---;

    @(link_name="Fade")
    fade :: proc(
        color : Color,
        alpha : _c.float
    ) -> Color ---;

    @(link_name="SetConfigFlags")
    set_config_flags :: proc(flags : _c.uchar) ---;

    @(link_name="SetTraceLogLevel")
    set_trace_log_level :: proc(log_type : _c.int) ---;

    @(link_name="SetTraceLogExit")
    set_trace_log_exit :: proc(log_type : _c.int) ---;

    @(link_name="SetTraceLogCallback")
    set_trace_log_callback :: proc(callback : TraceLogCallback) ---;

    @(link_name="TraceLog")
    trace_log :: proc(
        log_type : _c.int,
        text : cstring
    ) ---;

    @(link_name="TakeScreenshot")
    take_screenshot :: proc(file_name : cstring) ---;

    @(link_name="GetRandomValue")
    get_random_value :: proc(
        min : _c.int,
        max : _c.int
    ) -> _c.int ---;

    @(link_name="FileExists")
    file_exists :: proc(file_name : cstring) -> bool ---;

    @(link_name="IsFileExtension")
    is_file_extension :: proc(
        file_name : cstring,
        ext : cstring
    ) -> bool ---;

    @(link_name="GetExtension")
    get_extension :: proc(file_name : cstring) -> cstring ---;

    @(link_name="GetFileName")
    get_file_name :: proc(file_path : cstring) -> cstring ---;

    @(link_name="GetFileNameWithoutExt")
    get_file_name_without_ext :: proc(file_path : cstring) -> cstring ---;

    @(link_name="GetDirectoryPath")
    get_directory_path :: proc(file_name : cstring) -> cstring ---;

    @(link_name="GetWorkingDirectory")
    get_working_directory :: proc() -> cstring ---;

    @(link_name="GetDirectoryFiles")
    get_directory_files :: proc(
        dir_path : cstring,
        count : ^_c.int
    ) -> ^cstring ---;

    @(link_name="ClearDirectoryFiles")
    clear_directory_files :: proc() ---;

    @(link_name="ChangeDirectory")
    change_directory :: proc(dir : cstring) -> bool ---;

    @(link_name="IsFileDropped")
    is_file_dropped :: proc() -> bool ---;

    @(link_name="GetDroppedFiles")
    get_dropped_files :: proc(count : ^_c.int) -> ^cstring ---;

    @(link_name="ClearDroppedFiles")
    clear_dropped_files :: proc() ---;

    @(link_name="GetFileModTime")
    get_file_mod_time :: proc(file_name : cstring) -> _c.long ---;

    @(link_name="StorageSaveValue")
    storage_save_value :: proc(
        position : _c.int,
        value : _c.int
    ) ---;

    @(link_name="StorageLoadValue")
    storage_load_value :: proc(position : _c.int) -> _c.int ---;

    @(link_name="OpenURL")
    open_url :: proc(url : cstring) ---;

    @(link_name="IsKeyPressed")
    is_key_pressed :: proc(key : _c.int) -> bool ---;

    @(link_name="IsKeyDown")
    is_key_down :: proc(key : _c.int) -> bool ---;

    @(link_name="IsKeyReleased")
    is_key_released :: proc(key : _c.int) -> bool ---;

    @(link_name="IsKeyUp")
    is_key_up :: proc(key : _c.int) -> bool ---;

    @(link_name="GetKeyPressed")
    get_key_pressed :: proc() -> _c.int ---;

    @(link_name="SetExitKey")
    set_exit_key :: proc(key : _c.int) ---;

    @(link_name="IsGamepadAvailable")
    is_gamepad_available :: proc(gamepad : _c.int) -> bool ---;

    @(link_name="IsGamepadName")
    is_gamepad_name :: proc(
        gamepad : _c.int,
        name : cstring
    ) -> bool ---;

    @(link_name="GetGamepadName")
    get_gamepad_name :: proc(gamepad : _c.int) -> cstring ---;

    @(link_name="IsGamepadButtonPressed")
    is_gamepad_button_pressed :: proc(
        gamepad : _c.int,
        button : _c.int
    ) -> bool ---;

    @(link_name="IsGamepadButtonDown")
    is_gamepad_button_down :: proc(
        gamepad : _c.int,
        button : _c.int
    ) -> bool ---;

    @(link_name="IsGamepadButtonReleased")
    is_gamepad_button_released :: proc(
        gamepad : _c.int,
        button : _c.int
    ) -> bool ---;

    @(link_name="IsGamepadButtonUp")
    is_gamepad_button_up :: proc(
        gamepad : _c.int,
        button : _c.int
    ) -> bool ---;

    @(link_name="GetGamepadButtonPressed")
    get_gamepad_button_pressed :: proc() -> _c.int ---;

    @(link_name="GetGamepadAxisCount")
    get_gamepad_axis_count :: proc(gamepad : _c.int) -> _c.int ---;

    @(link_name="GetGamepadAxisMovement")
    get_gamepad_axis_movement :: proc(
        gamepad : _c.int,
        axis : _c.int
    ) -> _c.float ---;

    @(link_name="IsMouseButtonPressed")
    is_mouse_button_pressed :: proc(button : _c.int) -> bool ---;

    @(link_name="IsMouseButtonDown")
    is_mouse_button_down :: proc(button : _c.int) -> bool ---;

    @(link_name="IsMouseButtonReleased")
    is_mouse_button_released :: proc(button : _c.int) -> bool ---;

    @(link_name="IsMouseButtonUp")
    is_mouse_button_up :: proc(button : _c.int) -> bool ---;

    @(link_name="GetMouseX")
    get_mouse_x :: proc() -> _c.int ---;

    @(link_name="GetMouseY")
    get_mouse_y :: proc() -> _c.int ---;

    @(link_name="GetMousePosition")
    get_mouse_position :: proc() -> Vector2 ---;

    @(link_name="SetMousePosition")
    set_mouse_position :: proc(
        x : _c.int,
        y : _c.int
    ) ---;

    @(link_name="SetMouseOffset")
    set_mouse_offset :: proc(
        offset_x : _c.int,
        offset_y : _c.int
    ) ---;

    @(link_name="SetMouseScale")
    set_mouse_scale :: proc(
        scale_x : _c.float,
        scale_y : _c.float
    ) ---;

    @(link_name="GetMouseWheelMove")
    get_mouse_wheel_move :: proc() -> _c.int ---;

    @(link_name="GetTouchX")
    get_touch_x :: proc() -> _c.int ---;

    @(link_name="GetTouchY")
    get_touch_y :: proc() -> _c.int ---;

    @(link_name="GetTouchPosition")
    get_touch_position :: proc(index : _c.int) -> Vector2 ---;

    @(link_name="SetGesturesEnabled")
    set_gestures_enabled :: proc(gesture_flags : _c.uint) ---;

    @(link_name="IsGestureDetected")
    is_gesture_detected :: proc(gesture : _c.int) -> bool ---;

    @(link_name="GetGestureDetected")
    get_gesture_detected :: proc() -> _c.int ---;

    @(link_name="GetTouchPointsCount")
    get_touch_points_count :: proc() -> _c.int ---;

    @(link_name="GetGestureHoldDuration")
    get_gesture_hold_duration :: proc() -> _c.float ---;

    @(link_name="GetGestureDragVector")
    get_gesture_drag_vector :: proc() -> Vector2 ---;

    @(link_name="GetGestureDragAngle")
    get_gesture_drag_angle :: proc() -> _c.float ---;

    @(link_name="GetGesturePinchVector")
    get_gesture_pinch_vector :: proc() -> Vector2 ---;

    @(link_name="GetGesturePinchAngle")
    get_gesture_pinch_angle :: proc() -> _c.float ---;

    @(link_name="SetCameraMode")
    set_camera_mode :: proc(
        camera : Camera,
        mode : _c.int
    ) ---;

    @(link_name="UpdateCamera")
    update_camera :: proc(camera : ^Camera) ---;

    @(link_name="SetCameraPanControl")
    set_camera_pan_control :: proc(pan_key : _c.int) ---;

    @(link_name="SetCameraAltControl")
    set_camera_alt_control :: proc(alt_key : _c.int) ---;

    @(link_name="SetCameraSmoothZoomControl")
    set_camera_smooth_zoom_control :: proc(sz_key : _c.int) ---;

    @(link_name="SetCameraMoveControls")
    set_camera_move_controls :: proc(
        front_key : _c.int,
        back_key : _c.int,
        right_key : _c.int,
        left_key : _c.int,
        up_key : _c.int,
        down_key : _c.int
    ) ---;

    @(link_name="DrawPixel")
    draw_pixel :: proc(
        pos_x : _c.int,
        pos_y : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawPixelV")
    draw_pixel_v :: proc(
        position : Vector2,
        color : Color
    ) ---;

    @(link_name="DrawLine")
    draw_line :: proc(
        start_pos_x : _c.int,
        start_pos_y : _c.int,
        end_pos_x : _c.int,
        end_pos_y : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawLineV")
    draw_line_v :: proc(
        start_pos : Vector2,
        end_pos : Vector2,
        color : Color
    ) ---;

    @(link_name="DrawLineEx")
    draw_line_ex :: proc(
        start_pos : Vector2,
        end_pos : Vector2,
        thick : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawLineBezier")
    draw_line_bezier :: proc(
        start_pos : Vector2,
        end_pos : Vector2,
        thick : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawCircle")
    draw_circle :: proc(
        center_x : _c.int,
        center_y : _c.int,
        radius : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawCircleSector")
    draw_circle_sector :: proc(
        center : Vector2,
        radius : _c.float,
        start_angle : _c.int,
        end_angle : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawCircleGradient")
    draw_circle_gradient :: proc(
        center_x : _c.int,
        center_y : _c.int,
        radius : _c.float,
        color1 : Color,
        color2 : Color
    ) ---;

    @(link_name="DrawCircleV")
    draw_circle_v :: proc(
        center : Vector2,
        radius : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawCircleLines")
    draw_circle_lines :: proc(
        center_x : _c.int,
        center_y : _c.int,
        radius : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawRectangle")
    draw_rectangle :: proc(
        pos_x : _c.int,
        pos_y : _c.int,
        width : _c.int,
        height : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawRectangleV")
    draw_rectangle_v :: proc(
        position : Vector2,
        size : Vector2,
        color : Color
    ) ---;

    @(link_name="DrawRectangleRec")
    draw_rectangle_rec :: proc(
        rec : Rectangle,
        color : Color
    ) ---;

    @(link_name="DrawRectanglePro")
    draw_rectangle_pro :: proc(
        rec : Rectangle,
        origin : Vector2,
        rotation : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawRectangleGradientV")
    draw_rectangle_gradient_v :: proc(
        pos_x : _c.int,
        pos_y : _c.int,
        width : _c.int,
        height : _c.int,
        color1 : Color,
        color2 : Color
    ) ---;

    @(link_name="DrawRectangleGradientH")
    draw_rectangle_gradient_h :: proc(
        pos_x : _c.int,
        pos_y : _c.int,
        width : _c.int,
        height : _c.int,
        color1 : Color,
        color2 : Color
    ) ---;

    @(link_name="DrawRectangleGradientEx")
    draw_rectangle_gradient_ex :: proc(
        rec : Rectangle,
        col1 : Color,
        col2 : Color,
        col3 : Color,
        col4 : Color
    ) ---;

    @(link_name="DrawRectangleLines")
    draw_rectangle_lines :: proc(
        pos_x : _c.int,
        pos_y : _c.int,
        width : _c.int,
        height : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawRectangleLinesEx")
    draw_rectangle_lines_ex :: proc(
        rec : Rectangle,
        line_thick : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawTriangle")
    draw_triangle :: proc(
        v1 : Vector2,
        v2 : Vector2,
        v3 : Vector2,
        color : Color
    ) ---;

    @(link_name="DrawTriangleLines")
    draw_triangle_lines :: proc(
        v1 : Vector2,
        v2 : Vector2,
        v3 : Vector2,
        color : Color
    ) ---;

    @(link_name="DrawPoly")
    draw_poly :: proc(
        center : Vector2,
        sides : _c.int,
        radius : _c.float,
        rotation : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawPolyEx")
    draw_poly_ex :: proc(
        points : ^Vector2,
        num_points : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawPolyExLines")
    draw_poly_ex_lines :: proc(
        points : ^Vector2,
        num_points : _c.int,
        color : Color
    ) ---;

    @(link_name="SetShapesTexture")
    set_shapes_texture :: proc(
        texture : Texture2D,
        source : Rectangle
    ) ---;

    @(link_name="CheckCollisionRecs")
    check_collision_recs :: proc(
        rec1 : Rectangle,
        rec2 : Rectangle
    ) -> bool ---;

    @(link_name="CheckCollisionCircles")
    check_collision_circles :: proc(
        center1 : Vector2,
        radius1 : _c.float,
        center2 : Vector2,
        radius2 : _c.float
    ) -> bool ---;

    @(link_name="CheckCollisionCircleRec")
    check_collision_circle_rec :: proc(
        center : Vector2,
        radius : _c.float,
        rec : Rectangle
    ) -> bool ---;

    @(link_name="GetCollisionRec")
    get_collision_rec :: proc(
        rec1 : Rectangle,
        rec2 : Rectangle
    ) -> Rectangle ---;

    @(link_name="CheckCollisionPointRec")
    check_collision_point_rec :: proc(
        point : Vector2,
        rec : Rectangle
    ) -> bool ---;

    @(link_name="CheckCollisionPointCircle")
    check_collision_point_circle :: proc(
        point : Vector2,
        center : Vector2,
        radius : _c.float
    ) -> bool ---;

    @(link_name="CheckCollisionPointTriangle")
    check_collision_point_triangle :: proc(
        point : Vector2,
        p1 : Vector2,
        p2 : Vector2,
        p3 : Vector2
    ) -> bool ---;

    @(link_name="LoadImage")
    load_image :: proc(file_name : cstring) -> Image ---;

    @(link_name="LoadImageEx")
    load_image_ex :: proc(
        pixels : ^Color,
        width : _c.int,
        height : _c.int
    ) -> Image ---;

    @(link_name="LoadImagePro")
    load_image_pro :: proc(
        data : rawptr,
        width : _c.int,
        height : _c.int,
        format : _c.int
    ) -> Image ---;

    @(link_name="LoadImageRaw")
    load_image_raw :: proc(
        file_name : cstring,
        width : _c.int,
        height : _c.int,
        format : _c.int,
        header_size : _c.int
    ) -> Image ---;

    @(link_name="ExportImage")
    export_image :: proc(
        image : Image,
        file_name : cstring
    ) ---;

    @(link_name="ExportImageAsCode")
    export_image_as_code :: proc(
        image : Image,
        file_name : cstring
    ) ---;

    @(link_name="LoadTexture")
    load_texture :: proc(file_name : cstring) -> Texture2D ---;

    @(link_name="LoadTextureFromImage")
    load_texture_from_image :: proc(image : Image) -> Texture2D ---;

    @(link_name="LoadTextureCubemap")
    load_texture_cubemap :: proc(
        image : Image,
        layout_type : _c.int
    ) -> TextureCubemap ---;

    @(link_name="LoadRenderTexture")
    load_render_texture :: proc(
        width : _c.int,
        height : _c.int
    ) -> RenderTexture2D ---;

    @(link_name="UnloadImage")
    unload_image :: proc(image : Image) ---;

    @(link_name="UnloadTexture")
    unload_texture :: proc(texture : Texture2D) ---;

    @(link_name="UnloadRenderTexture")
    unload_render_texture :: proc(target : RenderTexture2D) ---;

    @(link_name="GetImageData")
    get_image_data :: proc(image : Image) -> ^Color ---;

    @(link_name="GetImageDataNormalized")
    get_image_data_normalized :: proc(image : Image) -> ^Vector4 ---;

    @(link_name="GetPixelDataSize")
    get_pixel_data_size :: proc(
        width : _c.int,
        height : _c.int,
        format : _c.int
    ) -> _c.int ---;

    @(link_name="GetTextureData")
    get_texture_data :: proc(texture : Texture2D) -> Image ---;

    @(link_name="GetScreenData")
    get_screen_data :: proc() -> Image ---;

    @(link_name="UpdateTexture")
    update_texture :: proc(
        texture : Texture2D,
        pixels : rawptr
    ) ---;

    @(link_name="ImageCopy")
    image_copy :: proc(image : Image) -> Image ---;

    @(link_name="ImageToPOT")
    image_to_pot :: proc(
        image : ^Image,
        fill_color : Color
    ) ---;

    @(link_name="ImageFormat")
    image_format :: proc(
        image : ^Image,
        new_format : _c.int
    ) ---;

    @(link_name="ImageAlphaMask")
    image_alpha_mask :: proc(
        image : ^Image,
        alpha_mask : Image
    ) ---;

    @(link_name="ImageAlphaClear")
    image_alpha_clear :: proc(
        image : ^Image,
        color : Color,
        threshold : _c.float
    ) ---;

    @(link_name="ImageAlphaCrop")
    image_alpha_crop :: proc(
        image : ^Image,
        threshold : _c.float
    ) ---;

    @(link_name="ImageAlphaPremultiply")
    image_alpha_premultiply :: proc(image : ^Image) ---;

    @(link_name="ImageCrop")
    image_crop :: proc(
        image : ^Image,
        crop : Rectangle
    ) ---;

    @(link_name="ImageResize")
    image_resize :: proc(
        image : ^Image,
        new_width : _c.int,
        new_height : _c.int
    ) ---;

    @(link_name="ImageResizeNN")
    image_resize_nn :: proc(
        image : ^Image,
        new_width : _c.int,
        new_height : _c.int
    ) ---;

    @(link_name="ImageResizeCanvas")
    image_resize_canvas :: proc(
        image : ^Image,
        new_width : _c.int,
        new_height : _c.int,
        offset_x : _c.int,
        offset_y : _c.int,
        color : Color
    ) ---;

    @(link_name="ImageMipmaps")
    image_mipmaps :: proc(image : ^Image) ---;

    @(link_name="ImageDither")
    image_dither :: proc(
        image : ^Image,
        r_bpp : _c.int,
        g_bpp : _c.int,
        b_bpp : _c.int,
        a_bpp : _c.int
    ) ---;

    @(link_name="ImageExtractPalette")
    image_extract_palette :: proc(
        image : Image,
        max_palette_size : _c.int,
        extract_count : ^_c.int
    ) -> ^Color ---;

    @(link_name="ImageText")
    image_text :: proc(
        text : cstring,
        font_size : _c.int,
        color : Color
    ) -> Image ---;

    @(link_name="ImageTextEx")
    image_text_ex :: proc(
        font : Font,
        text : cstring,
        font_size : _c.float,
        spacing : _c.float,
        tint : Color
    ) -> Image ---;

    @(link_name="ImageDraw")
    image_draw :: proc(
        dst : ^Image,
        src : Image,
        src_rec : Rectangle,
        dst_rec : Rectangle
    ) ---;

    @(link_name="ImageDrawRectangle")
    image_draw_rectangle :: proc(
        dst : ^Image,
        rec : Rectangle,
        color : Color
    ) ---;

    @(link_name="ImageDrawRectangleLines")
    image_draw_rectangle_lines :: proc(
        dst : ^Image,
        rec : Rectangle,
        thick : _c.int,
        color : Color
    ) ---;

    @(link_name="ImageDrawText")
    image_draw_text :: proc(
        dst : ^Image,
        position : Vector2,
        text : cstring,
        font_size : _c.int,
        color : Color
    ) ---;

    @(link_name="ImageDrawTextEx")
    image_draw_text_ex :: proc(
        dst : ^Image,
        position : Vector2,
        font : Font,
        text : cstring,
        font_size : _c.float,
        spacing : _c.float,
        color : Color
    ) ---;

    @(link_name="ImageFlipVertical")
    image_flip_vertical :: proc(image : ^Image) ---;

    @(link_name="ImageFlipHorizontal")
    image_flip_horizontal :: proc(image : ^Image) ---;

    @(link_name="ImageRotateCW")
    image_rotate_cw :: proc(image : ^Image) ---;

    @(link_name="ImageRotateCCW")
    image_rotate_ccw :: proc(image : ^Image) ---;

    @(link_name="ImageColorTint")
    image_color_tint :: proc(
        image : ^Image,
        color : Color
    ) ---;

    @(link_name="ImageColorInvert")
    image_color_invert :: proc(image : ^Image) ---;

    @(link_name="ImageColorGrayscale")
    image_color_grayscale :: proc(image : ^Image) ---;

    @(link_name="ImageColorContrast")
    image_color_contrast :: proc(
        image : ^Image,
        contrast : _c.float
    ) ---;

    @(link_name="ImageColorBrightness")
    image_color_brightness :: proc(
        image : ^Image,
        brightness : _c.int
    ) ---;

    @(link_name="ImageColorReplace")
    image_color_replace :: proc(
        image : ^Image,
        color : Color,
        replace : Color
    ) ---;

    @(link_name="GenImageColor")
    gen_image_color :: proc(
        width : _c.int,
        height : _c.int,
        color : Color
    ) -> Image ---;

    @(link_name="GenImageGradientV")
    gen_image_gradient_v :: proc(
        width : _c.int,
        height : _c.int,
        top : Color,
        bottom : Color
    ) -> Image ---;

    @(link_name="GenImageGradientH")
    gen_image_gradient_h :: proc(
        width : _c.int,
        height : _c.int,
        left : Color,
        right : Color
    ) -> Image ---;

    @(link_name="GenImageGradientRadial")
    gen_image_gradient_radial :: proc(
        width : _c.int,
        height : _c.int,
        density : _c.float,
        inner : Color,
        outer : Color
    ) -> Image ---;

    @(link_name="GenImageChecked")
    gen_image_checked :: proc(
        width : _c.int,
        height : _c.int,
        checks_x : _c.int,
        checks_y : _c.int,
        col1 : Color,
        col2 : Color
    ) -> Image ---;

    @(link_name="GenImageWhiteNoise")
    gen_image_white_noise :: proc(
        width : _c.int,
        height : _c.int,
        factor : _c.float
    ) -> Image ---;

    @(link_name="GenImagePerlinNoise")
    gen_image_perlin_noise :: proc(
        width : _c.int,
        height : _c.int,
        offset_x : _c.int,
        offset_y : _c.int,
        scale : _c.float
    ) -> Image ---;

    @(link_name="GenImageCellular")
    gen_image_cellular :: proc(
        width : _c.int,
        height : _c.int,
        tile_size : _c.int
    ) -> Image ---;

    @(link_name="GenTextureMipmaps")
    gen_texture_mipmaps :: proc(texture : ^Texture2D) ---;

    @(link_name="SetTextureFilter")
    set_texture_filter :: proc(
        texture : Texture2D,
        filter_mode : _c.int
    ) ---;

    @(link_name="SetTextureWrap")
    set_texture_wrap :: proc(
        texture : Texture2D,
        wrap_mode : _c.int
    ) ---;

    @(link_name="DrawTexture")
    draw_texture :: proc(
        texture : Texture2D,
        pos_x : _c.int,
        pos_y : _c.int,
        tint : Color
    ) ---;

    @(link_name="DrawTextureV")
    draw_texture_v :: proc(
        texture : Texture2D,
        position : Vector2,
        tint : Color
    ) ---;

    @(link_name="DrawTextureEx")
    draw_texture_ex :: proc(
        texture : Texture2D,
        position : Vector2,
        rotation : _c.float,
        scale : _c.float,
        tint : Color
    ) ---;

    @(link_name="DrawTextureRec")
    draw_texture_rec :: proc(
        texture : Texture2D,
        source_rec : Rectangle,
        position : Vector2,
        tint : Color
    ) ---;

    @(link_name="DrawTextureQuad")
    draw_texture_quad :: proc(
        texture : Texture2D,
        tiling : Vector2,
        offset : Vector2,
        quad : Rectangle,
        tint : Color
    ) ---;

    @(link_name="DrawTexturePro")
    draw_texture_pro :: proc(
        texture : Texture2D,
        source_rec : Rectangle,
        dest_rec : Rectangle,
        origin : Vector2,
        rotation : _c.float,
        tint : Color
    ) ---;

    @(link_name="DrawTextureNPatch")
    draw_texture_n_patch :: proc(
        texture : Texture2D,
        n_patch_info : NPatchInfo,
        dest_rec : Rectangle,
        origin : Vector2,
        rotation : _c.float,
        tint : Color
    ) ---;

    @(link_name="GetFontDefault")
    get_font_default :: proc() -> Font ---;

    @(link_name="LoadFont")
    load_font :: proc(file_name : cstring) -> Font ---;

    @(link_name="LoadFontEx")
    load_font_ex :: proc(
        file_name : cstring,
        font_size : _c.int,
        font_chars : ^_c.int,
        chars_count : _c.int
    ) -> Font ---;

    @(link_name="LoadFontFromImage")
    load_font_from_image :: proc(
        image : Image,
        key : Color,
        first_char : _c.int
    ) -> Font ---;

    @(link_name="LoadFontData")
    load_font_data :: proc(
        file_name : cstring,
        font_size : _c.int,
        font_chars : ^_c.int,
        chars_count : _c.int,
        type : _c.int
    ) -> ^CharInfo ---;

    @(link_name="GenImageFontAtlas")
    gen_image_font_atlas :: proc(
        chars : ^CharInfo,
        chars_count : _c.int,
        font_size : _c.int,
        padding : _c.int,
        pack_method : _c.int
    ) -> Image ---;

    @(link_name="UnloadFont")
    unload_font :: proc(font : Font) ---;

    @(link_name="DrawFPS")
    draw_fps :: proc(
        pos_x : _c.int,
        pos_y : _c.int
    ) ---;

    @(link_name="DrawText")
    draw_text :: proc(
        text : cstring,
        pos_x : _c.int,
        pos_y : _c.int,
        font_size : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawTextEx")
    draw_text_ex :: proc(
        font : Font,
        text : cstring,
        position : Vector2,
        font_size : _c.float,
        spacing : _c.float,
        tint : Color
    ) ---;

    @(link_name="DrawTextRec")
    draw_text_rec :: proc(
        font : Font,
        text : cstring,
        rec : Rectangle,
        font_size : _c.float,
        spacing : _c.float,
        word_wrap : bool,
        tint : Color
    ) ---;

    @(link_name="DrawTextRecEx")
    draw_text_rec_ex :: proc(
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
    ) ---;

    @(link_name="MeasureText")
    measure_text :: proc(
        text : cstring,
        font_size : _c.int
    ) -> _c.int ---;

    @(link_name="MeasureTextEx")
    measure_text_ex :: proc(
        font : Font,
        text : cstring,
        font_size : _c.float,
        spacing : _c.float
    ) -> Vector2 ---;

    @(link_name="GetGlyphIndex")
    get_glyph_index :: proc(
        font : Font,
        character : _c.int
    ) -> _c.int ---;

    @(link_name="TextIsEqual")
    text_is_equal :: proc(
        text1 : cstring,
        text2 : cstring
    ) -> bool ---;

    @(link_name="TextLength")
    text_length :: proc(text : cstring) -> _c.uint ---;

    @(link_name="TextFormat")
    text_format :: proc(text : cstring) -> cstring ---;

    @(link_name="TextSubtext")
    text_subtext :: proc(
        text : cstring,
        position : _c.int,
        length : _c.int
    ) -> cstring ---;

    @(link_name="TextReplace")
    text_replace :: proc(
        text : cstring,
        replace : cstring,
        by : cstring
    ) -> cstring ---;

    @(link_name="TextInsert")
    text_insert :: proc(
        text : cstring,
        insert : cstring,
        position : _c.int
    ) -> cstring ---;

    @(link_name="TextJoin")
    text_join :: proc(
        text_list : ^cstring,
        count : _c.int,
        delimiter : cstring
    ) -> cstring ---;

    @(link_name="TextSplit")
    text_split :: proc(
        text : cstring,
        delimiter : _c.char,
        count : ^_c.int
    ) -> ^cstring ---;

    @(link_name="TextAppend")
    text_append :: proc(
        text : cstring,
        append : cstring,
        position : ^_c.int
    ) ---;

    @(link_name="TextFindIndex")
    text_find_index :: proc(
        text : cstring,
        find : cstring
    ) -> _c.int ---;

    @(link_name="TextToUpper")
    text_to_upper :: proc(text : cstring) -> cstring ---;

    @(link_name="TextToLower")
    text_to_lower :: proc(text : cstring) -> cstring ---;

    @(link_name="TextToPascal")
    text_to_pascal :: proc(text : cstring) -> cstring ---;

    @(link_name="TextToInteger")
    text_to_integer :: proc(text : cstring) -> _c.int ---;

    @(link_name="DrawLine3D")
    draw_line3_d :: proc(
        start_pos : Vector3,
        end_pos : Vector3,
        color : Color
    ) ---;

    @(link_name="DrawCircle3D")
    draw_circle3_d :: proc(
        center : Vector3,
        radius : _c.float,
        rotation_axis : Vector3,
        rotation_angle : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawCube")
    draw_cube :: proc(
        position : Vector3,
        width : _c.float,
        height : _c.float,
        length : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawCubeV")
    draw_cube_v :: proc(
        position : Vector3,
        size : Vector3,
        color : Color
    ) ---;

    @(link_name="DrawCubeWires")
    draw_cube_wires :: proc(
        position : Vector3,
        width : _c.float,
        height : _c.float,
        length : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawCubeWiresV")
    draw_cube_wires_v :: proc(
        position : Vector3,
        size : Vector3,
        color : Color
    ) ---;

    @(link_name="DrawCubeTexture")
    draw_cube_texture :: proc(
        texture : Texture2D,
        position : Vector3,
        width : _c.float,
        height : _c.float,
        length : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawSphere")
    draw_sphere :: proc(
        center_pos : Vector3,
        radius : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawSphereEx")
    draw_sphere_ex :: proc(
        center_pos : Vector3,
        radius : _c.float,
        rings : _c.int,
        slices : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawSphereWires")
    draw_sphere_wires :: proc(
        center_pos : Vector3,
        radius : _c.float,
        rings : _c.int,
        slices : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawCylinder")
    draw_cylinder :: proc(
        position : Vector3,
        radius_top : _c.float,
        radius_bottom : _c.float,
        height : _c.float,
        slices : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawCylinderWires")
    draw_cylinder_wires :: proc(
        position : Vector3,
        radius_top : _c.float,
        radius_bottom : _c.float,
        height : _c.float,
        slices : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawPlane")
    draw_plane :: proc(
        center_pos : Vector3,
        size : Vector2,
        color : Color
    ) ---;

    @(link_name="DrawRay")
    draw_ray :: proc(
        ray : Ray,
        color : Color
    ) ---;

    @(link_name="DrawGrid")
    draw_grid :: proc(
        slices : _c.int,
        spacing : _c.float
    ) ---;

    @(link_name="DrawGizmo")
    draw_gizmo :: proc(position : Vector3) ---;

    @(link_name="LoadModel")
    load_model :: proc(file_name : cstring) -> Model ---;

    @(link_name="LoadModelFromMesh")
    load_model_from_mesh :: proc(mesh : Mesh) -> Model ---;

    @(link_name="UnloadModel")
    unload_model :: proc(model : Model) ---;

    @(link_name="LoadMesh")
    load_mesh :: proc(file_name : cstring) -> Mesh ---;

    @(link_name="UnloadMesh")
    unload_mesh :: proc(mesh : ^Mesh) ---;

    @(link_name="ExportMesh")
    export_mesh :: proc(
        mesh : Mesh,
        file_name : cstring
    ) ---;

    @(link_name="MeshBoundingBox")
    mesh_bounding_box :: proc(mesh : Mesh) -> BoundingBox ---;

    @(link_name="MeshTangents")
    mesh_tangents :: proc(mesh : ^Mesh) ---;

    @(link_name="MeshBinormals")
    mesh_binormals :: proc(mesh : ^Mesh) ---;

    @(link_name="GenMeshPoly")
    gen_mesh_poly :: proc(
        sides : _c.int,
        radius : _c.float
    ) -> Mesh ---;

    @(link_name="GenMeshPlane")
    gen_mesh_plane :: proc(
        width : _c.float,
        length : _c.float,
        res_x : _c.int,
        res_z : _c.int
    ) -> Mesh ---;

    @(link_name="GenMeshCube")
    gen_mesh_cube :: proc(
        width : _c.float,
        height : _c.float,
        length : _c.float
    ) -> Mesh ---;

    @(link_name="GenMeshSphere")
    gen_mesh_sphere :: proc(
        radius : _c.float,
        rings : _c.int,
        slices : _c.int
    ) -> Mesh ---;

    @(link_name="GenMeshHemiSphere")
    gen_mesh_hemi_sphere :: proc(
        radius : _c.float,
        rings : _c.int,
        slices : _c.int
    ) -> Mesh ---;

    @(link_name="GenMeshCylinder")
    gen_mesh_cylinder :: proc(
        radius : _c.float,
        height : _c.float,
        slices : _c.int
    ) -> Mesh ---;

    @(link_name="GenMeshTorus")
    gen_mesh_torus :: proc(
        radius : _c.float,
        size : _c.float,
        rad_seg : _c.int,
        sides : _c.int
    ) -> Mesh ---;

    @(link_name="GenMeshKnot")
    gen_mesh_knot :: proc(
        radius : _c.float,
        size : _c.float,
        rad_seg : _c.int,
        sides : _c.int
    ) -> Mesh ---;

    @(link_name="GenMeshHeightmap")
    gen_mesh_heightmap :: proc(
        heightmap : Image,
        size : Vector3
    ) -> Mesh ---;

    @(link_name="GenMeshCubicmap")
    gen_mesh_cubicmap :: proc(
        cubicmap : Image,
        cube_size : Vector3
    ) -> Mesh ---;

    @(link_name="LoadMaterial")
    load_material :: proc(file_name : cstring) -> Material ---;

    @(link_name="LoadMaterialDefault")
    load_material_default :: proc() -> Material ---;

    @(link_name="UnloadMaterial")
    unload_material :: proc(material : Material) ---;

    @(link_name="DrawModel")
    draw_model :: proc(
        model : Model,
        position : Vector3,
        scale : _c.float,
        tint : Color
    ) ---;

    @(link_name="DrawModelEx")
    draw_model_ex :: proc(
        model : Model,
        position : Vector3,
        rotation_axis : Vector3,
        rotation_angle : _c.float,
        scale : Vector3,
        tint : Color
    ) ---;

    @(link_name="DrawModelWires")
    draw_model_wires :: proc(
        model : Model,
        position : Vector3,
        scale : _c.float,
        tint : Color
    ) ---;

    @(link_name="DrawModelWiresEx")
    draw_model_wires_ex :: proc(
        model : Model,
        position : Vector3,
        rotation_axis : Vector3,
        rotation_angle : _c.float,
        scale : Vector3,
        tint : Color
    ) ---;

    @(link_name="DrawBoundingBox")
    draw_bounding_box :: proc(
        box : BoundingBox,
        color : Color
    ) ---;

    @(link_name="DrawBillboard")
    draw_billboard :: proc(
        camera : Camera,
        texture : Texture2D,
        center : Vector3,
        size : _c.float,
        tint : Color
    ) ---;

    @(link_name="DrawBillboardRec")
    draw_billboard_rec :: proc(
        camera : Camera,
        texture : Texture2D,
        source_rec : Rectangle,
        center : Vector3,
        size : _c.float,
        tint : Color
    ) ---;

    @(link_name="CheckCollisionSpheres")
    check_collision_spheres :: proc(
        center_a : Vector3,
        radius_a : _c.float,
        center_b : Vector3,
        radius_b : _c.float
    ) -> bool ---;

    @(link_name="CheckCollisionBoxes")
    check_collision_boxes :: proc(
        box1 : BoundingBox,
        box2 : BoundingBox
    ) -> bool ---;

    @(link_name="CheckCollisionBoxSphere")
    check_collision_box_sphere :: proc(
        box : BoundingBox,
        center_sphere : Vector3,
        radius_sphere : _c.float
    ) -> bool ---;

    @(link_name="CheckCollisionRaySphere")
    check_collision_ray_sphere :: proc(
        ray : Ray,
        sphere_position : Vector3,
        sphere_radius : _c.float
    ) -> bool ---;

    @(link_name="CheckCollisionRaySphereEx")
    check_collision_ray_sphere_ex :: proc(
        ray : Ray,
        sphere_position : Vector3,
        sphere_radius : _c.float,
        collision_point : ^Vector3
    ) -> bool ---;

    @(link_name="CheckCollisionRayBox")
    check_collision_ray_box :: proc(
        ray : Ray,
        box : BoundingBox
    ) -> bool ---;

    @(link_name="GetCollisionRayModel")
    get_collision_ray_model :: proc(
        ray : Ray,
        model : ^Model
    ) -> RayHitInfo ---;

    @(link_name="GetCollisionRayTriangle")
    get_collision_ray_triangle :: proc(
        ray : Ray,
        p1 : Vector3,
        p2 : Vector3,
        p3 : Vector3
    ) -> RayHitInfo ---;

    @(link_name="GetCollisionRayGround")
    get_collision_ray_ground :: proc(
        ray : Ray,
        ground_height : _c.float
    ) -> RayHitInfo ---;

    @(link_name="LoadText")
    load_text :: proc(file_name : cstring) -> cstring ---;

    @(link_name="LoadShader")
    load_shader :: proc(
        vs_file_name : cstring,
        fs_file_name : cstring
    ) -> Shader ---;

    @(link_name="LoadShaderCode")
    load_shader_code :: proc(
        vs_code : cstring,
        fs_code : cstring
    ) -> Shader ---;

    @(link_name="UnloadShader")
    unload_shader :: proc(shader : Shader) ---;

    @(link_name="GetShaderDefault")
    get_shader_default :: proc() -> Shader ---;

    @(link_name="GetTextureDefault")
    get_texture_default :: proc() -> Texture2D ---;

    @(link_name="GetShaderLocation")
    get_shader_location :: proc(
        shader : Shader,
        uniform_name : cstring
    ) -> _c.int ---;

    @(link_name="SetShaderValue")
    set_shader_value :: proc(
        shader : Shader,
        uniform_loc : _c.int,
        value : rawptr,
        uniform_type : _c.int
    ) ---;

    @(link_name="SetShaderValueV")
    set_shader_value_v :: proc(
        shader : Shader,
        uniform_loc : _c.int,
        value : rawptr,
        uniform_type : _c.int,
        count : _c.int
    ) ---;

    @(link_name="SetShaderValueMatrix")
    set_shader_value_matrix :: proc(
        shader : Shader,
        uniform_loc : _c.int,
        mat : Matrix
    ) ---;

    @(link_name="SetMatrixProjection")
    set_matrix_projection :: proc(proj : Matrix) ---;

    @(link_name="SetMatrixModelview")
    set_matrix_modelview :: proc(view : Matrix) ---;

    @(link_name="GetMatrixModelview")
    get_matrix_modelview :: proc() -> Matrix ---;

    @(link_name="GenTextureCubemap")
    gen_texture_cubemap :: proc(
        shader : Shader,
        sky_hdr : Texture2D,
        size : _c.int
    ) -> Texture2D ---;

    @(link_name="GenTextureIrradiance")
    gen_texture_irradiance :: proc(
        shader : Shader,
        cubemap : Texture2D,
        size : _c.int
    ) -> Texture2D ---;

    @(link_name="GenTexturePrefilter")
    gen_texture_prefilter :: proc(
        shader : Shader,
        cubemap : Texture2D,
        size : _c.int
    ) -> Texture2D ---;

    @(link_name="GenTextureBRDF")
    gen_texture_brdf :: proc(
        shader : Shader,
        size : _c.int
    ) -> Texture2D ---;

    @(link_name="BeginShaderMode")
    begin_shader_mode :: proc(shader : Shader) ---;

    @(link_name="EndShaderMode")
    end_shader_mode :: proc() ---;

    @(link_name="BeginBlendMode")
    begin_blend_mode :: proc(mode : _c.int) ---;

    @(link_name="EndBlendMode")
    end_blend_mode :: proc() ---;

    @(link_name="BeginScissorMode")
    begin_scissor_mode :: proc(
        x : _c.int,
        y : _c.int,
        width : _c.int,
        height : _c.int
    ) ---;

    @(link_name="EndScissorMode")
    end_scissor_mode :: proc() ---;

    @(link_name="GetVrDeviceInfo")
    get_vr_device_info :: proc(vr_device_type : _c.int) -> VrDeviceInfo ---;

    @(link_name="InitVrSimulator")
    init_vr_simulator :: proc(info : VrDeviceInfo) ---;

    @(link_name="UpdateVrTracking")
    update_vr_tracking :: proc(camera : ^Camera) ---;

    @(link_name="CloseVrSimulator")
    close_vr_simulator :: proc() ---;

    @(link_name="IsVrSimulatorReady")
    is_vr_simulator_ready :: proc() -> bool ---;

    @(link_name="ToggleVrMode")
    toggle_vr_mode :: proc() ---;

    @(link_name="BeginVrDrawing")
    begin_vr_drawing :: proc() ---;

    @(link_name="EndVrDrawing")
    end_vr_drawing :: proc() ---;

    @(link_name="InitAudioDevice")
    init_audio_device :: proc() ---;

    @(link_name="CloseAudioDevice")
    close_audio_device :: proc() ---;

    @(link_name="IsAudioDeviceReady")
    is_audio_device_ready :: proc() -> bool ---;

    @(link_name="SetMasterVolume")
    set_master_volume :: proc(volume : _c.float) ---;

    @(link_name="LoadWave")
    load_wave :: proc(file_name : cstring) -> Wave ---;

    @(link_name="LoadWaveEx")
    load_wave_ex :: proc(
        data : rawptr,
        sample_count : _c.int,
        sample_rate : _c.int,
        sample_size : _c.int,
        channels : _c.int
    ) -> Wave ---;

    @(link_name="LoadSound")
    load_sound :: proc(file_name : cstring) -> Sound ---;

    @(link_name="LoadSoundFromWave")
    load_sound_from_wave :: proc(wave : Wave) -> Sound ---;

    @(link_name="UpdateSound")
    update_sound :: proc(
        sound : Sound,
        data : rawptr,
        samples_count : _c.int
    ) ---;

    @(link_name="UnloadWave")
    unload_wave :: proc(wave : Wave) ---;

    @(link_name="UnloadSound")
    unload_sound :: proc(sound : Sound) ---;

    @(link_name="ExportWave")
    export_wave :: proc(
        wave : Wave,
        file_name : cstring
    ) ---;

    @(link_name="ExportWaveAsCode")
    export_wave_as_code :: proc(
        wave : Wave,
        file_name : cstring
    ) ---;

    @(link_name="PlaySound")
    play_sound :: proc(sound : Sound) ---;

    @(link_name="PauseSound")
    pause_sound :: proc(sound : Sound) ---;

    @(link_name="ResumeSound")
    resume_sound :: proc(sound : Sound) ---;

    @(link_name="StopSound")
    stop_sound :: proc(sound : Sound) ---;

    @(link_name="IsSoundPlaying")
    is_sound_playing :: proc(sound : Sound) -> bool ---;

    @(link_name="SetSoundVolume")
    set_sound_volume :: proc(
        sound : Sound,
        volume : _c.float
    ) ---;

    @(link_name="SetSoundPitch")
    set_sound_pitch :: proc(
        sound : Sound,
        pitch : _c.float
    ) ---;

    @(link_name="WaveFormat")
    wave_format :: proc(
        wave : ^Wave,
        sample_rate : _c.int,
        sample_size : _c.int,
        channels : _c.int
    ) ---;

    @(link_name="WaveCopy")
    wave_copy :: proc(wave : Wave) -> Wave ---;

    @(link_name="WaveCrop")
    wave_crop :: proc(
        wave : ^Wave,
        init_sample : _c.int,
        final_sample : _c.int
    ) ---;

    @(link_name="GetWaveData")
    get_wave_data :: proc(wave : Wave) -> ^_c.float ---;

    @(link_name="LoadMusicStream")
    load_music_stream :: proc(file_name : cstring) -> Music ---;

    @(link_name="UnloadMusicStream")
    unload_music_stream :: proc(music : Music) ---;

    @(link_name="PlayMusicStream")
    play_music_stream :: proc(music : Music) ---;

    @(link_name="UpdateMusicStream")
    update_music_stream :: proc(music : Music) ---;

    @(link_name="StopMusicStream")
    stop_music_stream :: proc(music : Music) ---;

    @(link_name="PauseMusicStream")
    pause_music_stream :: proc(music : Music) ---;

    @(link_name="ResumeMusicStream")
    resume_music_stream :: proc(music : Music) ---;

    @(link_name="IsMusicPlaying")
    is_music_playing :: proc(music : Music) -> bool ---;

    @(link_name="SetMusicVolume")
    set_music_volume :: proc(
        music : Music,
        volume : _c.float
    ) ---;

    @(link_name="SetMusicPitch")
    set_music_pitch :: proc(
        music : Music,
        pitch : _c.float
    ) ---;

    @(link_name="SetMusicLoopCount")
    set_music_loop_count :: proc(
        music : Music,
        count : _c.int
    ) ---;

    @(link_name="GetMusicTimeLength")
    get_music_time_length :: proc(music : Music) -> _c.float ---;

    @(link_name="GetMusicTimePlayed")
    get_music_time_played :: proc(music : Music) -> _c.float ---;

    @(link_name="InitAudioStream")
    init_audio_stream :: proc(
        sample_rate : _c.uint,
        sample_size : _c.uint,
        channels : _c.uint
    ) -> AudioStream ---;

    @(link_name="UpdateAudioStream")
    update_audio_stream :: proc(
        stream : AudioStream,
        data : rawptr,
        samples_count : _c.int
    ) ---;

    @(link_name="CloseAudioStream")
    close_audio_stream :: proc(stream : AudioStream) ---;

    @(link_name="IsAudioBufferProcessed")
    is_audio_buffer_processed :: proc(stream : AudioStream) -> bool ---;

    @(link_name="PlayAudioStream")
    play_audio_stream :: proc(stream : AudioStream) ---;

    @(link_name="PauseAudioStream")
    pause_audio_stream :: proc(stream : AudioStream) ---;

    @(link_name="ResumeAudioStream")
    resume_audio_stream :: proc(stream : AudioStream) ---;

    @(link_name="IsAudioStreamPlaying")
    is_audio_stream_playing :: proc(stream : AudioStream) -> bool ---;

    @(link_name="StopAudioStream")
    stop_audio_stream :: proc(stream : AudioStream) ---;

    @(link_name="SetAudioStreamVolume")
    set_audio_stream_volume :: proc(
        stream : AudioStream,
        volume : _c.float
    ) ---;

    @(link_name="SetAudioStreamPitch")
    set_audio_stream_pitch :: proc(
        stream : AudioStream,
        pitch : _c.float
    ) ---;

}
