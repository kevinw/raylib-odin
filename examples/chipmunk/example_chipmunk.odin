package example_chipmunk

import cp "../../ext/chipmunk"
import "core:fmt"

main :: proc() {
    fmt.println("hello, chipmunk");
    body := cp.body_new(5.5, 4.4);
    fmt.println("body", body);
}
