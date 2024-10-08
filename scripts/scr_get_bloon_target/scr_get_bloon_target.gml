// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_bloon_target(_tower_stats, _xx = x, _yy = y){

	var _target = noone
	var _furthest_position = 0;
	/*if variable_struct_exists(tower_stats, "minimum_range") {
		with (obj_bloon) {
			var _p_dist = distance_to_point(_xx, _yy)
			if _p_dist <= _tower_stats.range and _p_dist >= _tower_stats.minimum_range and path_position > _furthest_position {
				_target = id;
			}
		}
	} else { */
	
		with (obj_bloon) {
			var _p_dist = distance_to_point(_xx, _yy)
			if _p_dist <= _tower_stats.range and path_position > _furthest_position {
				_target = id;
			}
		}
	// }
	
	return _target

}