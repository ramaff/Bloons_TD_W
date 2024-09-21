/// @description Insert description here
// You can write your code in this editor

with instance_create_depth(x, y, depth, obj_monkey) {
	base_tower_id = other.base_tower_id
	tower_stats = variable_clone(other.tower_stats)
	show_debug_message(tower_stats)
	if variable_struct_exists(tower_stats, "tower_sprite") {
		sprite_index = asset_get_index(tower_stats.tower_sprite)
	}
}

global.money -= tower_stats.total_cost

instance_destroy()



