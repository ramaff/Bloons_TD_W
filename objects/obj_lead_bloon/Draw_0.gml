/// @description Insert description here
// You can write your code in this editor

if variable_struct_exists(bloon_stats, "shielded") {
	if bloon_stats.shielded {
		draw_sprite(asset_get_index(bloon_stats.sprite), image_index, x, y)	
	}
}

show_debug_message(sprite_index)
show_debug_message(bloon_stats.health)
show_debug_message(bloon_stats.max_health)
var _indexes = sprite_get_number(sprite_index)
image_index = _indexes - ceil(_indexes * (bloon_stats.health / bloon_stats.max_health))

draw_self()

if variable_struct_exists(bloon_stats, "tattered") {
	draw_sprite(asset_get_index(bloon_stats.tattered_sprite), image_index, x, y)	
}





