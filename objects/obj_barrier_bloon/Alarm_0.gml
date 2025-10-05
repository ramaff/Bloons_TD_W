/// @description Insert description here
// You can write your code in this editor

alarm[0] = 240;

with instance_create_depth(x, y, depth, obj_heal_bloon_aura) {
	alarm[0] = 20;

	image_xscale = 2;
	image_yscale = 2;

	shield_range = 110;

	with(obj_bloon) {
		if distance_to_point(other.x, other.y) < other.shield_range {
			if variable_struct_exists(bloon_stats, "shielded") {
				bloon_stats.shield_health += 1;
			} else {
				variable_struct_set(bloon_stats, "shielded", true)
				array_push(bloon_stats.properties, "shielded")
				if variable_struct_exists(bloon_stats, "shielded_sprite") {
					sprite_index = asset_get_index(bloon_stats.shielded_sprite);
				}
				bloon_stats.shield_health = 1;
			}
		}
	}
}




