/// @description Insert description here
// You can write your code in this editor

var _towers = towers
var _blocked_towers = blocked_towers

var _max_10k_pops = false;
var _no_odd_round_towers = false;

if instance_exists(obj_lawyer_bloon_blue) {
	_max_10k_pops = true
}
if instance_exists(obj_lawyer_bloon_green) {
	_no_odd_round_towers = true
}

with (obj_monkey) {
	if !variable_struct_exists(_towers, string(id)) {
		var _tower_info = {
			"round": global.round,
			"id": id
		}
		variable_struct_set(_towers, string(id), _tower_info);
	}
}

var _tracked_tower_keys = struct_get_names(_towers)
var _tracked_towers_count = array_length(_tracked_tower_keys)

var _i = 0;

for(_i = 0; _i < _tracked_towers_count; _i++) {
	var _tracked_tower = variable_struct_get(_towers, _tracked_tower_keys[_i]);
	var _tower = _tracked_tower.id
	
	if !instance_exists(_tower) {
		continue
	}
	
	if _max_10k_pops = true {
		if _tower.pop_count >= 10000 {
			variable_struct_set(_blocked_towers, string(_tower.id), _tower.id)
		}
	}
	if _no_odd_round_towers = true {
		if _tracked_tower.round mod 2 = 1 {
			variable_struct_set(_blocked_towers, string(_tower.id), _tower.id)
		}
	}
}

