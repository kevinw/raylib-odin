package generate

import "core:fmt"
import "shared:bindgen"

main :: proc() {
    options : bindgen.GeneratorOptions;

    options.parserOptions.customHandlers["RLAPI"] = macro_define_rlapi;
    //options.parserOptions.customHandlers["CLITERAL"] = macro_cliteral;
    //options.parserOptions.customExpressionHandlers["CLITERAL"] = macro_make_version;

    //options.parserOptions.ignoredTokens = []string{"CLITERAL"};

    options.parserOptions.customHandlers["CLITERAL"] = cliteral_handler;

    options.parserOptions.customExpressionHandlers["__declspec"] = declspec_handler;

    options.parserOptions.customExpressionHandlers["Color"] = color_handler;

    options.parserOptions.customExpressionHandlers["TextFormat"] = textformat_handler;
    options.parserOptions.customExpressionHandlers["TextSubtext"] = textsubtext_handler;
    options.parserOptions.customExpressionHandlers["UnhideWindow"] = unhidewindow_handler;
    options.parserOptions.customExpressionHandlers["Font"] = font_handler;
    options.parserOptions.customExpressionHandlers["Camera3D"] = camera3d_handler;

    bindgen.generate(
        packageName = "raylib",
        foreignLibrary = "raylib",
        outputFile = "raylib.odin",
        headerFiles = []string{"../raylib/src/raylib.h"},
        options = options,
    );
}

color_handler :: proc(data: ^bindgen.ParserData) -> bindgen.LiteralValue {
    bindgen.check_and_eat_token(data, "Color"); return "Color";
}

textformat_handler :: proc(data: ^bindgen.ParserData) -> bindgen.LiteralValue {
    bindgen.check_and_eat_token(data, "TextFormat"); return "TextFormat";
}

textsubtext_handler :: proc(data: ^bindgen.ParserData) -> bindgen.LiteralValue {
    bindgen.check_and_eat_token(data, "TextSubtext"); return "TextSubtext";
}

unhidewindow_handler :: proc(data: ^bindgen.ParserData) -> bindgen.LiteralValue {
    bindgen.check_and_eat_token(data, "UnhideWindow"); return "UnhideWindow";
}

font_handler :: proc(data: ^bindgen.ParserData) -> bindgen.LiteralValue {
    bindgen.check_and_eat_token(data, "Font"); return "Font";
}

camera3d_handler :: proc(data: ^bindgen.ParserData) -> bindgen.LiteralValue {
    bindgen.check_and_eat_token(data, "Camera3D"); return "Camera3D";
}

cliteral_handler :: proc(data: ^bindgen.ParserData) {
    fmt.println("HERE");
    bindgen.check_and_eat_token(data, "(");
    bindgen.parse_identifier(data);
    bindgen.check_and_eat_token(data, ")");
}

declspec_handler :: proc(data: ^bindgen.ParserData) -> bindgen.LiteralValue {
    bindgen.check_and_eat_token(data, "__declspec");
    bindgen.check_and_eat_token(data, "(");
    bindgen.parse_identifier(data);
    bindgen.check_and_eat_token(data, ")");
    return "";
}

macro_define_rlapi :: proc(data: ^bindgen.ParserData) {
    bindgen.check_and_eat_token(data, "RLAPI");
}

// Original macros:
// #define VK_DEFINE_HANDLE(object) typedef struct object##_T* object;
// #define VK_DEFINE_NON_DISPATCHABLE_HANDLE(object) typedef struct object##_T* object;
/*
#if defined(_WIN32) && defined(BUILD_LIBTYPE_SHARED)
    #define RLAPI __declspec(dllexport)         // We are building raylib as a Win32 shared library (.dll)
#elif defined(_WIN32) && defined(USE_LIBTYPE_SHARED)
    #define RLAPI __declspec(dllimport)         // We are using raylib as a Win32 shared library (.dll)
#else
    #define RLAPI   // We are building or using raylib as a static library (or Linux shared library)
#endif
*/

macro_cliteral :: proc(data: ^bindgen.ParserData) {
    bindgen.eat_token(data);
    bindgen.check_and_eat_token(data, "(");
    object := bindgen.parse_identifier(data);
    bindgen.check_and_eat_token(data, ")");
}

macro_define_handle :: proc(data : ^bindgen.ParserData) {
    bindgen.eat_token(data); // "VK_DEFINE_HANDLE" or "VK_DEFINE_NON_DISPATCHABLE_HANDLE"
    bindgen.check_and_eat_token(data, "(");
    object := bindgen.parse_identifier(data);
    bindgen.check_and_eat_token(data, ")");

    structName := fmt.tprint(object, "T");

    structNode : bindgen.StructDefinitionNode;
    structNode.name = structName;
    append(&data.nodes.structDefinitions, structNode);

    sourceType : bindgen.IdentifierType;
    sourceType.name = structName;

    typedefNode : bindgen.TypedefNode;
    typedefNode.name = object;
    typedefNode.sourceType = sourceType;
    append(&data.nodes.typedefs, typedefNode);
}
