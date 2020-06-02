package generate

import "core:fmt"
import "core:os"
import "core:strings"
import "./bindgen"
// import "core:encoding/json"
import "./preprocessed/aux_data"

when os.OS == "windows" {
    import "core:sys/win32"

    mkdir_if_not_exist :: proc(dir: string) -> os.Errno {
        dir_wstr := win32.utf8_to_wstring(dir, context.temp_allocator);
        if win32.Bool(false) == win32.create_directory_w(dir_wstr, nil) do return os.Errno(win32.get_last_error());
        return os.ERROR_NONE;
    }

    preprocess_source :: proc(path_to_source_file: string, path_to_output_file: string) -> bool {
        cmdline := strings.clone_to_cstring(fmt.tprint("cmd /c cl /EP ", path_to_source_file, " > ", path_to_output_file), context.temp_allocator);

        startup_info: win32.Startup_Info = { cb = size_of(win32.Startup_Info) };
        process_information: win32.Process_Information;
        if ok := win32.create_process_a(nil, cmdline, nil, nil, false, 0, nil,  nil, &startup_info, &process_information); !ok {
            fmt.eprintln("could not invoke build script");
            return false;
        }

        if win32.WAIT_OBJECT_0 != win32.wait_for_single_object(process_information.process, win32.INFINITE) {
            fmt.eprintln("ERROR invoking build batch file");
            return false;
        }

        output, ok := os.read_entire_file(path_to_output_file);
        if !ok {
            fmt.eprintln("cl.exe preprocessor did not output to ", path_to_output_file);
        }
        output_lines := strings.split(cast(string)output, "\n");

        trimmed_lines: [dynamic]string;
        for line in output_lines {
            line_trimmed := strings.trim_space(line);
            if len(line_trimmed) == 0 do continue;
            append(&trimmed_lines, fmt.tprintf("%s\n", line_trimmed));
        }
        trimmed_output := strings.join(trimmed_lines[:], "", context.temp_allocator);

        os.write_entire_file(path_to_output_file, transmute([]u8)trimmed_output);

        // TODO: something like win32.destroy_handle(process_information.process);
        return true;
    }
}

default_generator_options :: proc() -> bindgen.GeneratorOptions {
    options : bindgen.GeneratorOptions;

    using options;

    // odin default casing
    variableCase = .Snake;
    functionCase = .Snake;
    pseudoTypeCase = .Pascal;

    typeReplacements["Vector2"] = "linalg.Vector2";
    typeReplacements["Vector3"] = "linalg.Vector3";
    typeReplacements["Vector4"] = "linalg.Vector4";
    typeReplacements["Matrix"] = "linalg.Matrix4";

    return options;
}

generate_raylib_bindings :: proc() {
    options := default_generator_options();
    {
        using options;
        removeFunctions = []string{
            "ShowCursor", 
            "__va_start", "__security_init_cookie", "__security_check_cookie",
        };
        odin_includes = []string {
            "core:math/linalg",
        };
        enumValuePrefixes = {
            "FLAG_", "LOG_", "KEY_", "GAMEPAD_", "MOUSE_", "LOC_",
            "UNIFORM_", "MAP_", "FONT_", "GESTURE_", "CAMERA_", "HMD_",
            "BLEND_", "FILTER_",
        };
        extra_type_string_lines = []string {
            "LIGHTGRAY :: Color {200, 200, 200, 255};",
            "GRAY      :: Color{ 130, 130, 130, 255 };   // Gray",
            "DARKGRAY  :: Color{ 80, 80, 80, 255 };      // Dark Gray",
            "YELLOW    :: Color{ 253, 249, 0, 255 };     // Yellow",
            "GOLD      :: Color{ 255, 203, 0, 255 };     // Gold",
            "ORANGE    :: Color{ 255, 161, 0, 255 };     // Orange",
            "PINK      :: Color{ 255, 109, 194, 255 };   // Pink",
            "RED       :: Color{ 230, 41, 55, 255 };     // Red",
            "MAROON    :: Color{ 190, 33, 55, 255 };     // Maroon",
            "GREEN     :: Color{ 0, 228, 48, 255 };      // Green",
            "LIME      :: Color{ 0, 158, 47, 255 };      // Lime",
            "DARKGREEN :: Color{ 0, 117, 44, 255 };      // Dark Green",
            "SKYBLUE   :: Color{ 102, 191, 255, 255 };   // Sky Blue",
            "BLUE      :: Color{ 0, 121, 241, 255 };     // Blue",
            "DARKBLUE  :: Color{ 0, 82, 172, 255 };      // Dark Blue",
            "PURPLE    :: Color{ 200, 122, 255, 255 };   // Purple",
            "VIOLET    :: Color{ 135, 60, 190, 255 };    // Violet",
            "DARKPURPLE:: Color{ 112, 31, 126, 255 };    // Dark Purple",
            "BEIGE     :: Color{ 211, 176, 131, 255 };   // Beige",
            "BROWN     :: Color{ 127, 106, 79, 255 };    // Brown",
            "DARKBROWN :: Color{ 76, 63, 47, 255 };      // Dark Brown",

            "WHITE     :: Color{ 255, 255, 255, 255 };   // White",
            "BLACK     :: Color{ 0, 0, 0, 255 };         // Black",
            "BLANK     :: Color{ 0, 0, 0, 0 };           // Blank (Transparent)",
            "MAGENTA   :: Color{ 255, 0, 255, 255 };     // Magenta",
            "RAYWHITE  :: Color{ 245, 245, 245, 255 };   // My own White (raylib logo)",
        };
    }

    {
        using options.parserOptions;
        eat_lines_starting_with = []string {
            "__declspec",
            "__pragma",
        };
        customExpressionHandlers["CLITERAL"] = cliteral_handler;
        customExpressionHandlers["Font"] = font_handler;
        customExpressionHandlers["Camera3D"] = camera3d_handler;
        customExpressionHandlers["__declspec"] = declspec_handler;
        ignoredTokens = []string{"RLAPI", "__cdecl"};
    }

    args_map : bindgen.Enum_Args_Map = aux_data.get_enum_args();

    mkdir_if_not_exist("raylib");
    mkdir_if_not_exist("raylib/bridge");
    mkdir_if_not_exist("raylib/types");
    
    outputFile := "raylib/raylib_bindings.odin";
    typesFile  := "raylib/types/raylib_types.odin";
    bridgeFile := "raylib/bridge/raylib_bridge.odin";

    // invoke the C preprocessor on the header
    PREPROCESS :: true;

    when PREPROCESS {
        preprocessed_target_file := "./generator/preprocessed/raylib-preprocessed.h";
        preprocess_source("ext/raylib/include/raylib.h", preprocessed_target_file);
    } else {
        preprocessed_target_file := "ext/raylib/include/raylib.h";
    }

    ok := bindgen.generate(
        packageName = "raylib",
        foreignLibrary = "../ext/raylib/lib/raylib.lib",
        outputFile = outputFile,
        typesFile = typesFile,
        bridgeFile = bridgeFile,
        headerFiles = []string{ preprocessed_target_file },
        options_= options,
        enum_args_map = args_map,
    );

    if ok {
        fmt.println("wrote", outputFile);
        fmt.println("wrote", typesFile);
        fmt.println("wrote", bridgeFile);
    }
}

generate_raygui_bindings :: proc() {
    options := default_generator_options();
    options.odin_includes = []string{
        "../../raylib/types", 
        "core:math/linalg"
    };

    {
        using options.parserOptions;
        ignoredTokens = []string{};
        customExpressionHandlers["CLITERAL"] = cliteral_handler;
        customHandlers["RAYGUIDEF"] = rayguidef_handler;
        customExpressionHandlers["__declspec"] = declspec_handler;
        ignoredDefines = []string{"RAYGUIDEF", "CLITERAL"};
    }

    mkdir_if_not_exist("ext/raygui");
    mkdir_if_not_exist("ext/raygui/types");
    mkdir_if_not_exist("ext/raygui/bridge");
    
    outputFile := "ext/raygui/raygui_bindings.odin";
    typesFile  := "ext/raygui/types/raygui_types.odin";
    bridgeFile := "ext/raygui/bridge/raygui_bridge.odin";
    args_map : bindgen.Enum_Args_Map;

    ok := bindgen.generate(
        packageName = "raygui",
        foreignLibrary = "raygui.lib",
        outputFile = outputFile,
        typesFile = typesFile,
        bridgeFile = bridgeFile,
        headerFiles = []string{"./ext/raygui/raygui-preprocessed.h"},
        options_ = options,
        enum_args_map = args_map,
    );

    if ok {
        fmt.println("wrote", outputFile);
        fmt.println("wrote", typesFile);
        fmt.println("wrote", bridgeFile);
    }

}

generate_raymath_bindings :: proc() {
    options := default_generator_options();
    options.odin_using_includes = []string{ "../../raylib/types", };
    {
        using options.parserOptions;
        ignoredTokens = []string{};
        customHandlers["RMDEF"] =  proc(data: ^bindgen.ParserData) {
            bindgen.check_and_eat_token(data, "RMDEF");
        };
        customExpressionHandlers["__declspec"] = declspec_handler;
        ignoredDefines = []string{"RMDEF",
            "PI", "DEG2RAD", "RAD2DEG", // these are already provided by raylib.h
        };
    }

    mkdir_if_not_exist("ext/raymath");
    mkdir_if_not_exist("ext/raymath/types");
    mkdir_if_not_exist("ext/raymath/bridge");
    
    outputFile := "ext/raymath/raymath_bindings.odin";
    typesFile  := "ext/raymath/types/raymath_types.odin";
    bridgeFile := "ext/raymath/bridge/raymath_bridge.odin";
    args_map : bindgen.Enum_Args_Map;

    if ok := bindgen.generate(
        packageName = "raymath",
        foreignLibrary = "raymath.lib",
        outputFile = outputFile,
        typesFile = typesFile,
        bridgeFile = bridgeFile,
        headerFiles = []string{"./ext/raymath/raymath-preprocessed.h"},
        options_ = options,
        enum_args_map = args_map,
    ); ok {
        fmt.println("wrote", outputFile);
        fmt.println("wrote", typesFile);
        fmt.println("wrote", bridgeFile);
    }
}

generate_physac_bindings :: proc() {
    options := default_generator_options();
    options.odin_using_includes = []string{ "../../raylib/types", };
    {
        using options.parserOptions;
        ignoredTokens = []string{};
        customHandlers["PHYSACDEF"] =  proc(data: ^bindgen.ParserData) {
            bindgen.check_and_eat_token(data, "PHYSACDEF");
        };
        ignoredDefines = []string{"PHYSACDEF" };
    }

    mkdir_if_not_exist("ext/physac");
    mkdir_if_not_exist("ext/physac/types");
    mkdir_if_not_exist("ext/physac/bridge");
    
    outputFile := "ext/physac/physac_bindings.odin";
    typesFile  := "ext/physac/types/physac_types.odin";
    bridgeFile := "ext/physac/bridge/physac_bridge.odin";
    args_map : bindgen.Enum_Args_Map;

    if ok := bindgen.generate(
        packageName = "physac",
        foreignLibrary = "physac.lib",
        outputFile = outputFile,
        typesFile = typesFile,
        bridgeFile = bridgeFile,
        headerFiles = []string{"./ext/physac/physac-preprocessed.h"},
        options_ = options,
        enum_args_map = args_map,
    ); ok {
        fmt.println("wrote", outputFile);
        fmt.println("wrote", typesFile);
        fmt.println("wrote", bridgeFile);
    }
}

generate_chipmunk_bindings :: proc() {
    options := default_generator_options();
    options.functionPrefixes = []string { "cp_" };
    //options.odin_using_includes = []string{ "../../raylib/types", };
    {
        using options.parserOptions;
        //ignoredTokens = []string{};
        //customHandlers["PHYSACDEF"] =  proc(data: ^bindgen.ParserData) {
            //bindgen.check_and_eat_token(data, "PHYSACDEF");
        //};
        //ignoredDefines = []string{"PHYSACDEF" };
    }

    options.functionPrefixes = { "cp", };
    options.pseudoTypePrefixes = { "cp", };
    options.enumValuePrefixes = { "CP_", "BODY_TYPE_", "SPACE_DEBUG_DRAW_", };

    mkdir_if_not_exist("ext/chipmunk");
    mkdir_if_not_exist("ext/chipmunk/types");
    mkdir_if_not_exist("ext/chipmunk/bridge");
    
    outputFile := "ext/chipmunk/chipmunk_bindings.odin";
    typesFile  := "ext/chipmunk/types/chipmunk_types.odin";
    bridgeFile := "ext/chipmunk/bridge/chipmunk_bridge.odin";
    args_map : bindgen.Enum_Args_Map;

    if ok := bindgen.generate(
        packageName = "chipmunk",
        foreignLibrary = "chipmunk.lib",
        outputFile = outputFile,
        typesFile = typesFile,
        bridgeFile = bridgeFile,
        headerFiles = []string{"./ext/Chipmunk2D/AmalgatedChipmunk.h"},
        options_ = options,
        enum_args_map = args_map,
    ); ok {
        fmt.println("wrote", outputFile);
        fmt.println("wrote", typesFile);
        fmt.println("wrote", bridgeFile);
    }
}

main :: proc() {
    generate_raylib_bindings();
    generate_raygui_bindings();
    generate_raymath_bindings();
    generate_physac_bindings();
    generate_chipmunk_bindings();
}

declspec_handler :: proc(data: ^bindgen.ParserData) -> bindgen.LiteralValue
{
    bindgen.check_and_eat_token(data, "__declspec");
    bindgen.eat_line(data);

    return "";
}

cliteral_handler :: proc(data: ^bindgen.ParserData) -> bindgen.LiteralValue
{
    fmt.println("~~~~~~~~~~~~~~~ in cliteral");
    bindgen.check_and_eat_token(data, "CLITERAL");
    bindgen.check_and_eat_token(data, "{");
    r := bindgen.evaluate_i64(data);
    bindgen.check_and_eat_token(data, ",");
    g := bindgen.evaluate_i64(data);
    bindgen.check_and_eat_token(data, ",");
    b := bindgen.evaluate_i64(data);
    bindgen.check_and_eat_token(data, ",");
    a := bindgen.evaluate_i64(data);
    bindgen.check_and_eat_token(data, "}");
    data.defining_node.is_variable = true;
    return fmt.tprintf("Color {{ %d, %d, %d, %d }}", r, g, b, a);
}

macro_make_version :: proc(data : ^bindgen.ParserData) -> bindgen.LiteralValue {
    bindgen.check_and_eat_token(data, "VK_MAKE_VERSION");
    bindgen.check_and_eat_token(data, "(");
    major := bindgen.evaluate_i64(data);
    bindgen.check_and_eat_token(data, ",");
    minor := bindgen.evaluate_i64(data);
    bindgen.check_and_eat_token(data, ",");
    patch := bindgen.evaluate_i64(data);
    bindgen.check_and_eat_token(data, ")");

    return (((major) << 22) | ((minor) << 12) | (patch));
}

rayguidef_handler :: proc(data: ^bindgen.ParserData) {
    bindgen.check_and_eat_token(data, "RAYGUIDEF");
}

color_handler :: proc(data: ^bindgen.ParserData) -> bindgen.LiteralValue {
    bindgen.check_and_eat_token(data, "Color"); return "Color";
}

font_handler :: proc(data: ^bindgen.ParserData) -> bindgen.LiteralValue {
    bindgen.check_and_eat_token(data, "Font"); return "Font";
}

camera3d_handler :: proc(data: ^bindgen.ParserData) -> bindgen.LiteralValue {
    bindgen.check_and_eat_token(data, "Camera3D"); return "Camera3D";
}
