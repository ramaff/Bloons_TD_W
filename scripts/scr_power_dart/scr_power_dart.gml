// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_power_dart(){
	var _ability_stats = variable_clone(tower_stats.projectile_stats)
	
	var _proj_count = array_length(_ability_stats)
	var _damage_multiplier = 3;
	if variable_struct_exists(tower_stats, "active_upgrades") {
		var _upgrades = array_length(tower_stats.active_upgrades)
		for(var _k = 0; _k < _upgrades; _k++) {
			if _tower_stats.active_upgrades[_k] == "stronger" {
				_damage_multiplier += 1;	
			}
		}
	}
	
	for(var _i = 0; _i < _proj_count; _i++) {
		_ability_stats[_i].damage = _ability_stats[_i].damage * _damage_multiplier;	
		_ability_stats[_i].pierce = _ability_stats[_i].pierce * 50;
		_ability_stats[_i].sprite = "spr_big_dart"
		if tower_stats.projectile_stats[0].sprite = "spr_dartest_dart" {
			_ability_stats[_i].sprite = "spr_big_dartest_dart"
		}
		_ability_stats[_i].lifespan = _ability_stats[_i].lifespan * 2;
		if variable_struct_exists(_ability_stats[_i], "projectile_burst") {
			var _ability_stats_burst = _ability_stats[_i].projectile_burst
			var _burst_count = array_length(_ability_stats_burst)
			
			if variable_struct_exists(tower_stats, "active_upgrades") {
				for(var _j = 0; _j < _burst_count; _j++) {
					if variable_struct_exists(tower_stats.active_upgrades, "splodey darts") {
						_ability_stats_burst[_j].damage = _ability_stats_burst[_j].damage * _damage_multiplier;
						_ability_stats_burst[_j].pierce = _ability_stats_burst[_j].pierce * 10;
						_ability_stats_burst[_j].size = _ability_stats_burst[_j].size * 2.5;
						if variable_struct_exists(tower_stats.active_upgrades, "carpet bombing") {
							_ability_stats_burst[_j].sprite = "spr_bomb"
							var _ability_stats_burst_burst = _ability_stats_burst[_j].projectile_burst
							var _burst_burst_count = array_length(_ability_stats_burst_burst)
							for(var _k = 0; _k < _burst_burst_count; _k++) {
								_ability_stats_burst[_j].damage = _ability_stats_burst[_j].damage * _damage_multiplier;
								_ability_stats_burst[_j].pierce = _ability_stats_burst[_j].pierce * 10;
								_ability_stats_burst[_j].size = _ability_stats_burst[_j].size * 2.5;
							}
						}
					} else {
						_ability_stats_burst[_j].damage = _ability_stats_burst[_j].damage * _damage_multiplier;
						_ability_stats_burst[_j].pierce = _ability_stats_burst[_j].pierce * 50;
						_ability_stats_burst[_j].sprite = "spr_big_dart"
						_ability_stats_burst[_j].lifespan = _ability_stats_burst[_j].lifespan * 2;
						if variable_struct_exists(_ability_stats_burst[_j], "projectile_burst") {
							var _ability_stats_burst_burst = _ability_stats_burst[_j].projectile_burst
							var _burst_burst_count = array_length(_ability_stats_burst_burst)
							for(var _k = 0; _k < _burst_burst_count; _k++) {
								_ability_stats_burst_burst[_k].damage = _ability_stats_burst_burst[_k].damage * _damage_multiplier;
								_ability_stats_burst_burst[_k].pierce = _ability_stats_burst_burst[_k].pierce * 50;
								_ability_stats_burst_burst[_k].sprite = "spr_big_dart"
								_ability_stats_burst_burst[_k].lifespan = _ability_stats_burst_burst[_k].lifespan * 2;
							}
						}
					}
				}
			}
		}
	}
	
	with instance_create_depth(x, y, -100, obj_pointer_into_projectiles) {
		alarm[0] = 180;
		projectile_stats = _ability_stats
		tower_id = other.id;
	}
	
	//scr_create_tower_projectiles(_ability_stats, x, y, noone, 0)
}