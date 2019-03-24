package reflect

import "core:fmt"
using import "core:runtime"
import "core:unicode/utf8"

get_field_by_name :: proc(a: any, field: string, recurse := false) -> any {
    type_info := type_info_base(type_info_of(a.id));

    if ti_struct, ok := type_info.variant.(Type_Info_Struct); ok {
        for name, i in ti_struct.names {
            if name == field {
                b := any{
                    rawptr(uintptr(a.data) + ti_struct.offsets[i]),
                    ti_struct.types[i].id,
                };

                return b;
            }

            if ti_struct.usings[i] {
                b := any{
                    rawptr(uintptr(a.data) + ti_struct.offsets[i]),
                    ti_struct.types[i].id,
                };

                if recurse {
                    if res := get_field_by_name(b, field); res != nil {
                        return res;
                    }
                }
            }
        }
    }

    return nil;
}

get_field_by_type_info :: proc(a: any, ti: ^Type_Info, recurse := false) -> any {
    type_info := type_info_of(a.id);

    if ti == type_info {
        return a;
    }

    type_info = type_info_base(type_info);

    if ti == type_info {
        return a;
    }

    if ti_struct, ok := type_info.variant.(Type_Info_Struct); ok {
        for typ, i in ti_struct.types {
            if typ == ti {
                b := any {
                    rawptr(uintptr(a.data) + ti_struct.offsets[i]),
                    typ.id,
                };

                return b;
            }

            if ti_struct.usings[i] {
                b := any {
                    rawptr(uintptr(a.data) + ti_struct.offsets[i]),
                    typ.id,
                };

                if recurse {
                    if res := get_field_by_type_info(b, ti); res != nil {
                        return res;
                    }
                }
            }
        }
    }

    return nil;
}

get_field_by_typeid :: proc(a: any, id: typeid, recurse := false) -> any {
    return inline get_field_by_type_info(a, type_info_of(id), recurse);
}

get_field_by_type :: proc(a: any, $T: typeid, recurse := false) -> ^T {
    return (^T)((inline get_field_by_type_info(a, type_info_of(T), recurse)).data);
}

get_field_by_name_fancy :: proc(a: any, name: string) -> any {
    split :: proc(str: string, char: rune) -> []string {
        strs: [dynamic]string;

        start, index := 0, 0;
        for {
            c, skip := utf8.decode_rune_in_string(str[index:]);

            if c == char {
                append(&strs, str[start:index]);
                start = index + skip;
            }
            else if c == utf8.RUNE_ERROR {
                append(&strs, str[start:index]);
                break;
            }

            index += skip;
        }

        return strs[:];
    }

    names := split(name, '.');
    defer delete(names);

    for _name in names {
        if a = get_field_by_name(a, _name); a == nil {
            break;
        }
    }

    return a;
}

main :: proc() {
    Test :: struct {
        foo: int,
        bar: string,
        baz: f64,
        bag: struct {
            lag: string,
        }
    };

    foo := get_field_by_name_fancy(Test{123, "Saluton", 15.4, {"floop"}}, "bag.lag");
    fmt.println(foo);

    bar := get_field_by_type(Test{123, "Saluton", 15.4, {}}, string)^;
    fmt.println(bar);
}
