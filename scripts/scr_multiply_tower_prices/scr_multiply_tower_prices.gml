// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_multiply_tower_prices(_mult = 1, _tower_stats = tower_stats){
	
	_tower_stats.total_cost = _tower_stats.total_cost * _mult;
	if variable_struct_exists(_tower_stats, "price_multiplier") {
		_tower_stats.price_multiplier = _tower_stats.price_multiplier * _mult;
	} else {
		variable_struct_set(_tower_stats, "price_multiplier", _mult);	
	}
		
	var _upgrades = _tower_stats.upgrades;
	var _path_count = array_length(_upgrades);
	var _j = 0;
		
	for(_j = 0; _j < _path_count; _j++) {
		var _path = _upgrades[_j];
		var _upg_count = array_length(_path)
		var _k = 0;
			
		for(_k = 0; _k < _upg_count; _k++) {
			_path[_k].upgrade_cost = _path[_k].upgrade_cost * _mult;
		}
		
	}
		
	_upgrades = _tower_stats.split_upgrades;
	_path_count = array_length(_upgrades);
	_j = 0;
		
	for(_j = 0; _j < _path_count; _j++) {
		var _path = _upgrades[_j];
		var _upg_count = array_length(_path)
		var _k = 0;
			
		for(_k = 0; _k < _upg_count; _k++) {
			_path[_k].upgrade_cost = _path[_k].upgrade_cost * _mult;
		}
		
	}

}