package sprite

import "core:fmt"

using import "../../../raylib/bridge"

import "../../shared/game_math"

Sprite :: struct {
    pos: Vector2,
    rotation: f32,
    scale: f32,
    tint: Color,
    flip_x: bool,
    flip_y: bool,
    animations: []Anim,
    current_anim: ^Anim,
}

Anim :: struct {
    name: string,
    texture: Texture,
    rects: []Rectangle,
    fps: f32,
    current_time: f32,
}

Anim_destroy :: proc(using anim: ^Anim) {
    delete(rects);
}

Rectangle_scale :: proc(rec: Rectangle, xscale, yscale: f32) -> Rectangle { 
    return Rectangle {rec.x, rec.y, rec.width*xscale, rec.height*yscale};
}

destroy :: proc(using sprite: ^Sprite) {
}

update_many :: proc(sprites: []Sprite, delta_time: f32) {
    for _, i in sprites {
        if sprites[i].current_anim != nil {
            sprites[i].current_anim.current_time += delta_time;
        }
    }
}

rects_from_horizontal_texture :: proc(width: f32, height: f32, num_frames: uint, allocator := context.allocator) -> []Rectangle {

    rects := make([]Rectangle, num_frames, allocator);

    x :f32 = 0.0;
    w := width / cast(f32)num_frames;

    for i in 0..num_frames-1 {
        rects[i] = Rectangle {x, 0, w, height};
        x += w;
    }

    return rects;
}

current_rect_index :: inline proc(using sprite: ^Sprite) -> int {
    return cast(int)game_math.repeat(
        current_anim.current_time * current_anim.fps, cast(f32)len(current_anim.rects));
}

current_rect :: proc(using sprite: ^Sprite) -> Rectangle {
    rect_index := current_rect_index(sprite);
    return current_anim.rects[rect_index];
}

draw_many :: proc(sprites: []Sprite) {
    for _, i in sprites {
        sprite := &sprites[i];
        using sprite;

        origin := Vector2 { 0, 0 };
        source_rect := current_anim.rects[current_rect_index(sprite)];
        dest_rect := Rectangle { pos.x, pos.y, source_rect.width, source_rect.height };

        scale_x := f32(flip_x ? -1 : 1);
        scale_y := f32(flip_y ? -1 : 1);

        source_rect = Rectangle_scale(source_rect, scale_x, scale_y);

        draw_texture_pro(
            current_anim.texture, 
            source_rect,
            dest_rect,
            origin,
            rotation,
            tint);

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
