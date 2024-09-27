// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_upgrade_monkey(_monkey, _upgrade_stats, _path) {

	var _original_value = _monkey.tower_stats.total_cost
	var _tower_stats = _monkey.tower_stats;
	
	if variable_struct_exists(_upgrade_stats, "upgrade_script") {
		with(_monkey) {
			script_execute(_upgrade_stats.upgrade_script)
		}
	}
	
	var _projectile_count = array_length(_tower_stats.projectile_stats)
	
	if variable_struct_exists(_upgrade_stats, "projectile_stats") {
		var _upgrade_projectile_count = array_length(_upgrade_stats.projectile_stats)
		for(var _i = 0; _i < _upgrade_projectile_count; _i++) {
			_tower_stats.projectile_stats[_projectile_count + _i] = variable_clone(_tower_stats.projectile_stats[0])
			_tower_stats.projectile_stats[_projectile_count + _i].speed = _upgrade_stats.projectile_stats[_upgrade_projectile_count].speed
		}
	}
	
	// Here we update the stats for all the projectiles
	for(var _i = 0; _i < _projectile_count; _i++) {
		
		if variable_struct_exists(_upgrade_stats, "pierce_multiplier") {
			_tower_stats.projectile_stats[_i].pierce = _tower_stats.projectile_stats[_i].pierce * _upgrade_stats.pierce_multiplier
		}
		if variable_struct_exists(_upgrade_stats, "shot_count_multiplier") {
			_tower_stats.projectile_stats[_projectile_count + _i] = _tower_stats.projectile_stats[_i]
		}
		
		if variable_struct_exists(_upgrade_stats, "pierce") {
			_tower_stats.projectile_stats[_i].pierce += _upgrade_stats.pierce;
		}
		if variable_struct_exists(_upgrade_stats, "lifespan") {
			_tower_stats.projectile_stats[_i].lifespan += _upgrade_stats.lifespan;
		}
	}
	
	if variable_struct_exists(_upgrade_stats, "firerate_multiplier") {
		_tower_stats.delay = _tower_stats.delay / _upgrade_stats.firerate_multiplier
	}
	
	if variable_struct_exists(_upgrade_stats, "range") {
		_tower_stats.range += _upgrade_stats.range;
	}
	
	if variable_struct_exists(_upgrade_stats, "camo_detection") {
		_tower_stats.camo_detection = _upgrade_stats.camo_detection;
	}

	//_monkey.tower_stats = _new_stats
	
	_tower_stats.total_cost += _upgrade_stats.upgrade_cost
	_tower_stats.upgrade_count[_path]++;

}