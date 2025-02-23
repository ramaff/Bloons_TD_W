/// @description Insert description here
// You can write your code in this editor

if variable_struct_exists(bloon_stats, "float to track") {
	draw_sprite(spr_shadow, 0, x, y + bloon_stats.float_height)
}

if variable_struct_exists(bloon_stats, "shielded") {
	if bloon_stats.shielded {
		draw_sprite(asset_get_index(bloon_stats.sprite), image_index, x, y)	
	}
}


draw_self()

if variable_struct_exists(bloon_stats, "tattered") {
	if variable_struct_exists(bloon_stats, "tattered_sprite") {
		draw_sprite(asset_get_index(bloon_stats.tattered_sprite), image_index, x, y)	
	}
}

if variable_struct_exists(bloon_stats, "freeze") {
	if variable_struct_exists(bloon_stats, "freeze_sprite") {
		draw_sprite(asset_get_index(bloon_stats.freeze_sprite), image_index, x, y)	
	}
}
if variable_struct_exists(bloon_stats, "goop") {
	if variable_struct_exists(bloon_stats, "goop_sprite") {
		draw_sprite(asset_get_index(bloon_stats.goop_sprite), image_index, x, y)	
	} 
}



