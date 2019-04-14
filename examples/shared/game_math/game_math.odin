package game_math

import "core:math"

INFINITY :: math.F32_MAX + 1;

saturate :: proc(f: f64) -> f64 {
    if f < 0 do return 0;
    if f > 1 do return 1;
    return f;
}

repeat_scalar :: proc(t, length: f32) -> f32 {
    return clamp(t - math.floor(t / length) * length, 0.0, length);
}

repeat_vec :: proc(t, length: $T/[$N]$E) -> T {
    res: T;
    for i in 0..N-1 do res[i] = clamp(t[i] - math.floor(t[i] / length[i]) * length[i], 0.0, length[i]);
    return res;
}

repeat :: proc { repeat_scalar, repeat_vec };

clamp :: proc(val, min_val, max_val: f32) -> f32 {
    return min(max_val, max(min_val, val));
}

is_nonzero :: inline proc(v: $T/[$N]$E) -> bool {
    for i in 0..N-1 {
        if v[i] > 0 || v[i] < 0 {
            return true;
        }
    }

    return false;
}

add_to :: inline proc(a: ^$T/[$N]$E, b: T) {
    for i in 0..N-1 do a[i] = a[i] + b[i];
}


scale_vec :: proc(a, b: $T/[$N]$E) -> T {
    res: T;
    for i in 0..N-1 do res[i] = a[i] * b[i];
    return res;
}

scale_scalar :: proc(a: $T/[$N]$E, scalar: f32) -> T {
    res: T;
    for i in 0..N-1 do res[i] = a[i] * scalar;
    return res;
}

scale :: proc { scale_vec, scale_scalar };

max_vec :: proc(a, b: $T/[$N]$E) -> T {
    res: T;
    for i in 0..N-1 do res[i] = max(a[i], b[i]);
    return res;
}

min_vec :: proc(a, b: $T/[$N]$E) -> T {
    res: T;
    for i in 0..N-1 do res[i] = min(a[i], b[i]);
    return res;
}

clamp_vec :: proc(val, min_val, max_val: $R) -> R {
    return min_vec(max_val, max_vec(min_val, val));
}


unlerp :: proc(ax, a1, a2: f64) -> f64 {
    return (ax - a1) / (a2 - a1);
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

