/// @description Insert description here
// You can write your code in this editor

if !instance_exists(target) {
	exit;
}
var _indexes = sprite_get_number(sprite_index)
image_index = _indexes - ceil(_indexes * (bloon_stats.health / bloon_stats.max_health))

depth = target.depth + 1;

draw_sprite(spr_shadow, 0, x, y + height)

draw_sprite_ext(spr_hot_air_bloon_bottom, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha)

depth = target.depth - 1;

// Inherit the parent event
event_inherited();
