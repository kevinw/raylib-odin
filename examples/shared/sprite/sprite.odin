package sprite

import "core:fmt"

using import "../../../raylib_types"
using import "../../../raylib_bridge"

Sprite :: struct {
    texture: Texture,
    pos: Vector2,
    rotation: f32,
    scale: f32,
    tint: Color,
    animations: []Anim,
    current_anim: ^Anim,
}

Anim :: struct {
    name: string,
    rects: []Rectangle,
}

Anim_destroy :: proc(using anim: ^Anim) {
    delete(rects);
}

destroy :: proc(using sprite: ^Sprite) {
    unload_texture(texture);
    free(sprite);
}

draw_many :: proc(sprites: []Sprite) {
    for _, i in sprites {
        sprite := &sprites[i];
        using sprite;

        draw_texture_ex(texture, pos, rotation, scale, tint);
    }
}

play_anim :: proc(using sprite: ^Sprite, anim_name: string) {
    anim: ^Anim;
    found := false;

    for _, i in animations {
        if animations[i].name == anim_name {
            anim = &animations[i];
            found = true;
            break;
        }
    }

    if !found {
        fmt.println_err("WARNING: animation", anim_name, "doesn't exist");
        return;
    }

    current_anim = anim;
}
