package bindgen

import "core:os"
import "core:fmt"

export_defines :: proc(data : ^GeneratorData) {
    for node in data.nodes.defines {
        defineName := clean_define_name(node.name, data.options);

        // @fixme fprint of float numbers are pretty badly handled,
        // just has a 10^-3 precision.
        fmt.fprint(data.handle, defineName,
            node.is_variable ? " := " : " :: ", node.value, ";\n");
    }
    fmt.fprint(data.handle, "\n");
}

export_typedefs :: proc(data : ^GeneratorData) {
    for node in data.nodes.typedefs {
        aliasName := clean_pseudo_type_name(node.name, data.options);
        sourceType := clean_type(node.sourceType, data.options);
        if aliasName == sourceType do continue;
        fmt.fprint(data.handle, aliasName, " :: ", sourceType, ";\n");
    }
    fmt.fprint(data.handle, "\n");
}

export_enums :: proc(data : ^GeneratorData) {
    for node in data.nodes.enumDefinitions {
        enumName := clean_pseudo_type_name(node.name, data.options);
        fmt.fprint(data.handle, enumName, " :: enum i32 {");

        postfixes : [dynamic]string;
        enumName, postfixes = clean_enum_name_for_prefix_removal(enumName, data.options);

        // Changing the case of postfixes to the enum value one,
        // so that they can be removed.
        enumValueCase := find_case(node.members[0].name);
        for postfix, i in postfixes {
            postfixes[i] = change_case(postfix, enumValueCase);
        }

        // Merging enum value postfixes with postfixes that have been removed from the enum name.
        for postfix in data.options.enumValuePostfixes {
            append(&postfixes, postfix);
        }

        export_enum_members(data, node.members, enumName, postfixes[:]);
        fmt.fprint(data.handle, "};\n");
        fmt.fprint(data.handle, "\n");
    }
}

export_structs :: proc(data : ^GeneratorData) {
    for node in data.nodes.structDefinitions {
        structName := clean_pseudo_type_name(node.name, data.options);

        replacement, found := data.options.typeReplacements[structName];
        if found {
            fmt.fprint(data.handle, structName, " :: ", replacement, ";\n");
        } else {
            fmt.fprint(data.handle, structName, " :: struct #packed {");
            export_struct_or_union_members(data, node.members);
            fmt.fprint(data.handle, "};\n");
            fmt.fprint(data.handle, "\n");
        }
    }
}

export_unions :: proc(data : ^GeneratorData) {
    for node in data.nodes.unionDefinitions {
        unionName := clean_pseudo_type_name(node.name, data.options);
        fmt.fprint(data.handle, unionName, " :: struct #raw_union {");
        export_struct_or_union_members(data, node.members);
        fmt.fprint(data.handle, "};\n");
        fmt.fprint(data.handle, "\n");
    }
}

Export_Functions_Mode :: enum {
    Top_Level,
    Pointer_In_Struct,
    Plugin_Pointers,
}

export_functions :: proc(data : ^GeneratorData, mode: Export_Functions_Mode = Export_Functions_Mode.Top_Level) {
    using Export_Functions_Mode;

    for node in data.nodes.functionDeclarations {
        functionName := clean_function_name(node.name, data.options);
        if mode == Top_Level {
            fmt.fprint(data.handle, "    @(link_name=\"", node.name, "\")\n");
        }
        fmt.fprint(data.handle, (mode == Plugin_Pointers ? "" : "    "), functionName);
        if mode == Top_Level {
            fmt.fprint(data.handle, " :: ");
        } else if mode == Pointer_In_Struct || mode == Plugin_Pointers {
            fmt.fprint(data.handle, " : ");
        }
        fmt.fprint(data.handle, mode != Top_Level ? "proc \"c\" (" : "proc(");
        parameters := clean_function_parameters(node.parameters, data.options, "    ");
        fmt.fprint(data.handle, parameters, ")");
        returnType := clean_type(node.returnType, data.options);
        if len(returnType) > 0 {
            fmt.fprint(data.handle, " -> ", returnType);
        }
        if mode == Top_Level {
            fmt.fprint(data.handle, " ---;\n");
        } else if mode == Pointer_In_Struct {
            fmt.fprint(data.handle, ",");
        } else if mode == Plugin_Pointers {
            fmt.fprint(data.handle, ";");
        }
        fmt.fprint(data.handle, "\n");
    }
}


export_enum_members :: proc(data : ^GeneratorData, members : [dynamic]EnumMember, enumName : string, postfixes : []string) {
    if (len(members) > 0) {
        fmt.fprint(data.handle, "\n");
    }
    for member in members {
        name := clean_enum_value_name(member.name, enumName, postfixes, data.options);
        if len(name) == 0 do continue;
        fmt.fprint(data.handle, "    ", name);
        if member.hasValue {
            fmt.fprint(data.handle, " = ", member.value);
        }
        fmt.fprint(data.handle, ",\n");
    }
}

export_struct_or_union_members :: proc(data : ^GeneratorData, members : [dynamic]StructOrUnionMember) {
    if (len(members) > 0) {
        fmt.fprint(data.handle, "\n");
    }
    for member in members {
        type := clean_type(member.type, data.options, "    ");
        name := clean_variable_name(member.name, data.options);
        fmt.fprint(data.handle, "    ", name, " : ");
        for dimension in member.dimensions {
            fmt.fprint(data.handle, "[", dimension, "]");
        }
        fmt.fprint(data.handle, type, ",\n");
    }
}
