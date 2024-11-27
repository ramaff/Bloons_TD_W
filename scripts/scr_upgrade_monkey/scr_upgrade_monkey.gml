// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_upgrade_monkey(_monkey, _upgrade_stats, _path) {

	var _original_value = _monkey.tower_stats.total_cost
	var _tower_stats = _monkey.tower_stats;
	
	//_tower_stats = scr_merge_struct(_tower_stats, _upgrade_stats, false)
	
	if !variable_struct_exists(_tower_stats, "active_upgrades") {
		_tower_stats.active_upgrades = {}
	}
	variable_struct_set(_tower_stats.active_upgrades, _upgrade_stats.keyword, true)
	
	if !variable_struct_exists(_tower_stats, "abilities") {
		_tower_stats.abilities = {}
	}
	if variable_struct_exists(_upgrade_stats, "abilities") {
		_tower_stats.abilities = scr_merge_struct(_tower_stats.abilities, _upgrade_stats.abilities)
	}
	if variable_struct_exists(_upgrade_stats, "health") {
		_tower_stats.health += _upgrade_stats.health;
	}
	if variable_struct_exists(_upgrade_stats, "max_health") {
		_tower_stats.max_health += _upgrade_stats.max_health;
	}
	
	if variable_struct_exists(_upgrade_stats, "attack_barrages") {
		_tower_stats.attack_barrages += _upgrade_stats.attack_barrages;
	}
	
	if variable_struct_exists(_upgrade_stats, "tower_attack_script") {
		_tower_stats.tower_attack_script = _upgrade_stats.tower_attack_script
	}
	
	if variable_struct_exists(_upgrade_stats, "tower_sprite") {
		_tower_stats.tower_sprite = _upgrade_stats.tower_sprite
		_monkey.sprite_index = asset_get_index(_tower_stats.tower_sprite)
	}

	
	var _projectile_count = array_length(_tower_stats.projectile_stats)
	
	if variable_struct_exists(_upgrade_stats, "projectile_stats") {
		var _starting_index = _projectile_count;
		if variable_struct_exists(_upgrade_stats, "projectile_replacement") {
			if _upgrade_stats.projectile_replacement {
				_tower_stats.projectile_stats = []	
				_starting_index = 0;
			}
		}
		var _upgrade_projectile_count = array_length(_upgrade_stats.projectile_stats)
		for(var _i = 0; _i < _upgrade_projectile_count; _i++) {
			_tower_stats.projectile_stats[_starting_index + _i] = variable_clone(_upgrade_stats.projectile_stats[_i])
			_tower_stats.projectile_stats[_starting_index + _i].speed = _upgrade_stats.projectile_stats[_i].speed
		}
	}
	
	// Here we update the stats for all the projectiles
	for(var _i = 0; _i < _projectile_count; _i++) {
		
		if variable_struct_exists(_upgrade_stats, "projectile_sprite") {
			_tower_stats.projectile_stats[_i].sprite = _upgrade_stats.projectile_sprite
		}
		if variable_struct_exists(_upgrade_stats, "pierce_multiplier") {
			_tower_stats.projectile_stats[_i].pierce = _tower_stats.projectile_stats[_i].pierce * _upgrade_stats.pierce_multiplier
		}
		if !variable_struct_exists(_tower_stats.projectile_stats[_i], "projectile_count") {
			_tower_stats.projectile_stats[_i].projectile_count = 1;
		}
		if variable_struct_exists(_upgrade_stats, "shot_count_multiplier") {
			_tower_stats.projectile_stats[_i].projectile_count = _tower_stats.projectile_stats[_i].projectile_count * _upgrade_stats.shot_count_multiplier
			if !variable_struct_exists(_tower_stats.projectile_stats[_i], "projectile_spread") {
				_tower_stats.projectile_stats[_i].projetile_spread = 15;
			}
		}
		if variable_struct_exists(_upgrade_stats, "shot_count") {
			_tower_stats.projectile_stats[_i].projectile_count += _upgrade_stats.shot_count
			if !variable_struct_exists(_tower_stats.projectile_stats[_i], "projectile_spread") {
				_tower_stats.projectile_stats[_i].projetile_spread = 15;
			}
		}
		
		if variable_struct_exists(_upgrade_stats, "pierce") {
			_tower_stats.projectile_stats[_i].pierce += _upgrade_stats.pierce;
		}
		if variable_struct_exists(_upgrade_stats, "lifespan") {
			_tower_stats.projectile_stats[_i].lifespan += _upgrade_stats.lifespan;
		}
	}
	
	if variable_struct_exists(_upgrade_stats, "additional_attacks") {
		if !variable_struct_exists(_tower_stats, "additional_attacks") {
			_tower_stats.additional_attacks = []
		}
		_tower_stats.additional_attacks = array_concat(_tower_stats.additional_attacks, _upgrade_stats.additional_attacks)
	}
	
	if variable_struct_exists(_upgrade_stats, "fire_rate_multiplier") {
		_tower_stats.delay = _tower_stats.delay / _upgrade_stats.fire_rate_multiplier
	}
	
	if variable_struct_exists(_upgrade_stats, "range") {
		_tower_stats.range += _upgrade_stats.range;
	}
	
	if variable_struct_exists(_upgrade_stats, "camo_detection") {
		_tower_stats.camo_detection = _upgrade_stats.camo_detection;
	}
	
	if variable_struct_exists(_upgrade_stats, "upgrade_script") {
		with(_monkey) {
			script_execute(_upgrade_stats.upgrade_script)
		}
	}

	//_monkey.tower_stats = _new_stats
	
	_tower_stats.total_cost += _upgrade_stats.upgrade_cost
	_tower_stats.upgrade_count[_path]++;

}