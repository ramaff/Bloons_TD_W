// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_check_if_bloon_targetable(_bloon, _tower_stats) {
	if _bloon.object_index = obj_peek_a_bloon || _bloon.object_index = obj_tack_the_ripper {
		if _bloon.image_alpha <= 0 {
			return false;	
		}
	}
	if variable_struct_exists(_bloon.bloon_stats, "camo") and !variable_struct_exists(_tower_stats, "camo_detection") {
		return false;
	}
	return true;
}

function scr_first_targeting(_bloon, _best_target_info, _tower_stats) {
	var _check = false
	//var _target_position = min(_bloon.path_position, 0)
	_check = _bloon.path_position >= _best_target_info.path_position
	
	if _check and scr_check_if_bloon_targetable(_bloon, _tower_stats) {
		_best_target_info.path_position = _bloon.path_position
		return true
	}
	
	return false
}

function scr_last_targeting(_bloon, _best_target_info, _tower_stats) {
	var _check = false
	//var _target_position = min(_bloon.path_position, 0)
	_check = _bloon.path_position <= _best_target_info.path_position
	
	if _check and scr_check_if_bloon_targetable(_bloon, _tower_stats) {
		_best_target_info.path_position = _bloon.path_position
		return true
	}
	
	return false
}

function scr_strong_targeting(_bloon, _best_target_info, _tower_stats) {
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
	
	if _check and scr_check_if_bloon_targetable(_bloon, _tower_stats) {
		_best_target_info.bloon_power_level = _power_level
		return true
	} else if _power_level = _best_target_info.bloon_power_level {
		return scr_first_targeting(_bloon, _best_target_info, _tower_stats)
	}
	
	return false
}

function scr_close_targeting(_bloon, _best_target_info, _tower_stats, _p_dist) {
	var _check = false
	_check = _p_dist < _best_target_info.bloon_distance
	
	if _check and scr_check_if_bloon_targetable(_bloon, _tower_stats) {
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
	var _targeting_script = scr_first_targeting
	
	if _targeting = "last" {
		_targeting_script = scr_last_targeting
		_best_target_info.path_position = 1;
	}
	if _targeting = "strong" {
		_targeting_script = scr_strong_targeting
	}
	if _targeting = "close" {
		_targeting_script = scr_close_targeting
		_best_target_info.bloon_distance = 9999;
	}
	
	with (obj_bloon) {
		var _p_dist = distance_to_point(_xx, _yy)
		if _p_dist <= _total_range {
			if !variable_struct_exists(bloon_stats.projectile_hits, _projectile_id) and script_execute(_targeting_script, id, _best_target_info, _tower_stats, _p_dist) {
				_target = id;
			}
		}
	}
	
	return _target

}