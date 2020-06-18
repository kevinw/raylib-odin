package json_ext

import "core:encoding/json"
import "core:fmt"
import "core:mem"
import "core:os"
import "core:reflect"
import "core:runtime"

unmarshal :: proc{unmarshal_value_to_struct_ptr, unmarshal_value_to_any, unmarshal_value_to_type};

unmarshal_value_to_struct_ptr :: proc(p: ^$T, value: json.Value, spec := json.Specification.JSON) -> bool {
    a := any{rawptr(p), typeid_of(T)};
    return unmarshal(a, value, spec);
}

unmarshal_value_to_any :: proc(data: any, value: json.Value, spec := json.Specification.JSON) -> bool {
    type_info := reflect.type_info_base(type_info_of(data.id));
    type_info  = reflect.type_info_base(type_info); // @todo: dirty fucking hack, won't hold up

    #partial switch v in value.value {
    case json.Object:
        #partial switch variant in type_info.variant {
        case runtime.Type_Info_Struct:
            for field, i in variant.names {
                // @todo: stricter type checking and by-order instead of by-name as an option
                a := any{rawptr(uintptr(data.data) + uintptr(variant.offsets[i])), variant.types[i].id};
                if !unmarshal(a, v[field], spec) do return false; // @error
            }

            return true; 
        
        case runtime.Type_Info_Map:
            // @todo: implement. ask bill about this, maps are a daunting prospect because they're fairly opaque
            fmt.eprintln("TODO: Type_Info_Map not implemented yet");
            return false;

        case:
            fmt.eprintln("JSON error: unhandled type_info.variant", variant);
            return false;
        }

    case json.Array:
        #partial switch variant in type_info.variant {
        case runtime.Type_Info_Array:
            if len(v) > variant.count {
                fmt.eprintln("len of array wrong");
                return false; // @error
            }

            for i in 0..variant.count-1 {
                a := any{rawptr(uintptr(data.data) + uintptr(variant.elem_size * i)), variant.elem.id};
                if !unmarshal(a, v[i], spec) do return false; // @error
            }

            return true;

        case runtime.Type_Info_Slice:
            array := (^mem.Raw_Slice)(data.data);

            if len(v) > array.len {
                fmt.eprintln("slice length wrong");
                return false; // @error
            }
            array.len = len(v);

            for i in 0..array.len {
                a := any{rawptr(uintptr(array.data) + uintptr(variant.elem_size * i)), variant.elem.id};
                if !unmarshal(a, v[i], spec) do return false; // @error
            }

            return true;

        case runtime.Type_Info_Dynamic_Array:
            array := (^mem.Raw_Dynamic_Array)(data.data);

            if array.cap == 0 {
                array.data      = mem.alloc(len(v)*variant.elem_size);
                array.cap       = len(v);
                array.allocator = context.allocator;
            }

            if len(v) > array.cap {
                context = mem.context_from_allocator(array.allocator);
                mem.resize(array.data, array.cap, len(v)*variant.elem_size);
            }

            array.len = len(v);

            for i in 0..array.len-1 {
                a := any{rawptr(uintptr(array.data) + uintptr(variant.elem_size * i)), variant.elem.id};
                if !unmarshal(a, v[i], spec) do return false; // @error
            }

            return true;

        case:
            fmt.eprintln("unhandled variant for Array:", variant);
            return false; // @error
        }

    case json.String:
        #partial switch variant in type_info.variant {
        case runtime.Type_Info_String:
            tmp := string(v);
            mem.copy(data.data, &tmp, size_of(string));

            return true;

        case runtime.Type_Info_Enum:
            for name, i in variant.names {
                if name == string(v) {
                    val := variant.values[i];
                    mem.copy(data.data, &val, size_of(val));
                    return true;
                }
            }
        case:
            fmt.eprintln("unhandled String variant", variant);
            return false;
        }

    case json.Integer:
        #partial switch variant in type_info.variant {
        case runtime.Type_Info_Integer:
            switch type_info.size {
            case 8:
                tmp := i64(v);
                mem.copy(data.data, &tmp, type_info.size);

            case 4:
                tmp := i32(v);
                mem.copy(data.data, &tmp, type_info.size);

            case 2:
                tmp := i16(v);
                mem.copy(data.data, &tmp, type_info.size);

            case 1:
                tmp := i8(v);
                mem.copy(data.data, &tmp, type_info.size);

            case:
                fmt.eprintln("unhandled integer size", type_info.size);
                return false; // @error
            }

            return true;

        case runtime.Type_Info_Enum:
            return unmarshal(any{data.data, variant.base.id}, value, spec);

        case:
            fmt.eprintln("Unhandled Integer variant", variant);
            return false;
        }

    case json.Float:
        if _, ok := type_info.variant.(runtime.Type_Info_Float); ok {
            switch type_info.size {
            case 8:
                tmp := f64(v);
                mem.copy(data.data, &tmp, type_info.size);

            case 4:
                tmp := f32(v);
                mem.copy(data.data, &tmp, type_info.size);

            case:
                fmt.eprintln("Unhandled Float type_info.size", type_info.size);
                return false; // @error
            }

            return true;
        }

        fmt.eprintln("expected a float in the struct");
        return false; // @error

    case json.Boolean:
        if _, ok := type_info.variant.(runtime.Type_Info_Boolean); ok {
            tmp := bool(v);
            mem.copy(data.data, &tmp, type_info.size);

            return true;
        }

        fmt.eprintln("expected a boolean in the struct");
        return false; // @error

    case json.Null:
        mem.set(data.data, 0, type_info.size);
        return true;
    
    case:
        fmt.eprintln("unhandled value type", v);
        return false; // @error
    }

    panic("Unreachable code.");
}

unmarshal_value_to_type :: inline proc($T: typeid, value: json.Value, spec := json.Specification.JSON) -> (T, bool) {
    tmp: T;
    ok := unmarshal(tmp, value, spec);
    return tmp, ok;
}

parse_file :: inline proc(path: string, spec := json.Specification.JSON) -> (value: json.Value, ok: bool) {
    if bytes, ok2 := os.read_entire_file(path); ok2 {
        val, err := json.parse(bytes, spec);
        value = val;
        ok = err == .None;
        return;
    }

    fmt.eprintln("could not read_entire_file", path);
    value = json.Value {};
    ok = false;
    return;
}

unmarshal_file :: proc{unmarshal_file_to_struct_ptr, unmarshal_file_to_any, unmarshal_file_to_type};

unmarshal_file_to_struct_ptr :: inline proc(p: ^$T, path: string, spec := json.Specification.JSON) -> bool {
    if value, ok := parse_file(path, spec); ok {
        return unmarshal(p, value, spec);
    }
    return false;
}

unmarshal_file_to_any :: inline proc(data: any, path: string, spec := json.Specification.JSON) -> bool {
    if value, ok := parse_file(path, spec); ok {
        return unmarshal(data, value, spec);
    }
    return false;
}

unmarshal_file_to_type :: inline proc($T: typeid, path: string, spec := json.Specification.JSON) -> (T, bool) {
    if value, ok := parse_file(path, spec); ok {
        return unmarshal(T, value, spec);
    }

    return T{}, false;
}

