// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_update_tower_stats(_original_stat, _upgrade_stats) {
	
	if !variable_struct_exists(_original_stat, "fire_rate_multiplier") {
		_original_stat.fire_rate_multiplier = 1;
	}
	
	if variable_struct_exists(_upgrade_stats, "fire_rate_multiplier") {
		_original_stat.delay = _original_stat.delay / _upgrade_stats.fire_rate_multiplier
		_original_stat.fire_rate_multiplier = _original_stat.fire_rate_multiplier * _upgrade_stats.fire_rate_multiplier
		/*if variable_struct_exists(_tower_stats, "additional_attacks") {
			for(_i = 0; _i < array_length(_tower_stats.additional_attacks); _i++) {
				var _attack = _tower_stats.additional_attacks[_i];
				_attack.delay = _attack.delay / _upgrade_stats.fire_rate_multiplier
			}
		} */
	}
	if variable_struct_exists(_upgrade_stats, "range") {
		_original_stat.range += _upgrade_stats.range;
	}
	
	if variable_struct_exists(_upgrade_stats, "camo_detection") {
		_original_stat.camo_detection = _upgrade_stats.camo_detection;
	}
	
}

function scr_update_projectile_stats(_original_stat, _upgrade_stats) {
	
	
	if !variable_struct_exists(_original_stat, "projectile_count") {
		_original_stat.projectile_count = 1;
	}
	if !variable_struct_exists(_original_stat, "pierce_add") {
		_original_stat.pierce_add = 0;
	}
	if !variable_struct_exists(_original_stat, "pierce_multiplier") {
		_original_stat.pierce_multiplier = 1;
	}
	if !variable_struct_exists(_original_stat, "shot_count_multiplier") {
		_original_stat.shot_count_multiplier = 1;
	}
	if !variable_struct_exists(_original_stat, "projectile_spread") {
		_original_stat.projectile_spread = 15;
	}
	
	if variable_struct_exists(_upgrade_stats, "projectile_sprite") {
		_original_stat.sprite = _upgrade_stats.projectile_sprite
	}
	if variable_struct_exists(_upgrade_stats, "pierce_multiplier") {
		_original_stat.pierce = _original_stat.pierce * _upgrade_stats.pierce_multiplier
		_original_stat.pierce_multipler = _original_stat.pierce_multiplier * _upgrade_stats.pierce_multiplier
	}
	if variable_struct_exists(_upgrade_stats, "shot_count_multiplier") {
		_original_stat.projectile_count = _original_stat.projectile_count * _upgrade_stats.shot_count_multiplier
		_original_stat.shot_count_multiplier = _original_stat.shot_count_multiplier * _upgrade_stats.shot_count_multiplier
	}
	if variable_struct_exists(_upgrade_stats, "shot_count") {
		_original_stat.projectile_count += _upgrade_stats.shot_count
	}
		
	if variable_struct_exists(_upgrade_stats, "pierce_add") {
		_original_stat.pierce += _upgrade_stats.pierce_add;
		_original_stat.pierce_add += _upgrade_stats.pierce_add;
	}
	if variable_struct_exists(_upgrade_stats, "lifespan") {
		_original_stat.lifespan += _upgrade_stats.lifespan;
	}
	if variable_struct_exists(_upgrade_stats, "camo_detection") {
		_original_stat.camo_detection = _upgrade_stats.camo_detection;
	}
	
}

function scr_upgrade_monkey(_monkey, _upgrade_stats, _path) {

	var _original_value = _monkey.tower_stats.total_cost
	var _tower_stats = _monkey.tower_stats;
	
	//_tower_stats = scr_merge_struct(_tower_stats, _upgrade_stats, false)
	
	if !variable_struct_exists(_tower_stats, "active_upgrades") {
		_tower_stats.active_upgrades = {}
	}
	var _up_count = 1;
	if variable_struct_exists(_tower_stats.active_upgrades, _upgrade_stats.keyword) {
		_up_count = variable_struct_get(_tower_stats.active_upgrades, _upgrade_stats.keyword) + 1;
	}
	variable_struct_set(_tower_stats.active_upgrades, _upgrade_stats.keyword, _up_count)

	
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
	
	scr_update_projectile_stats(_tower_stats.total_upgrade_stats, _upgrade_stats);
	scr_update_tower_stats(_tower_stats.total_upgrade_stats, _upgrade_stats);
	
	var _replace_all = false
	if variable_struct_exists(_upgrade_stats, "projectile_replacement") {
		if _upgrade_stats.projectile_replacement {
			_replace_all = true
		}
	}
	
	if variable_struct_exists(_upgrade_stats, "projectile_stats") {
		var _starting_index = _projectile_count;
		if _replace_all {
			_tower_stats.projectile_stats = []	
			_starting_index = 0;
		}
		var _upgrade_projectile_count = array_length(_upgrade_stats.projectile_stats)
		for(var _i = 0; _i < _upgrade_projectile_count; _i++) {
			_tower_stats.projectile_stats[_starting_index + _i] = variable_clone(_upgrade_stats.projectile_stats[_i])
			_tower_stats.projectile_stats[_starting_index + _i].speed = _upgrade_stats.projectile_stats[_i].speed
		}
	}
	var _i = 0;
	var _j = 0;
	// Here we update the stats for all the projectiles
	for(_i = 0; _i < _projectile_count; _i++) {
		if _replace_all {
			scr_update_projectile_stats(_tower_stats.projectile_stats[_i], _tower_stats.total_upgrade_stats)	
		} else {
			scr_update_projectile_stats(_tower_stats.projectile_stats[_i], _upgrade_stats)
		}
	}
	
	
	//if _replace_all {
	//	scr_update_tower_stats(_tower_stats, _tower_stats.total_upgrade_stats)	
	//} else {
		scr_update_tower_stats(_tower_stats, _upgrade_stats)
	//}
	
	if variable_struct_exists(_upgrade_stats, "additional_attacks") {
		if !variable_struct_exists(_tower_stats, "additional_attacks") || _replace_all {
			_tower_stats.additional_attacks = []
		}
		_tower_stats.additional_attacks = array_concat(_tower_stats.additional_attacks, _upgrade_stats.additional_attacks)
		
		var _additional_attack_count = array_length(_tower_stats.additional_attacks)
		for (_i = 0; _i < _additional_attack_count; _i++) {
			var _add_projectile_count = array_length(_tower_stats.additional_attacks[_i].projectile_stats)
			var _add_attack = _tower_stats.additional_attacks[_i]
			
			if _replace_all {
				scr_update_tower_stats(_add_attack, _tower_stats.total_upgrade_stats)	
			} else {
				scr_update_tower_stats(_add_attack, _upgrade_stats)
			}
			
			for(_j = 0; _j < _add_projectile_count; _j++) {
				if _replace_all {
					scr_update_projectile_stats(_add_attack.projectile_stats[_j], _tower_stats.total_upgrade_stats)	
				} else {
					scr_update_projectile_stats(_add_attack.projectile_stats[_j], _upgrade_stats)
				}
			}
		}
	}
	
	if variable_struct_exists(_upgrade_stats, "ability_charge_multiplier") {
		if variable_struct_exists(_tower_stats, "ability_charge_rate") {
			_tower_stats.ability_charge_rate = _tower_stats.ability_charge_rate * _upgrade_stats.ability_charge_multiplier
		} else {
			_tower_stats.ability_charge_rate = _upgrade_stats.ability_charge_multiplier
		}
	}
	
	if variable_struct_exists(_upgrade_stats, "upgrade_script") {
		with(_monkey) {
			script_execute(_upgrade_stats.upgrade_script)
		}
	}

	//_monkey.tower_stats = _new_stats
	
	_tower_stats.total_cost += _upgrade_stats.upgrade_cost
	_tower_stats.upgrade_count[_path]++;
	if _monkey.all_bases {
		for(_j = 0; _j < array_length(_tower_stats.upgrades); _j++) {
			if _j = _path {
				continue;	
			}
			_tower_stats.upgrades[_j] = [];
		}
	}

}