package aux_data

Enum_Args :: [dynamic]string;
Enum_Args_Map :: map[string]Enum_Args;

add_to_list :: proc(m: ^Enum_Args_Map, key, val: string) {
    list := m[key];
    append(&list, val);
    m[key] = list;
}

get_enum_args :: proc() -> Enum_Args_Map {
    m : Enum_Args_Map;

    add_to_list(&m, "IsKeyPressed", "KeyboardKey");
    add_to_list(&m, "IsKeyDown", "KeyboardKey");
    add_to_list(&m, "IsKeyReleased", "KeyboardKey");
    add_to_list(&m, "IsKeyUp", "KeyboardKey");
    add_to_list(&m, "SetExitKey", "KeyboardKey");
    
    add_to_list(&m, "SetConfigFlags", "ConfigFlag");

    add_to_list(&m, "SetTraceLogLevel", "TraceLogType");
    add_to_list(&m, "SetTraceLogExit", "TraceLogType");
    add_to_list(&m, "TraceLog", "TraceLogType");

    add_to_list(&m, "IsMouseButtonPressed", "MouseButton");
    add_to_list(&m, "IsMouseButtonDown", "MouseButton");
    add_to_list(&m, "IsMouseButtonReleased", "MouseButton");
    add_to_list(&m, "IsMouseButtonUp", "MouseButton");

    add_to_list(&m, "IsGamepadAvailable", "GamepadNumber");
    add_to_list(&m, "IsGamepadName", "GamepadNumber");
    add_to_list(&m, "GetGamepadName", "GamepadNumber");
    add_to_list(&m, "IsGamepadButtonPressed", "GamepadNumber");
    add_to_list(&m, "IsGamepadButtonDown", "GamepadNumber");
    add_to_list(&m, "IsGamepadButtonReleased", "GamepadNumber");
    add_to_list(&m, "IsGamepadButtonUp", "GamepadNumber");
    add_to_list(&m, "GetGamepadAxisCount", "GamepadNumber");
    add_to_list(&m, "GetGamepadAxisMovement", "GamepadNumber");

    add_to_list(&m, "SetCameraMode", "CameraMode");

    add_to_list(&m, "BeginBlendMode", "BlendMode");

    return m;
}
