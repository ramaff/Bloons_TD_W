// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_tower(_tower_id, _tower_stats){
	var _tower = obj_monkey
	if variable_struct_exists(_tower_stats, "tower_object") {
		_tower = asset_get_index(_tower_stats.tower_object)
	}
	var _id = noone;
	
	var _xx = x;
	var _yy = y;
	
	with instance_create_depth(x, y, depth, _tower) {
		base_tower_id = _tower_id
		tower_stats = variable_clone(_tower_stats)
		variable_struct_set(tower_stats, "id", id);
		if variable_struct_exists(_tower_stats, "tower_sprite") {
			sprite_index = asset_get_index(_tower_stats.tower_sprite)
		}
		tower_stats.stun_heal_fac = 1;
		tower_stats.upgrade_count = [0, 0, 0, 0]
		tower_stats.active_upgrades = {}
		if !variable_struct_exists(tower_stats, "damage_keys") {
			tower_stats.damage_keys = []
		}
		tower_stats.total_upgrade_stats = {
			"pierce": 0,
			"delay": 99999,
			"pierce_add": 0,
			"pierce_multiplier": 1,
			"shot_count_multiplier": 1,
			"fire_rate_multiplier": 1,
			"range": 0,
			"lifespan": 0,
			"camo_detection": false,
			"lead_hit": false
		}
		
		_id = id;
		tower_base = noone;
		
		if variable_struct_exists(_tower_stats, "tower_base") {
			with instance_create_depth(_xx, _yy, depth, obj_tower_base) {
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