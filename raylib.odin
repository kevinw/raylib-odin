package raylib

foreign import "raylib"

import _c "core:c"

RAYLIB_H :: 1;
PI :: 3.142;
DEG2RAD :: 0.017;
RAD2DEG :: 57.296;
MAX_TOUCH_POINTS :: 10;
MAX_SHADER_LOCATIONS :: 32;
MAX_MATERIAL_MAPS :: 12;
CLITERAL :: 1;
LIGHTGRAY :: Color;
GRAY :: Color;
DARKGRAY :: Color;
YELLOW :: Color;
GOLD :: Color;
ORANGE :: Color;
PINK :: Color;
RED :: Color;
MAROON :: Color;
GREEN :: Color;
LIME :: Color;
DARKGREEN :: Color;
SKYBLUE :: Color;
BLUE :: Color;
DARKBLUE :: Color;
PURPLE :: Color;
VIOLET :: Color;
DARKPURPLE :: Color;
BEIGE :: Color;
BROWN :: Color;
DARKBROWN :: Color;
WHITE :: Color;
BLACK :: Color;
BLANK :: Color;
MAGENTA :: Color;
RAYWHITE :: Color;
FormatText :: TextFormat;
SubText :: TextSubtext;
ShowWindow :: UnhideWindow;
SpriteFont :: Font;
Camera :: Camera3D;
LOC_MAP_DIFFUSE :: 14;
LOC_MAP_SPECULAR :: 15;
MAP_DIFFUSE :: 0;
MAP_SPECULAR :: 1;

bool :: AnonymousEnum0;
Quaternion :: Vector4;
Texture :: Texture2D;
TextureCubemap :: Texture2D;
RenderTexture :: RenderTexture2D;
Music :: ^MusicData;
ConfigFlag :: AnonymousEnum1;
TraceLogType :: AnonymousEnum2;
KeyboardKey :: AnonymousEnum3;
AndroidButton :: AnonymousEnum4;
MouseButton :: AnonymousEnum5;
GamepadNumber :: AnonymousEnum6;
GamepadPS3Button :: AnonymousEnum7;
GamepadPS3Axis :: AnonymousEnum8;
GamepadXbox360Button :: AnonymousEnum9;
GamepadXbox360Axis :: AnonymousEnum10;
GamepadAndroid :: AnonymousEnum11;
ShaderLocationIndex :: AnonymousEnum12;
ShaderUniformDataType :: AnonymousEnum13;
TexmapIndex :: AnonymousEnum14;
PixelFormat :: AnonymousEnum15;
TextureFilterMode :: AnonymousEnum16;
CubemapLayoutType :: AnonymousEnum17;
TextureWrapMode :: AnonymousEnum18;
FontType :: AnonymousEnum19;
BlendMode :: AnonymousEnum20;
GestureType :: AnonymousEnum21;
CameraMode :: AnonymousEnum22;
CameraType :: AnonymousEnum23;
VrDeviceType :: AnonymousEnum24;
NPatchType :: AnonymousEnum25;
TraceLogCallback :: #type proc();

AnonymousEnum0 :: enum i32 {
    false,
    true,
};

AnonymousEnum1 :: enum i32 {
    FLAG_SHOW_LOGO = 1,
    FLAG_FULLSCREEN_MODE = 2,
    FLAG_WINDOW_RESIZABLE = 4,
    FLAG_WINDOW_UNDECORATED = 8,
    FLAG_WINDOW_TRANSPARENT = 16,
    FLAG_WINDOW_HIDDEN = 128,
    FLAG_MSAA_4X_HINT = 32,
    FLAG_VSYNC_HINT = 64,
};

AnonymousEnum2 :: enum i32 {
    LOG_ALL,
    LOG_TRACE,
    LOG_DEBUG,
    LOG_INFO,
    LOG_WARNING,
    LOG_ERROR,
    LOG_FATAL,
    LOG_NONE,
};

AnonymousEnum3 :: enum i32 {
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

AnonymousEnum4 :: enum i32 {
    KEY_BACK = 4,
    KEY_MENU = 82,
    KEY_VOLUME_UP = 24,
    KEY_VOLUME_DOWN = 25,
};

AnonymousEnum5 :: enum i32 {
    MOUSE_LEFT_BUTTON = 0,
    MOUSE_RIGHT_BUTTON = 1,
    MOUSE_MIDDLE_BUTTON = 2,
};

AnonymousEnum6 :: enum i32 {
    GAMEPAD_PLAYER1 = 0,
    GAMEPAD_PLAYER2 = 1,
    GAMEPAD_PLAYER3 = 2,
    GAMEPAD_PLAYER4 = 3,
};

AnonymousEnum7 :: enum i32 {
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

AnonymousEnum8 :: enum i32 {
    GAMEPAD_PS3_AXIS_LEFT_X = 0,
    GAMEPAD_PS3_AXIS_LEFT_Y = 1,
    GAMEPAD_PS3_AXIS_RIGHT_X = 2,
    GAMEPAD_PS3_AXIS_RIGHT_Y = 5,
    GAMEPAD_PS3_AXIS_L2 = 3,
    GAMEPAD_PS3_AXIS_R2 = 4,
};

AnonymousEnum9 :: enum i32 {
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

AnonymousEnum10 :: enum i32 {
    GAMEPAD_XBOX_AXIS_LEFT_X = 0,
    GAMEPAD_XBOX_AXIS_LEFT_Y = 1,
    GAMEPAD_XBOX_AXIS_RIGHT_X = 2,
    GAMEPAD_XBOX_AXIS_RIGHT_Y = 3,
    GAMEPAD_XBOX_AXIS_LT = 4,
    GAMEPAD_XBOX_AXIS_RT = 5,
};

AnonymousEnum11 :: enum i32 {
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

AnonymousEnum12 :: enum i32 {
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

AnonymousEnum13 :: enum i32 {
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

AnonymousEnum14 :: enum i32 {
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

AnonymousEnum15 :: enum i32 {
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

AnonymousEnum16 :: enum i32 {
    FILTER_POINT = 0,
    FILTER_BILINEAR,
    FILTER_TRILINEAR,
    FILTER_ANISOTROPIC_4X,
    FILTER_ANISOTROPIC_8X,
    FILTER_ANISOTROPIC_16X,
};

AnonymousEnum17 :: enum i32 {
    CUBEMAP_AUTO_DETECT = 0,
    CUBEMAP_LINE_VERTICAL,
    CUBEMAP_LINE_HORIZONTAL,
    CUBEMAP_CROSS_THREE_BY_FOUR,
    CUBEMAP_CROSS_FOUR_BY_THREE,
    CUBEMAP_PANORAMA,
};

AnonymousEnum18 :: enum i32 {
    WRAP_REPEAT = 0,
    WRAP_CLAMP,
    WRAP_MIRROR_REPEAT,
    WRAP_MIRROR_CLAMP,
};

AnonymousEnum19 :: enum i32 {
    FONT_DEFAULT = 0,
    FONT_BITMAP,
    FONT_SDF,
};

AnonymousEnum20 :: enum i32 {
    BLEND_ALPHA = 0,
    BLEND_ADDITIVE,
    BLEND_MULTIPLIED,
};

AnonymousEnum21 :: enum i32 {
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

AnonymousEnum22 :: enum i32 {
    CAMERA_CUSTOM = 0,
    CAMERA_FREE,
    CAMERA_ORBITAL,
    CAMERA_FIRST_PERSON,
    CAMERA_THIRD_PERSON,
};

AnonymousEnum23 :: enum i32 {
    CAMERA_PERSPECTIVE = 0,
    CAMERA_ORTHOGRAPHIC,
};

AnonymousEnum24 :: enum i32 {
    HMD_DEFAULT_DEVICE = 0,
    HMD_OCULUS_RIFT_DK2,
    HMD_OCULUS_RIFT_CV1,
    HMD_OCULUS_GO,
    HMD_VALVE_HTC_VIVE,
    HMD_SONY_PSVR,
};

AnonymousEnum25 :: enum i32 {
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
    depthTexture : bool,
};

NPatchInfo :: struct #packed {
    sourceRec : Rectangle,
    left : _c.int,
    top : _c.int,
    right : _c.int,
    bottom : _c.int,
    type : _c.int,
};

CharInfo :: struct #packed {
    value : _c.int,
    rec : Rectangle,
    offsetX : _c.int,
    offsetY : _c.int,
    advanceX : _c.int,
    data : ^_c.uchar,
};

Font :: struct #packed {
    texture : Texture2D,
    baseSize : _c.int,
    charsCount : _c.int,
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
    vertexCount : _c.int,
    triangleCount : _c.int,
    vertices : ^_c.float,
    texcoords : ^_c.float,
    texcoords2 : ^_c.float,
    normals : ^_c.float,
    tangents : ^_c.float,
    colors : ^_c.uchar,
    indices : ^_c.ushort,
    baseVertices : ^_c.float,
    baseNormals : ^_c.float,
    weightBias : ^_c.float,
    weightId : ^_c.int,
    vaoId : _c.uint,
    vboId : [7]_c.uint,
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
    sampleCount : _c.uint,
    sampleRate : _c.uint,
    sampleSize : _c.uint,
    channels : _c.uint,
    data : rawptr,
};

Sound :: struct #packed {
    audioBuffer : rawptr,
    source : _c.uint,
    buffer : _c.uint,
    format : _c.int,
};

MusicData :: struct #packed {};

AudioStream :: struct #packed {
    sampleRate : _c.uint,
    sampleSize : _c.uint,
    channels : _c.uint,
    audioBuffer : rawptr,
    format : _c.int,
    source : _c.uint,
    buffers : [2]_c.uint,
};

VrDeviceInfo :: struct #packed {
    hResolution : _c.int,
    vResolution : _c.int,
    hScreenSize : _c.float,
    vScreenSize : _c.float,
    vScreenCenter : _c.float,
    eyeToScreenDistance : _c.float,
    lensSeparationDistance : _c.float,
    interpupillaryDistance : _c.float,
    lensDistortionValues : [4]_c.float,
    chromaAbCorrection : [4]_c.float,
};

VrStereoConfig :: struct #packed {
    stereoFbo : RenderTexture2D,
    distortionShader : Shader,
    eyesProjection : [2]Matrix,
    eyesViewOffset : [2]Matrix,
    eyeViewportRight : [4]_c.int,
    eyeViewportLeft : [4]_c.int,
};

@(default_calling_convention="c")
foreign raylib {

    @(link_name="InitWindow")
    InitWindow :: proc(
        width : _c.int,
        height : _c.int,
        title : cstring
    ) ---;

    @(link_name="WindowShouldClose")
    WindowShouldClose :: proc() -> bool ---;

    @(link_name="CloseWindow")
    CloseWindow :: proc() ---;

    @(link_name="IsWindowReady")
    IsWindowReady :: proc() -> bool ---;

    @(link_name="IsWindowMinimized")
    IsWindowMinimized :: proc() -> bool ---;

    @(link_name="IsWindowResized")
    IsWindowResized :: proc() -> bool ---;

    @(link_name="IsWindowHidden")
    IsWindowHidden :: proc() -> bool ---;

    @(link_name="ToggleFullscreen")
    ToggleFullscreen :: proc() ---;

    @(link_name="UnhideWindow")
    UnhideWindow :: proc() ---;

    @(link_name="HideWindow")
    HideWindow :: proc() ---;

    @(link_name="SetWindowIcon")
    SetWindowIcon :: proc(image : Image) ---;

    @(link_name="SetWindowTitle")
    SetWindowTitle :: proc(title : cstring) ---;

    @(link_name="SetWindowPosition")
    SetWindowPosition :: proc(
        x : _c.int,
        y : _c.int
    ) ---;

    @(link_name="SetWindowMonitor")
    SetWindowMonitor :: proc(monitor : _c.int) ---;

    @(link_name="SetWindowMinSize")
    SetWindowMinSize :: proc(
        width : _c.int,
        height : _c.int
    ) ---;

    @(link_name="SetWindowSize")
    SetWindowSize :: proc(
        width : _c.int,
        height : _c.int
    ) ---;

    @(link_name="GetWindowHandle")
    GetWindowHandle :: proc() -> rawptr ---;

    @(link_name="GetScreenWidth")
    GetScreenWidth :: proc() -> _c.int ---;

    @(link_name="GetScreenHeight")
    GetScreenHeight :: proc() -> _c.int ---;

    @(link_name="GetMonitorCount")
    GetMonitorCount :: proc() -> _c.int ---;

    @(link_name="GetMonitorWidth")
    GetMonitorWidth :: proc(monitor : _c.int) -> _c.int ---;

    @(link_name="GetMonitorHeight")
    GetMonitorHeight :: proc(monitor : _c.int) -> _c.int ---;

    @(link_name="GetMonitorPhysicalWidth")
    GetMonitorPhysicalWidth :: proc(monitor : _c.int) -> _c.int ---;

    @(link_name="GetMonitorPhysicalHeight")
    GetMonitorPhysicalHeight :: proc(monitor : _c.int) -> _c.int ---;

    @(link_name="GetMonitorName")
    GetMonitorName :: proc(monitor : _c.int) -> cstring ---;

    @(link_name="GetClipboardText")
    GetClipboardText :: proc() -> cstring ---;

    @(link_name="SetClipboardText")
    SetClipboardText :: proc(text : cstring) ---;

    @(link_name="ShowCursor")
    ShowCursor :: proc() ---;

    @(link_name="HideCursor")
    HideCursor :: proc() ---;

    @(link_name="IsCursorHidden")
    IsCursorHidden :: proc() -> bool ---;

    @(link_name="EnableCursor")
    EnableCursor :: proc() ---;

    @(link_name="DisableCursor")
    DisableCursor :: proc() ---;

    @(link_name="ClearBackground")
    ClearBackground :: proc(color : Color) ---;

    @(link_name="BeginDrawing")
    BeginDrawing :: proc() ---;

    @(link_name="EndDrawing")
    EndDrawing :: proc() ---;

    @(link_name="BeginMode2D")
    BeginMode2D :: proc(camera : Camera2D) ---;

    @(link_name="EndMode2D")
    EndMode2D :: proc() ---;

    @(link_name="BeginMode3D")
    BeginMode3D :: proc(camera : Camera3D) ---;

    @(link_name="EndMode3D")
    EndMode3D :: proc() ---;

    @(link_name="BeginTextureMode")
    BeginTextureMode :: proc(target : RenderTexture2D) ---;

    @(link_name="EndTextureMode")
    EndTextureMode :: proc() ---;

    @(link_name="GetMouseRay")
    GetMouseRay :: proc(
        mousePosition : Vector2,
        camera : Camera
    ) -> Ray ---;

    @(link_name="GetWorldToScreen")
    GetWorldToScreen :: proc(
        position : Vector3,
        camera : Camera
    ) -> Vector2 ---;

    @(link_name="GetCameraMatrix")
    GetCameraMatrix :: proc(camera : Camera) -> Matrix ---;

    @(link_name="SetTargetFPS")
    SetTargetFPS :: proc(fps : _c.int) ---;

    @(link_name="GetFPS")
    GetFPS :: proc() -> _c.int ---;

    @(link_name="GetFrameTime")
    GetFrameTime :: proc() -> _c.float ---;

    @(link_name="GetTime")
    GetTime :: proc() -> _c.double ---;

    @(link_name="ColorToInt")
    ColorToInt :: proc(color : Color) -> _c.int ---;

    @(link_name="ColorNormalize")
    ColorNormalize :: proc(color : Color) -> Vector4 ---;

    @(link_name="ColorToHSV")
    ColorToHSV :: proc(color : Color) -> Vector3 ---;

    @(link_name="ColorFromHSV")
    ColorFromHSV :: proc(hsv : Vector3) -> Color ---;

    @(link_name="GetColor")
    GetColor :: proc(hexValue : _c.int) -> Color ---;

    @(link_name="Fade")
    Fade :: proc(
        color : Color,
        alpha : _c.float
    ) -> Color ---;

    @(link_name="SetConfigFlags")
    SetConfigFlags :: proc(flags : _c.uchar) ---;

    @(link_name="SetTraceLogLevel")
    SetTraceLogLevel :: proc(logType : _c.int) ---;

    @(link_name="SetTraceLogExit")
    SetTraceLogExit :: proc(logType : _c.int) ---;

    @(link_name="SetTraceLogCallback")
    SetTraceLogCallback :: proc(callback : TraceLogCallback) ---;

    @(link_name="TraceLog")
    TraceLog :: proc(
        logType : _c.int,
        text : cstring
    ) ---;

    @(link_name="TakeScreenshot")
    TakeScreenshot :: proc(fileName : cstring) ---;

    @(link_name="GetRandomValue")
    GetRandomValue :: proc(
        min : _c.int,
        max : _c.int
    ) -> _c.int ---;

    @(link_name="FileExists")
    FileExists :: proc(fileName : cstring) -> bool ---;

    @(link_name="IsFileExtension")
    IsFileExtension :: proc(
        fileName : cstring,
        ext : cstring
    ) -> bool ---;

    @(link_name="GetExtension")
    GetExtension :: proc(fileName : cstring) -> cstring ---;

    @(link_name="GetFileName")
    GetFileName :: proc(filePath : cstring) -> cstring ---;

    @(link_name="GetFileNameWithoutExt")
    GetFileNameWithoutExt :: proc(filePath : cstring) -> cstring ---;

    @(link_name="GetDirectoryPath")
    GetDirectoryPath :: proc(fileName : cstring) -> cstring ---;

    @(link_name="GetWorkingDirectory")
    GetWorkingDirectory :: proc() -> cstring ---;

    @(link_name="GetDirectoryFiles")
    GetDirectoryFiles :: proc(
        dirPath : cstring,
        count : ^_c.int
    ) -> ^cstring ---;

    @(link_name="ClearDirectoryFiles")
    ClearDirectoryFiles :: proc() ---;

    @(link_name="ChangeDirectory")
    ChangeDirectory :: proc(dir : cstring) -> bool ---;

    @(link_name="IsFileDropped")
    IsFileDropped :: proc() -> bool ---;

    @(link_name="GetDroppedFiles")
    GetDroppedFiles :: proc(count : ^_c.int) -> ^cstring ---;

    @(link_name="ClearDroppedFiles")
    ClearDroppedFiles :: proc() ---;

    @(link_name="GetFileModTime")
    GetFileModTime :: proc(fileName : cstring) -> _c.long ---;

    @(link_name="StorageSaveValue")
    StorageSaveValue :: proc(
        position : _c.int,
        value : _c.int
    ) ---;

    @(link_name="StorageLoadValue")
    StorageLoadValue :: proc(position : _c.int) -> _c.int ---;

    @(link_name="OpenURL")
    OpenURL :: proc(url : cstring) ---;

    @(link_name="IsKeyPressed")
    IsKeyPressed :: proc(key : _c.int) -> bool ---;

    @(link_name="IsKeyDown")
    IsKeyDown :: proc(key : _c.int) -> bool ---;

    @(link_name="IsKeyReleased")
    IsKeyReleased :: proc(key : _c.int) -> bool ---;

    @(link_name="IsKeyUp")
    IsKeyUp :: proc(key : _c.int) -> bool ---;

    @(link_name="GetKeyPressed")
    GetKeyPressed :: proc() -> _c.int ---;

    @(link_name="SetExitKey")
    SetExitKey :: proc(key : _c.int) ---;

    @(link_name="IsGamepadAvailable")
    IsGamepadAvailable :: proc(gamepad : _c.int) -> bool ---;

    @(link_name="IsGamepadName")
    IsGamepadName :: proc(
        gamepad : _c.int,
        name : cstring
    ) -> bool ---;

    @(link_name="GetGamepadName")
    GetGamepadName :: proc(gamepad : _c.int) -> cstring ---;

    @(link_name="IsGamepadButtonPressed")
    IsGamepadButtonPressed :: proc(
        gamepad : _c.int,
        button : _c.int
    ) -> bool ---;

    @(link_name="IsGamepadButtonDown")
    IsGamepadButtonDown :: proc(
        gamepad : _c.int,
        button : _c.int
    ) -> bool ---;

    @(link_name="IsGamepadButtonReleased")
    IsGamepadButtonReleased :: proc(
        gamepad : _c.int,
        button : _c.int
    ) -> bool ---;

    @(link_name="IsGamepadButtonUp")
    IsGamepadButtonUp :: proc(
        gamepad : _c.int,
        button : _c.int
    ) -> bool ---;

    @(link_name="GetGamepadButtonPressed")
    GetGamepadButtonPressed :: proc() -> _c.int ---;

    @(link_name="GetGamepadAxisCount")
    GetGamepadAxisCount :: proc(gamepad : _c.int) -> _c.int ---;

    @(link_name="GetGamepadAxisMovement")
    GetGamepadAxisMovement :: proc(
        gamepad : _c.int,
        axis : _c.int
    ) -> _c.float ---;

    @(link_name="IsMouseButtonPressed")
    IsMouseButtonPressed :: proc(button : _c.int) -> bool ---;

    @(link_name="IsMouseButtonDown")
    IsMouseButtonDown :: proc(button : _c.int) -> bool ---;

    @(link_name="IsMouseButtonReleased")
    IsMouseButtonReleased :: proc(button : _c.int) -> bool ---;

    @(link_name="IsMouseButtonUp")
    IsMouseButtonUp :: proc(button : _c.int) -> bool ---;

    @(link_name="GetMouseX")
    GetMouseX :: proc() -> _c.int ---;

    @(link_name="GetMouseY")
    GetMouseY :: proc() -> _c.int ---;

    @(link_name="GetMousePosition")
    GetMousePosition :: proc() -> Vector2 ---;

    @(link_name="SetMousePosition")
    SetMousePosition :: proc(
        x : _c.int,
        y : _c.int
    ) ---;

    @(link_name="SetMouseOffset")
    SetMouseOffset :: proc(
        offsetX : _c.int,
        offsetY : _c.int
    ) ---;

    @(link_name="SetMouseScale")
    SetMouseScale :: proc(
        scaleX : _c.float,
        scaleY : _c.float
    ) ---;

    @(link_name="GetMouseWheelMove")
    GetMouseWheelMove :: proc() -> _c.int ---;

    @(link_name="GetTouchX")
    GetTouchX :: proc() -> _c.int ---;

    @(link_name="GetTouchY")
    GetTouchY :: proc() -> _c.int ---;

    @(link_name="GetTouchPosition")
    GetTouchPosition :: proc(index : _c.int) -> Vector2 ---;

    @(link_name="SetGesturesEnabled")
    SetGesturesEnabled :: proc(gestureFlags : _c.uint) ---;

    @(link_name="IsGestureDetected")
    IsGestureDetected :: proc(gesture : _c.int) -> bool ---;

    @(link_name="GetGestureDetected")
    GetGestureDetected :: proc() -> _c.int ---;

    @(link_name="GetTouchPointsCount")
    GetTouchPointsCount :: proc() -> _c.int ---;

    @(link_name="GetGestureHoldDuration")
    GetGestureHoldDuration :: proc() -> _c.float ---;

    @(link_name="GetGestureDragVector")
    GetGestureDragVector :: proc() -> Vector2 ---;

    @(link_name="GetGestureDragAngle")
    GetGestureDragAngle :: proc() -> _c.float ---;

    @(link_name="GetGesturePinchVector")
    GetGesturePinchVector :: proc() -> Vector2 ---;

    @(link_name="GetGesturePinchAngle")
    GetGesturePinchAngle :: proc() -> _c.float ---;

    @(link_name="SetCameraMode")
    SetCameraMode :: proc(
        camera : Camera,
        mode : _c.int
    ) ---;

    @(link_name="UpdateCamera")
    UpdateCamera :: proc(camera : ^Camera) ---;

    @(link_name="SetCameraPanControl")
    SetCameraPanControl :: proc(panKey : _c.int) ---;

    @(link_name="SetCameraAltControl")
    SetCameraAltControl :: proc(altKey : _c.int) ---;

    @(link_name="SetCameraSmoothZoomControl")
    SetCameraSmoothZoomControl :: proc(szKey : _c.int) ---;

    @(link_name="SetCameraMoveControls")
    SetCameraMoveControls :: proc(
        frontKey : _c.int,
        backKey : _c.int,
        rightKey : _c.int,
        leftKey : _c.int,
        upKey : _c.int,
        downKey : _c.int
    ) ---;

    @(link_name="DrawPixel")
    DrawPixel :: proc(
        posX : _c.int,
        posY : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawPixelV")
    DrawPixelV :: proc(
        position : Vector2,
        color : Color
    ) ---;

    @(link_name="DrawLine")
    DrawLine :: proc(
        startPosX : _c.int,
        startPosY : _c.int,
        endPosX : _c.int,
        endPosY : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawLineV")
    DrawLineV :: proc(
        startPos : Vector2,
        endPos : Vector2,
        color : Color
    ) ---;

    @(link_name="DrawLineEx")
    DrawLineEx :: proc(
        startPos : Vector2,
        endPos : Vector2,
        thick : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawLineBezier")
    DrawLineBezier :: proc(
        startPos : Vector2,
        endPos : Vector2,
        thick : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawCircle")
    DrawCircle :: proc(
        centerX : _c.int,
        centerY : _c.int,
        radius : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawCircleSector")
    DrawCircleSector :: proc(
        center : Vector2,
        radius : _c.float,
        startAngle : _c.int,
        endAngle : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawCircleGradient")
    DrawCircleGradient :: proc(
        centerX : _c.int,
        centerY : _c.int,
        radius : _c.float,
        color1 : Color,
        color2 : Color
    ) ---;

    @(link_name="DrawCircleV")
    DrawCircleV :: proc(
        center : Vector2,
        radius : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawCircleLines")
    DrawCircleLines :: proc(
        centerX : _c.int,
        centerY : _c.int,
        radius : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawRectangle")
    DrawRectangle :: proc(
        posX : _c.int,
        posY : _c.int,
        width : _c.int,
        height : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawRectangleV")
    DrawRectangleV :: proc(
        position : Vector2,
        size : Vector2,
        color : Color
    ) ---;

    @(link_name="DrawRectangleRec")
    DrawRectangleRec :: proc(
        rec : Rectangle,
        color : Color
    ) ---;

    @(link_name="DrawRectanglePro")
    DrawRectanglePro :: proc(
        rec : Rectangle,
        origin : Vector2,
        rotation : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawRectangleGradientV")
    DrawRectangleGradientV :: proc(
        posX : _c.int,
        posY : _c.int,
        width : _c.int,
        height : _c.int,
        color1 : Color,
        color2 : Color
    ) ---;

    @(link_name="DrawRectangleGradientH")
    DrawRectangleGradientH :: proc(
        posX : _c.int,
        posY : _c.int,
        width : _c.int,
        height : _c.int,
        color1 : Color,
        color2 : Color
    ) ---;

    @(link_name="DrawRectangleGradientEx")
    DrawRectangleGradientEx :: proc(
        rec : Rectangle,
        col1 : Color,
        col2 : Color,
        col3 : Color,
        col4 : Color
    ) ---;

    @(link_name="DrawRectangleLines")
    DrawRectangleLines :: proc(
        posX : _c.int,
        posY : _c.int,
        width : _c.int,
        height : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawRectangleLinesEx")
    DrawRectangleLinesEx :: proc(
        rec : Rectangle,
        lineThick : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawTriangle")
    DrawTriangle :: proc(
        v1 : Vector2,
        v2 : Vector2,
        v3 : Vector2,
        color : Color
    ) ---;

    @(link_name="DrawTriangleLines")
    DrawTriangleLines :: proc(
        v1 : Vector2,
        v2 : Vector2,
        v3 : Vector2,
        color : Color
    ) ---;

    @(link_name="DrawPoly")
    DrawPoly :: proc(
        center : Vector2,
        sides : _c.int,
        radius : _c.float,
        rotation : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawPolyEx")
    DrawPolyEx :: proc(
        points : ^Vector2,
        numPoints : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawPolyExLines")
    DrawPolyExLines :: proc(
        points : ^Vector2,
        numPoints : _c.int,
        color : Color
    ) ---;

    @(link_name="SetShapesTexture")
    SetShapesTexture :: proc(
        texture : Texture2D,
        source : Rectangle
    ) ---;

    @(link_name="CheckCollisionRecs")
    CheckCollisionRecs :: proc(
        rec1 : Rectangle,
        rec2 : Rectangle
    ) -> bool ---;

    @(link_name="CheckCollisionCircles")
    CheckCollisionCircles :: proc(
        center1 : Vector2,
        radius1 : _c.float,
        center2 : Vector2,
        radius2 : _c.float
    ) -> bool ---;

    @(link_name="CheckCollisionCircleRec")
    CheckCollisionCircleRec :: proc(
        center : Vector2,
        radius : _c.float,
        rec : Rectangle
    ) -> bool ---;

    @(link_name="GetCollisionRec")
    GetCollisionRec :: proc(
        rec1 : Rectangle,
        rec2 : Rectangle
    ) -> Rectangle ---;

    @(link_name="CheckCollisionPointRec")
    CheckCollisionPointRec :: proc(
        point : Vector2,
        rec : Rectangle
    ) -> bool ---;

    @(link_name="CheckCollisionPointCircle")
    CheckCollisionPointCircle :: proc(
        point : Vector2,
        center : Vector2,
        radius : _c.float
    ) -> bool ---;

    @(link_name="CheckCollisionPointTriangle")
    CheckCollisionPointTriangle :: proc(
        point : Vector2,
        p1 : Vector2,
        p2 : Vector2,
        p3 : Vector2
    ) -> bool ---;

    @(link_name="LoadImage")
    LoadImage :: proc(fileName : cstring) -> Image ---;

    @(link_name="LoadImageEx")
    LoadImageEx :: proc(
        pixels : ^Color,
        width : _c.int,
        height : _c.int
    ) -> Image ---;

    @(link_name="LoadImagePro")
    LoadImagePro :: proc(
        data : rawptr,
        width : _c.int,
        height : _c.int,
        format : _c.int
    ) -> Image ---;

    @(link_name="LoadImageRaw")
    LoadImageRaw :: proc(
        fileName : cstring,
        width : _c.int,
        height : _c.int,
        format : _c.int,
        headerSize : _c.int
    ) -> Image ---;

    @(link_name="ExportImage")
    ExportImage :: proc(
        image : Image,
        fileName : cstring
    ) ---;

    @(link_name="ExportImageAsCode")
    ExportImageAsCode :: proc(
        image : Image,
        fileName : cstring
    ) ---;

    @(link_name="LoadTexture")
    LoadTexture :: proc(fileName : cstring) -> Texture2D ---;

    @(link_name="LoadTextureFromImage")
    LoadTextureFromImage :: proc(image : Image) -> Texture2D ---;

    @(link_name="LoadTextureCubemap")
    LoadTextureCubemap :: proc(
        image : Image,
        layoutType : _c.int
    ) -> TextureCubemap ---;

    @(link_name="LoadRenderTexture")
    LoadRenderTexture :: proc(
        width : _c.int,
        height : _c.int
    ) -> RenderTexture2D ---;

    @(link_name="UnloadImage")
    UnloadImage :: proc(image : Image) ---;

    @(link_name="UnloadTexture")
    UnloadTexture :: proc(texture : Texture2D) ---;

    @(link_name="UnloadRenderTexture")
    UnloadRenderTexture :: proc(target : RenderTexture2D) ---;

    @(link_name="GetImageData")
    GetImageData :: proc(image : Image) -> ^Color ---;

    @(link_name="GetImageDataNormalized")
    GetImageDataNormalized :: proc(image : Image) -> ^Vector4 ---;

    @(link_name="GetPixelDataSize")
    GetPixelDataSize :: proc(
        width : _c.int,
        height : _c.int,
        format : _c.int
    ) -> _c.int ---;

    @(link_name="GetTextureData")
    GetTextureData :: proc(texture : Texture2D) -> Image ---;

    @(link_name="GetScreenData")
    GetScreenData :: proc() -> Image ---;

    @(link_name="UpdateTexture")
    UpdateTexture :: proc(
        texture : Texture2D,
        pixels : rawptr
    ) ---;

    @(link_name="ImageCopy")
    ImageCopy :: proc(image : Image) -> Image ---;

    @(link_name="ImageToPOT")
    ImageToPOT :: proc(
        image : ^Image,
        fillColor : Color
    ) ---;

    @(link_name="ImageFormat")
    ImageFormat :: proc(
        image : ^Image,
        newFormat : _c.int
    ) ---;

    @(link_name="ImageAlphaMask")
    ImageAlphaMask :: proc(
        image : ^Image,
        alphaMask : Image
    ) ---;

    @(link_name="ImageAlphaClear")
    ImageAlphaClear :: proc(
        image : ^Image,
        color : Color,
        threshold : _c.float
    ) ---;

    @(link_name="ImageAlphaCrop")
    ImageAlphaCrop :: proc(
        image : ^Image,
        threshold : _c.float
    ) ---;

    @(link_name="ImageAlphaPremultiply")
    ImageAlphaPremultiply :: proc(image : ^Image) ---;

    @(link_name="ImageCrop")
    ImageCrop :: proc(
        image : ^Image,
        crop : Rectangle
    ) ---;

    @(link_name="ImageResize")
    ImageResize :: proc(
        image : ^Image,
        newWidth : _c.int,
        newHeight : _c.int
    ) ---;

    @(link_name="ImageResizeNN")
    ImageResizeNN :: proc(
        image : ^Image,
        newWidth : _c.int,
        newHeight : _c.int
    ) ---;

    @(link_name="ImageResizeCanvas")
    ImageResizeCanvas :: proc(
        image : ^Image,
        newWidth : _c.int,
        newHeight : _c.int,
        offsetX : _c.int,
        offsetY : _c.int,
        color : Color
    ) ---;

    @(link_name="ImageMipmaps")
    ImageMipmaps :: proc(image : ^Image) ---;

    @(link_name="ImageDither")
    ImageDither :: proc(
        image : ^Image,
        rBpp : _c.int,
        gBpp : _c.int,
        bBpp : _c.int,
        aBpp : _c.int
    ) ---;

    @(link_name="ImageExtractPalette")
    ImageExtractPalette :: proc(
        image : Image,
        maxPaletteSize : _c.int,
        extractCount : ^_c.int
    ) -> ^Color ---;

    @(link_name="ImageText")
    ImageText :: proc(
        text : cstring,
        fontSize : _c.int,
        color : Color
    ) -> Image ---;

    @(link_name="ImageTextEx")
    ImageTextEx :: proc(
        font : Font,
        text : cstring,
        fontSize : _c.float,
        spacing : _c.float,
        tint : Color
    ) -> Image ---;

    @(link_name="ImageDraw")
    ImageDraw :: proc(
        dst : ^Image,
        src : Image,
        srcRec : Rectangle,
        dstRec : Rectangle
    ) ---;

    @(link_name="ImageDrawRectangle")
    ImageDrawRectangle :: proc(
        dst : ^Image,
        rec : Rectangle,
        color : Color
    ) ---;

    @(link_name="ImageDrawRectangleLines")
    ImageDrawRectangleLines :: proc(
        dst : ^Image,
        rec : Rectangle,
        thick : _c.int,
        color : Color
    ) ---;

    @(link_name="ImageDrawText")
    ImageDrawText :: proc(
        dst : ^Image,
        position : Vector2,
        text : cstring,
        fontSize : _c.int,
        color : Color
    ) ---;

    @(link_name="ImageDrawTextEx")
    ImageDrawTextEx :: proc(
        dst : ^Image,
        position : Vector2,
        font : Font,
        text : cstring,
        fontSize : _c.float,
        spacing : _c.float,
        color : Color
    ) ---;

    @(link_name="ImageFlipVertical")
    ImageFlipVertical :: proc(image : ^Image) ---;

    @(link_name="ImageFlipHorizontal")
    ImageFlipHorizontal :: proc(image : ^Image) ---;

    @(link_name="ImageRotateCW")
    ImageRotateCW :: proc(image : ^Image) ---;

    @(link_name="ImageRotateCCW")
    ImageRotateCCW :: proc(image : ^Image) ---;

    @(link_name="ImageColorTint")
    ImageColorTint :: proc(
        image : ^Image,
        color : Color
    ) ---;

    @(link_name="ImageColorInvert")
    ImageColorInvert :: proc(image : ^Image) ---;

    @(link_name="ImageColorGrayscale")
    ImageColorGrayscale :: proc(image : ^Image) ---;

    @(link_name="ImageColorContrast")
    ImageColorContrast :: proc(
        image : ^Image,
        contrast : _c.float
    ) ---;

    @(link_name="ImageColorBrightness")
    ImageColorBrightness :: proc(
        image : ^Image,
        brightness : _c.int
    ) ---;

    @(link_name="ImageColorReplace")
    ImageColorReplace :: proc(
        image : ^Image,
        color : Color,
        replace : Color
    ) ---;

    @(link_name="GenImageColor")
    GenImageColor :: proc(
        width : _c.int,
        height : _c.int,
        color : Color
    ) -> Image ---;

    @(link_name="GenImageGradientV")
    GenImageGradientV :: proc(
        width : _c.int,
        height : _c.int,
        top : Color,
        bottom : Color
    ) -> Image ---;

    @(link_name="GenImageGradientH")
    GenImageGradientH :: proc(
        width : _c.int,
        height : _c.int,
        left : Color,
        right : Color
    ) -> Image ---;

    @(link_name="GenImageGradientRadial")
    GenImageGradientRadial :: proc(
        width : _c.int,
        height : _c.int,
        density : _c.float,
        inner : Color,
        outer : Color
    ) -> Image ---;

    @(link_name="GenImageChecked")
    GenImageChecked :: proc(
        width : _c.int,
        height : _c.int,
        checksX : _c.int,
        checksY : _c.int,
        col1 : Color,
        col2 : Color
    ) -> Image ---;

    @(link_name="GenImageWhiteNoise")
    GenImageWhiteNoise :: proc(
        width : _c.int,
        height : _c.int,
        factor : _c.float
    ) -> Image ---;

    @(link_name="GenImagePerlinNoise")
    GenImagePerlinNoise :: proc(
        width : _c.int,
        height : _c.int,
        offsetX : _c.int,
        offsetY : _c.int,
        scale : _c.float
    ) -> Image ---;

    @(link_name="GenImageCellular")
    GenImageCellular :: proc(
        width : _c.int,
        height : _c.int,
        tileSize : _c.int
    ) -> Image ---;

    @(link_name="GenTextureMipmaps")
    GenTextureMipmaps :: proc(texture : ^Texture2D) ---;

    @(link_name="SetTextureFilter")
    SetTextureFilter :: proc(
        texture : Texture2D,
        filterMode : _c.int
    ) ---;

    @(link_name="SetTextureWrap")
    SetTextureWrap :: proc(
        texture : Texture2D,
        wrapMode : _c.int
    ) ---;

    @(link_name="DrawTexture")
    DrawTexture :: proc(
        texture : Texture2D,
        posX : _c.int,
        posY : _c.int,
        tint : Color
    ) ---;

    @(link_name="DrawTextureV")
    DrawTextureV :: proc(
        texture : Texture2D,
        position : Vector2,
        tint : Color
    ) ---;

    @(link_name="DrawTextureEx")
    DrawTextureEx :: proc(
        texture : Texture2D,
        position : Vector2,
        rotation : _c.float,
        scale : _c.float,
        tint : Color
    ) ---;

    @(link_name="DrawTextureRec")
    DrawTextureRec :: proc(
        texture : Texture2D,
        sourceRec : Rectangle,
        position : Vector2,
        tint : Color
    ) ---;

    @(link_name="DrawTextureQuad")
    DrawTextureQuad :: proc(
        texture : Texture2D,
        tiling : Vector2,
        offset : Vector2,
        quad : Rectangle,
        tint : Color
    ) ---;

    @(link_name="DrawTexturePro")
    DrawTexturePro :: proc(
        texture : Texture2D,
        sourceRec : Rectangle,
        destRec : Rectangle,
        origin : Vector2,
        rotation : _c.float,
        tint : Color
    ) ---;

    @(link_name="DrawTextureNPatch")
    DrawTextureNPatch :: proc(
        texture : Texture2D,
        nPatchInfo : NPatchInfo,
        destRec : Rectangle,
        origin : Vector2,
        rotation : _c.float,
        tint : Color
    ) ---;

    @(link_name="GetFontDefault")
    GetFontDefault :: proc() -> Font ---;

    @(link_name="LoadFont")
    LoadFont :: proc(fileName : cstring) -> Font ---;

    @(link_name="LoadFontEx")
    LoadFontEx :: proc(
        fileName : cstring,
        fontSize : _c.int,
        fontChars : ^_c.int,
        charsCount : _c.int
    ) -> Font ---;

    @(link_name="LoadFontFromImage")
    LoadFontFromImage :: proc(
        image : Image,
        key : Color,
        firstChar : _c.int
    ) -> Font ---;

    @(link_name="LoadFontData")
    LoadFontData :: proc(
        fileName : cstring,
        fontSize : _c.int,
        fontChars : ^_c.int,
        charsCount : _c.int,
        type : _c.int
    ) -> ^CharInfo ---;

    @(link_name="GenImageFontAtlas")
    GenImageFontAtlas :: proc(
        chars : ^CharInfo,
        charsCount : _c.int,
        fontSize : _c.int,
        padding : _c.int,
        packMethod : _c.int
    ) -> Image ---;

    @(link_name="UnloadFont")
    UnloadFont :: proc(font : Font) ---;

    @(link_name="DrawFPS")
    DrawFPS :: proc(
        posX : _c.int,
        posY : _c.int
    ) ---;

    @(link_name="DrawText")
    DrawText :: proc(
        text : cstring,
        posX : _c.int,
        posY : _c.int,
        fontSize : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawTextEx")
    DrawTextEx :: proc(
        font : Font,
        text : cstring,
        position : Vector2,
        fontSize : _c.float,
        spacing : _c.float,
        tint : Color
    ) ---;

    @(link_name="DrawTextRec")
    DrawTextRec :: proc(
        font : Font,
        text : cstring,
        rec : Rectangle,
        fontSize : _c.float,
        spacing : _c.float,
        wordWrap : bool,
        tint : Color
    ) ---;

    @(link_name="DrawTextRecEx")
    DrawTextRecEx :: proc(
        font : Font,
        text : cstring,
        rec : Rectangle,
        fontSize : _c.float,
        spacing : _c.float,
        wordWrap : bool,
        tint : Color,
        selectStart : _c.int,
        selectLength : _c.int,
        selectText : Color,
        selectBack : Color
    ) ---;

    @(link_name="MeasureText")
    MeasureText :: proc(
        text : cstring,
        fontSize : _c.int
    ) -> _c.int ---;

    @(link_name="MeasureTextEx")
    MeasureTextEx :: proc(
        font : Font,
        text : cstring,
        fontSize : _c.float,
        spacing : _c.float
    ) -> Vector2 ---;

    @(link_name="GetGlyphIndex")
    GetGlyphIndex :: proc(
        font : Font,
        character : _c.int
    ) -> _c.int ---;

    @(link_name="TextIsEqual")
    TextIsEqual :: proc(
        text1 : cstring,
        text2 : cstring
    ) -> bool ---;

    @(link_name="TextLength")
    TextLength :: proc(text : cstring) -> _c.uint ---;

    @(link_name="TextFormat")
    TextFormat :: proc(text : cstring) -> cstring ---;

    @(link_name="TextSubtext")
    TextSubtext :: proc(
        text : cstring,
        position : _c.int,
        length : _c.int
    ) -> cstring ---;

    @(link_name="TextReplace")
    TextReplace :: proc(
        text : cstring,
        replace : cstring,
        by : cstring
    ) -> cstring ---;

    @(link_name="TextInsert")
    TextInsert :: proc(
        text : cstring,
        insert : cstring,
        position : _c.int
    ) -> cstring ---;

    @(link_name="TextJoin")
    TextJoin :: proc(
        textList : ^cstring,
        count : _c.int,
        delimiter : cstring
    ) -> cstring ---;

    @(link_name="TextSplit")
    TextSplit :: proc(
        text : cstring,
        delimiter : _c.char,
        count : ^_c.int
    ) -> ^cstring ---;

    @(link_name="TextAppend")
    TextAppend :: proc(
        text : cstring,
        append : cstring,
        position : ^_c.int
    ) ---;

    @(link_name="TextFindIndex")
    TextFindIndex :: proc(
        text : cstring,
        find : cstring
    ) -> _c.int ---;

    @(link_name="TextToUpper")
    TextToUpper :: proc(text : cstring) -> cstring ---;

    @(link_name="TextToLower")
    TextToLower :: proc(text : cstring) -> cstring ---;

    @(link_name="TextToPascal")
    TextToPascal :: proc(text : cstring) -> cstring ---;

    @(link_name="TextToInteger")
    TextToInteger :: proc(text : cstring) -> _c.int ---;

    @(link_name="DrawLine3D")
    DrawLine3D :: proc(
        startPos : Vector3,
        endPos : Vector3,
        color : Color
    ) ---;

    @(link_name="DrawCircle3D")
    DrawCircle3D :: proc(
        center : Vector3,
        radius : _c.float,
        rotationAxis : Vector3,
        rotationAngle : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawCube")
    DrawCube :: proc(
        position : Vector3,
        width : _c.float,
        height : _c.float,
        length : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawCubeV")
    DrawCubeV :: proc(
        position : Vector3,
        size : Vector3,
        color : Color
    ) ---;

    @(link_name="DrawCubeWires")
    DrawCubeWires :: proc(
        position : Vector3,
        width : _c.float,
        height : _c.float,
        length : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawCubeWiresV")
    DrawCubeWiresV :: proc(
        position : Vector3,
        size : Vector3,
        color : Color
    ) ---;

    @(link_name="DrawCubeTexture")
    DrawCubeTexture :: proc(
        texture : Texture2D,
        position : Vector3,
        width : _c.float,
        height : _c.float,
        length : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawSphere")
    DrawSphere :: proc(
        centerPos : Vector3,
        radius : _c.float,
        color : Color
    ) ---;

    @(link_name="DrawSphereEx")
    DrawSphereEx :: proc(
        centerPos : Vector3,
        radius : _c.float,
        rings : _c.int,
        slices : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawSphereWires")
    DrawSphereWires :: proc(
        centerPos : Vector3,
        radius : _c.float,
        rings : _c.int,
        slices : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawCylinder")
    DrawCylinder :: proc(
        position : Vector3,
        radiusTop : _c.float,
        radiusBottom : _c.float,
        height : _c.float,
        slices : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawCylinderWires")
    DrawCylinderWires :: proc(
        position : Vector3,
        radiusTop : _c.float,
        radiusBottom : _c.float,
        height : _c.float,
        slices : _c.int,
        color : Color
    ) ---;

    @(link_name="DrawPlane")
    DrawPlane :: proc(
        centerPos : Vector3,
        size : Vector2,
        color : Color
    ) ---;

    @(link_name="DrawRay")
    DrawRay :: proc(
        ray : Ray,
        color : Color
    ) ---;

    @(link_name="DrawGrid")
    DrawGrid :: proc(
        slices : _c.int,
        spacing : _c.float
    ) ---;

    @(link_name="DrawGizmo")
    DrawGizmo :: proc(position : Vector3) ---;

    @(link_name="LoadModel")
    LoadModel :: proc(fileName : cstring) -> Model ---;

    @(link_name="LoadModelFromMesh")
    LoadModelFromMesh :: proc(mesh : Mesh) -> Model ---;

    @(link_name="UnloadModel")
    UnloadModel :: proc(model : Model) ---;

    @(link_name="LoadMesh")
    LoadMesh :: proc(fileName : cstring) -> Mesh ---;

    @(link_name="UnloadMesh")
    UnloadMesh :: proc(mesh : ^Mesh) ---;

    @(link_name="ExportMesh")
    ExportMesh :: proc(
        mesh : Mesh,
        fileName : cstring
    ) ---;

    @(link_name="MeshBoundingBox")
    MeshBoundingBox :: proc(mesh : Mesh) -> BoundingBox ---;

    @(link_name="MeshTangents")
    MeshTangents :: proc(mesh : ^Mesh) ---;

    @(link_name="MeshBinormals")
    MeshBinormals :: proc(mesh : ^Mesh) ---;

    @(link_name="GenMeshPoly")
    GenMeshPoly :: proc(
        sides : _c.int,
        radius : _c.float
    ) -> Mesh ---;

    @(link_name="GenMeshPlane")
    GenMeshPlane :: proc(
        width : _c.float,
        length : _c.float,
        resX : _c.int,
        resZ : _c.int
    ) -> Mesh ---;

    @(link_name="GenMeshCube")
    GenMeshCube :: proc(
        width : _c.float,
        height : _c.float,
        length : _c.float
    ) -> Mesh ---;

    @(link_name="GenMeshSphere")
    GenMeshSphere :: proc(
        radius : _c.float,
        rings : _c.int,
        slices : _c.int
    ) -> Mesh ---;

    @(link_name="GenMeshHemiSphere")
    GenMeshHemiSphere :: proc(
        radius : _c.float,
        rings : _c.int,
        slices : _c.int
    ) -> Mesh ---;

    @(link_name="GenMeshCylinder")
    GenMeshCylinder :: proc(
        radius : _c.float,
        height : _c.float,
        slices : _c.int
    ) -> Mesh ---;

    @(link_name="GenMeshTorus")
    GenMeshTorus :: proc(
        radius : _c.float,
        size : _c.float,
        radSeg : _c.int,
        sides : _c.int
    ) -> Mesh ---;

    @(link_name="GenMeshKnot")
    GenMeshKnot :: proc(
        radius : _c.float,
        size : _c.float,
        radSeg : _c.int,
        sides : _c.int
    ) -> Mesh ---;

    @(link_name="GenMeshHeightmap")
    GenMeshHeightmap :: proc(
        heightmap : Image,
        size : Vector3
    ) -> Mesh ---;

    @(link_name="GenMeshCubicmap")
    GenMeshCubicmap :: proc(
        cubicmap : Image,
        cubeSize : Vector3
    ) -> Mesh ---;

    @(link_name="LoadMaterial")
    LoadMaterial :: proc(fileName : cstring) -> Material ---;

    @(link_name="LoadMaterialDefault")
    LoadMaterialDefault :: proc() -> Material ---;

    @(link_name="UnloadMaterial")
    UnloadMaterial :: proc(material : Material) ---;

    @(link_name="DrawModel")
    DrawModel :: proc(
        model : Model,
        position : Vector3,
        scale : _c.float,
        tint : Color
    ) ---;

    @(link_name="DrawModelEx")
    DrawModelEx :: proc(
        model : Model,
        position : Vector3,
        rotationAxis : Vector3,
        rotationAngle : _c.float,
        scale : Vector3,
        tint : Color
    ) ---;

    @(link_name="DrawModelWires")
    DrawModelWires :: proc(
        model : Model,
        position : Vector3,
        scale : _c.float,
        tint : Color
    ) ---;

    @(link_name="DrawModelWiresEx")
    DrawModelWiresEx :: proc(
        model : Model,
        position : Vector3,
        rotationAxis : Vector3,
        rotationAngle : _c.float,
        scale : Vector3,
        tint : Color
    ) ---;

    @(link_name="DrawBoundingBox")
    DrawBoundingBox :: proc(
        box : BoundingBox,
        color : Color
    ) ---;

    @(link_name="DrawBillboard")
    DrawBillboard :: proc(
        camera : Camera,
        texture : Texture2D,
        center : Vector3,
        size : _c.float,
        tint : Color
    ) ---;

    @(link_name="DrawBillboardRec")
    DrawBillboardRec :: proc(
        camera : Camera,
        texture : Texture2D,
        sourceRec : Rectangle,
        center : Vector3,
        size : _c.float,
        tint : Color
    ) ---;

    @(link_name="CheckCollisionSpheres")
    CheckCollisionSpheres :: proc(
        centerA : Vector3,
        radiusA : _c.float,
        centerB : Vector3,
        radiusB : _c.float
    ) -> bool ---;

    @(link_name="CheckCollisionBoxes")
    CheckCollisionBoxes :: proc(
        box1 : BoundingBox,
        box2 : BoundingBox
    ) -> bool ---;

    @(link_name="CheckCollisionBoxSphere")
    CheckCollisionBoxSphere :: proc(
        box : BoundingBox,
        centerSphere : Vector3,
        radiusSphere : _c.float
    ) -> bool ---;

    @(link_name="CheckCollisionRaySphere")
    CheckCollisionRaySphere :: proc(
        ray : Ray,
        spherePosition : Vector3,
        sphereRadius : _c.float
    ) -> bool ---;

    @(link_name="CheckCollisionRaySphereEx")
    CheckCollisionRaySphereEx :: proc(
        ray : Ray,
        spherePosition : Vector3,
        sphereRadius : _c.float,
        collisionPoint : ^Vector3
    ) -> bool ---;

    @(link_name="CheckCollisionRayBox")
    CheckCollisionRayBox :: proc(
        ray : Ray,
        box : BoundingBox
    ) -> bool ---;

    @(link_name="GetCollisionRayModel")
    GetCollisionRayModel :: proc(
        ray : Ray,
        model : ^Model
    ) -> RayHitInfo ---;

    @(link_name="GetCollisionRayTriangle")
    GetCollisionRayTriangle :: proc(
        ray : Ray,
        p1 : Vector3,
        p2 : Vector3,
        p3 : Vector3
    ) -> RayHitInfo ---;

    @(link_name="GetCollisionRayGround")
    GetCollisionRayGround :: proc(
        ray : Ray,
        groundHeight : _c.float
    ) -> RayHitInfo ---;

    @(link_name="LoadText")
    LoadText :: proc(fileName : cstring) -> cstring ---;

    @(link_name="LoadShader")
    LoadShader :: proc(
        vsFileName : cstring,
        fsFileName : cstring
    ) -> Shader ---;

    @(link_name="LoadShaderCode")
    LoadShaderCode :: proc(
        vsCode : cstring,
        fsCode : cstring
    ) -> Shader ---;

    @(link_name="UnloadShader")
    UnloadShader :: proc(shader : Shader) ---;

    @(link_name="GetShaderDefault")
    GetShaderDefault :: proc() -> Shader ---;

    @(link_name="GetTextureDefault")
    GetTextureDefault :: proc() -> Texture2D ---;

    @(link_name="GetShaderLocation")
    GetShaderLocation :: proc(
        shader : Shader,
        uniformName : cstring
    ) -> _c.int ---;

    @(link_name="SetShaderValue")
    SetShaderValue :: proc(
        shader : Shader,
        uniformLoc : _c.int,
        value : rawptr,
        uniformType : _c.int
    ) ---;

    @(link_name="SetShaderValueV")
    SetShaderValueV :: proc(
        shader : Shader,
        uniformLoc : _c.int,
        value : rawptr,
        uniformType : _c.int,
        count : _c.int
    ) ---;

    @(link_name="SetShaderValueMatrix")
    SetShaderValueMatrix :: proc(
        shader : Shader,
        uniformLoc : _c.int,
        mat : Matrix
    ) ---;

    @(link_name="SetMatrixProjection")
    SetMatrixProjection :: proc(proj : Matrix) ---;

    @(link_name="SetMatrixModelview")
    SetMatrixModelview :: proc(view : Matrix) ---;

    @(link_name="GetMatrixModelview")
    GetMatrixModelview :: proc() -> Matrix ---;

    @(link_name="GenTextureCubemap")
    GenTextureCubemap :: proc(
        shader : Shader,
        skyHDR : Texture2D,
        size : _c.int
    ) -> Texture2D ---;

    @(link_name="GenTextureIrradiance")
    GenTextureIrradiance :: proc(
        shader : Shader,
        cubemap : Texture2D,
        size : _c.int
    ) -> Texture2D ---;

    @(link_name="GenTexturePrefilter")
    GenTexturePrefilter :: proc(
        shader : Shader,
        cubemap : Texture2D,
        size : _c.int
    ) -> Texture2D ---;

    @(link_name="GenTextureBRDF")
    GenTextureBRDF :: proc(
        shader : Shader,
        size : _c.int
    ) -> Texture2D ---;

    @(link_name="BeginShaderMode")
    BeginShaderMode :: proc(shader : Shader) ---;

    @(link_name="EndShaderMode")
    EndShaderMode :: proc() ---;

    @(link_name="BeginBlendMode")
    BeginBlendMode :: proc(mode : _c.int) ---;

    @(link_name="EndBlendMode")
    EndBlendMode :: proc() ---;

    @(link_name="BeginScissorMode")
    BeginScissorMode :: proc(
        x : _c.int,
        y : _c.int,
        width : _c.int,
        height : _c.int
    ) ---;

    @(link_name="EndScissorMode")
    EndScissorMode :: proc() ---;

    @(link_name="GetVrDeviceInfo")
    GetVrDeviceInfo :: proc(vrDeviceType : _c.int) -> VrDeviceInfo ---;

    @(link_name="InitVrSimulator")
    InitVrSimulator :: proc(info : VrDeviceInfo) ---;

    @(link_name="UpdateVrTracking")
    UpdateVrTracking :: proc(camera : ^Camera) ---;

    @(link_name="CloseVrSimulator")
    CloseVrSimulator :: proc() ---;

    @(link_name="IsVrSimulatorReady")
    IsVrSimulatorReady :: proc() -> bool ---;

    @(link_name="ToggleVrMode")
    ToggleVrMode :: proc() ---;

    @(link_name="BeginVrDrawing")
    BeginVrDrawing :: proc() ---;

    @(link_name="EndVrDrawing")
    EndVrDrawing :: proc() ---;

    @(link_name="InitAudioDevice")
    InitAudioDevice :: proc() ---;

    @(link_name="CloseAudioDevice")
    CloseAudioDevice :: proc() ---;

    @(link_name="IsAudioDeviceReady")
    IsAudioDeviceReady :: proc() -> bool ---;

    @(link_name="SetMasterVolume")
    SetMasterVolume :: proc(volume : _c.float) ---;

    @(link_name="LoadWave")
    LoadWave :: proc(fileName : cstring) -> Wave ---;

    @(link_name="LoadWaveEx")
    LoadWaveEx :: proc(
        data : rawptr,
        sampleCount : _c.int,
        sampleRate : _c.int,
        sampleSize : _c.int,
        channels : _c.int
    ) -> Wave ---;

    @(link_name="LoadSound")
    LoadSound :: proc(fileName : cstring) -> Sound ---;

    @(link_name="LoadSoundFromWave")
    LoadSoundFromWave :: proc(wave : Wave) -> Sound ---;

    @(link_name="UpdateSound")
    UpdateSound :: proc(
        sound : Sound,
        data : rawptr,
        samplesCount : _c.int
    ) ---;

    @(link_name="UnloadWave")
    UnloadWave :: proc(wave : Wave) ---;

    @(link_name="UnloadSound")
    UnloadSound :: proc(sound : Sound) ---;

    @(link_name="ExportWave")
    ExportWave :: proc(
        wave : Wave,
        fileName : cstring
    ) ---;

    @(link_name="ExportWaveAsCode")
    ExportWaveAsCode :: proc(
        wave : Wave,
        fileName : cstring
    ) ---;

    @(link_name="PlaySound")
    PlaySound :: proc(sound : Sound) ---;

    @(link_name="PauseSound")
    PauseSound :: proc(sound : Sound) ---;

    @(link_name="ResumeSound")
    ResumeSound :: proc(sound : Sound) ---;

    @(link_name="StopSound")
    StopSound :: proc(sound : Sound) ---;

    @(link_name="IsSoundPlaying")
    IsSoundPlaying :: proc(sound : Sound) -> bool ---;

    @(link_name="SetSoundVolume")
    SetSoundVolume :: proc(
        sound : Sound,
        volume : _c.float
    ) ---;

    @(link_name="SetSoundPitch")
    SetSoundPitch :: proc(
        sound : Sound,
        pitch : _c.float
    ) ---;

    @(link_name="WaveFormat")
    WaveFormat :: proc(
        wave : ^Wave,
        sampleRate : _c.int,
        sampleSize : _c.int,
        channels : _c.int
    ) ---;

    @(link_name="WaveCopy")
    WaveCopy :: proc(wave : Wave) -> Wave ---;

    @(link_name="WaveCrop")
    WaveCrop :: proc(
        wave : ^Wave,
        initSample : _c.int,
        finalSample : _c.int
    ) ---;

    @(link_name="GetWaveData")
    GetWaveData :: proc(wave : Wave) -> ^_c.float ---;

    @(link_name="LoadMusicStream")
    LoadMusicStream :: proc(fileName : cstring) -> Music ---;

    @(link_name="UnloadMusicStream")
    UnloadMusicStream :: proc(music : Music) ---;

    @(link_name="PlayMusicStream")
    PlayMusicStream :: proc(music : Music) ---;

    @(link_name="UpdateMusicStream")
    UpdateMusicStream :: proc(music : Music) ---;

    @(link_name="StopMusicStream")
    StopMusicStream :: proc(music : Music) ---;

    @(link_name="PauseMusicStream")
    PauseMusicStream :: proc(music : Music) ---;

    @(link_name="ResumeMusicStream")
    ResumeMusicStream :: proc(music : Music) ---;

    @(link_name="IsMusicPlaying")
    IsMusicPlaying :: proc(music : Music) -> bool ---;

    @(link_name="SetMusicVolume")
    SetMusicVolume :: proc(
        music : Music,
        volume : _c.float
    ) ---;

    @(link_name="SetMusicPitch")
    SetMusicPitch :: proc(
        music : Music,
        pitch : _c.float
    ) ---;

    @(link_name="SetMusicLoopCount")
    SetMusicLoopCount :: proc(
        music : Music,
        count : _c.int
    ) ---;

    @(link_name="GetMusicTimeLength")
    GetMusicTimeLength :: proc(music : Music) -> _c.float ---;

    @(link_name="GetMusicTimePlayed")
    GetMusicTimePlayed :: proc(music : Music) -> _c.float ---;

    @(link_name="InitAudioStream")
    InitAudioStream :: proc(
        sampleRate : _c.uint,
        sampleSize : _c.uint,
        channels : _c.uint
    ) -> AudioStream ---;

    @(link_name="UpdateAudioStream")
    UpdateAudioStream :: proc(
        stream : AudioStream,
        data : rawptr,
        samplesCount : _c.int
    ) ---;

    @(link_name="CloseAudioStream")
    CloseAudioStream :: proc(stream : AudioStream) ---;

    @(link_name="IsAudioBufferProcessed")
    IsAudioBufferProcessed :: proc(stream : AudioStream) -> bool ---;

    @(link_name="PlayAudioStream")
    PlayAudioStream :: proc(stream : AudioStream) ---;

    @(link_name="PauseAudioStream")
    PauseAudioStream :: proc(stream : AudioStream) ---;

    @(link_name="ResumeAudioStream")
    ResumeAudioStream :: proc(stream : AudioStream) ---;

    @(link_name="IsAudioStreamPlaying")
    IsAudioStreamPlaying :: proc(stream : AudioStream) -> bool ---;

    @(link_name="StopAudioStream")
    StopAudioStream :: proc(stream : AudioStream) ---;

    @(link_name="SetAudioStreamVolume")
    SetAudioStreamVolume :: proc(
        stream : AudioStream,
        volume : _c.float
    ) ---;

    @(link_name="SetAudioStreamPitch")
    SetAudioStreamPitch :: proc(
        stream : AudioStream,
        pitch : _c.float
    ) ---;

}
