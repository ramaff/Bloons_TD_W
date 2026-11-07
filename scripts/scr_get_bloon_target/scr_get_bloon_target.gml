// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_check_if_bloon_targetable(_bloon, _tower_stats) {
	if _bloon.object_index = obj_peek_a_bloon || _bloon.object_index = obj_tack_the_ripper {
		if _bloon.image_alpha <= 0 {
			return false;	
		}
	}
	/*
	if variable_struct_exists(_bloon.bloon_stats, "camo") and !variable_struct_exists(_tower_stats, "camo_detection") {
		return false;
	}
	if variable_struct_exists(_bloon.bloon_stats, "damage_keys") {
		if !array_contains_ext(_tower_stats.damage_keys, _bloon.bloon_stats.damage_keys, true) {
			return false
		}
	}
	*/
	return true;
}

function scr_first_targeting(_bloon, _best_target_info, _tower_stats, _p_dist, _no_restrictions) {
	var _check = false
	//var _target_position = min(_bloon.path_position, 0)
	_check = _bloon.path_position >= _best_target_info.path_position
	
	if _check and (_no_restrictions || scr_check_if_bloon_targetable(_bloon, _tower_stats)) {
		_best_target_info.path_position = _bloon.path_position
		return true
	}
	
	return false
}

function scr_last_targeting(_bloon, _best_target_info, _tower_stats, _p_dist, _no_restrictions) {
	var _check = false
	//var _target_position = min(_bloon.path_position, 0)
	_check = _bloon.path_position <= _best_target_info.path_position
	
	if _check and (_no_restrictions || scr_check_if_bloon_targetable(_bloon, _tower_stats)) {
		_best_target_info.path_position = _bloon.path_position
		return true
	}
	
	return false
}

function scr_strong_targeting(_bloon, _best_target_info, _tower_stats, _p_dist, _no_restrictions) {
	var _check = false
	var _layers = 1;
	var _power_level = 1;
	
	if variable_struct_exists(_bloon.bloon_stats, "rbe") {
		_power_level = floor(_bloon.bloon_stats.layers + sqrt(_bloon.bloon_stats.rbe - _bloon.bloon_stats.layers))
	} else if variable_struct_exists(_bloon.bloon_stats, "health") {
		_power_level = floor(_bloon.bloon_stats.layers + (_bloon.bloon_stats.health - _bloon.bloon_stats.layers))
	} else {
		_power_level = _bloon.bloon_stats.layers
	}
	
	_check = _power_level > _best_target_info.bloon_power_level
	
	if _check and (_no_restrictions || scr_check_if_bloon_targetable(_bloon, _tower_stats)) {
		_best_target_info.bloon_power_level = _power_level
		return true
	} else if _power_level = _best_target_info.bloon_power_level {
		return scr_first_targeting(_bloon, _best_target_info, _tower_stats, _p_dist, _no_restrictions)
	}
	
	return false
}

function scr_close_targeting(_bloon, _best_target_info, _tower_stats, _p_dist, _no_restrictions) {
	var _check = false
	_check = _p_dist < _best_target_info.bloon_distance
	
	if _check and (_no_restrictions || scr_check_if_bloon_targetable(_bloon, _tower_stats)) {
		_best_target_info.bloon_distance = _p_dist
		return true
	}
	
	return false
}

function scr_get_bloon_target(_tower_stats, _xx = x, _yy = y, _targeting = "first", _range_boost = 0, _projectile_id = noone) {

	var _target = noone
	var _best_target_info = {
		"path_position": 0,
		"bloon_power_level": 0,
		"bloon_distance": 0
	}
	var _total_range = _tower_stats.range + _range_boost
	var _targeting_script = scr_get_targeting_script(_targeting, _best_target_info)
	
	// Loop through all bloons, put plain_sight, normal, and camo into separate lists
	// Then loop through each category in order to see if they can be targetted
	var _target_categories = {
		"plain_sight": [],
		"normal": [],
		"camo": [],
	
	}
	
	with (obj_bloon) {
		array_push(variable_struct_get(_target_categories, bloon_stats.target_category), id)
	}
	
	var _target_order = ["plain_sight", "normal", "camo"]
	var _i;
	var _specific_target_cat = "normal"
	
	for(_i = 0; _i < 3; _i++) {
		
		// Only check a category if the tower can target that category
		// If no specific targetting, break after finding the first viable candidate from a category
		// Meaning if a normal found, don't look for camos
		
		var _category_bloons = variable_struct_get(_target_categories, _target_order[_i])
		var _bloon_count = array_length(_category_bloons)
		var _j;
		for(_j = 0; _j < _bloon_count; _j++) {
			with (_category_bloons[_j]) {
				var _p_dist = distance_to_point(_xx, _yy)
				if _p_dist <= _total_range {
					if !variable_struct_exists(bloon_stats.projectile_hits, _projectile_id) and script_execute(_targeting_script, id, _best_target_info, _tower_stats, _p_dist, false) {
						_target = id;
					}
				}
			}
			if instance_exists(_target) {
				_specific_target_cat = _target_order[_i]
				break;	
			}
		}
	}
	
	/*
	with (obj_bloon) {
		var _p_dist = distance_to_point(_xx, _yy)
		if _p_dist <= _total_range {
			if !variable_struct_exists(bloon_stats.projectile_hits, _projectile_id) and script_execute(_targeting_script, id, _best_target_info, _tower_stats, _p_dist, false) {
				_target = id;
			}
		}
	} */
	
	return _target

}