/// @description Insert description here
// You can write your code in this editor


var _indexes = sprite_get_number(sprite_index)
image_index = _indexes - ceil(_indexes * (bloon_stats.health / bloon_stats.max_health))

image_angle = direction;

if variable_struct_exists(bloon_stats, "shielded") {
	if bloon_stats.shielded {
		draw_sprite_ext(asset_get_index(bloon_stats.sprite), image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)	
	}
}

draw_self()




