package game_math

import "core:math"

INFINITY :: math.F32_MAX + 1;

clamp :: proc(val, min_val, max_val: f32) -> f32 {
    return min(max_val, max(min_val, val));
}

// thanks Unity decompiled
smooth_damp :: proc(
    current: f32,
    target: f32,
    current_velocity: ^f32,
    smooth_time: f32,
    delta_time: f32,
    max_speed: f32 = INFINITY,
) -> f32 {
    smooth_time = max(0.0001, smooth_time);
    num:f32 = 2.0 / smooth_time;
    num2:f32 = num * delta_time;
    num3:f32 = 1.0 / (1.0 + num2 + 0.48 * num2 * num2 + 0.235 * num2 * num2 * num2);
    num4:f32 = current - target;
    num5:f32 = target;
    num6:f32 = max_speed * smooth_time;
    num4 = clamp(num4, -num6, num6);
    target = current - num4;
    num7:f32 = (current_velocity^ + num * num4) * delta_time;
    current_velocity^ = (current_velocity^ - num * num7) * num3;
    num8:f32 = target + (num4 + num7) * num3;
    if (num5 - current > 0.0) == (num8 > num5) {
        num8 = num5;
        current_velocity^ = (num8 - num5) / delta_time;
    }
    return num8;
}

