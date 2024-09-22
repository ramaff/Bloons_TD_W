// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_upgrade_monkey(_monkey, _upgrade_stats, _path) {

	var _original_value = _monkey.tower_stats.total_cost
	var _tower_stats = _monkey.tower_stats;
	
	// Here we update the stats for all the projectiles
	var _projectile_count = array_length(_tower_stats.projectile_stats)
	for(var _i = 0; _i < _projectile_count; _i++) {
		
		if variable_struct_exists(_upgrade_stats, "pierce_multiplier") {
			_tower_stats.projectile_stats[_i].pierce = _tower_stats.projectile_stats[_i].pierce * _upgrade_stats.pierce_multiplier
		}
		if variable_struct_exists(_upgrade_stats, "firerate_multiplier") {
			_tower_stats.delay = _tower_stats.delay / _upgrade_stats.firerate_multiplier
		}
		if variable_struct_exists(_upgrade_stats, "shot_count_multiplier") {
			_tower_stats.projectile_stats[_projectile_count + _i] = _tower_stats.projectile_stats[_i]
		}
	}

	//_monkey.tower_stats = _new_stats
	
	_tower_stats.total_cost += _upgrade_stats.upgrade_cost
	_tower_stats.upgrade_count[_path]++;

}