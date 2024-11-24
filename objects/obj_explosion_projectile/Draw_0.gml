/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
//event_inherited();

draw_sprite_ext(sprite_index, image_index, x, y, projectile_stats.size, projectile_stats.size, image_angle, image_blend, image_alpha)

image_xscale = lerp(image_xscale, projectile_stats.size, 0.5)
image_yscale = lerp(image_xscale, projectile_stats.size, 0.5)
