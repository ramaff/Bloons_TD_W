// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_tower(_tower_id, _tower_stats){
	var _tower = obj_monkey
	if variable_struct_exists(_tower_stats, "tower_object") {
		_tower = asset_get_index(_tower_stats.tower_object)
	}
	var _id = noone;
	
	with instance_create_depth(x, y, depth, _tower) {
		base_tower_id = _tower_id
		tower_stats = variable_clone(_tower_stats)
		if variable_struct_exists(_tower_stats, "tower_sprite") {
			sprite_index = asset_get_index(_tower_stats.tower_sprite)
		}
		tower_stats.upgrade_count = [0, 0, 0, 0]
		
		_id = id;
		
		if variable_struct_exists(_tower_stats, "tower_base") {
			with instance_create_depth(x, y, depth, obj_tower_base) {
				monkey_base = _id;
				_id.tower_base = id;
				
				if variable_struct_exists(_tower_stats, "tower_base_sprite") {
					sprite_index = asset_get_index(_tower_stats.tower_base_sprite)
				}
			}
		}
	}
	return _id;

}