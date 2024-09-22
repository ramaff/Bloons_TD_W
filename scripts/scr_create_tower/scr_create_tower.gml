// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_tower(_tower_id, _tower_stats){
	with instance_create_depth(x, y, depth, obj_monkey) {
		base_tower_id = _tower_id
		tower_stats = variable_clone(_tower_stats)
		if variable_struct_exists(_tower_stats, "tower_sprite") {
			sprite_index = asset_get_index(_tower_stats.tower_sprite)
		}
		tower_stats.upgrade_count = [0, 0, 0]
	}

}