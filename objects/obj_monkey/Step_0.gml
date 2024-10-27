/// @description Insert description here
// You can write your code in this editor

if tower_stats.attack_cooldown > 0 {
	var _tick_down = 1;
	if variable_struct_exists(tower_stats, "stat_boosts") {
		for(var _i = 0; _i < array_length(tower_stats.stat_boosts); _i++) {
			if variable_struct_exists(tower_stats.stat_boosts[_i], "fire_rate_boost_multiplier") {
				_tick_down = _tick_down * tower_stats.stat_boosts[_i].fire_rate_boost_multiplier;
			}
		}
	}
	tower_stats.attack_cooldown -= _tick_down;
}

if tower_stats.attack_cooldown <= 0 {
	
	if variable_struct_exists(tower_stats, "upgrade_attack_script") {
		script_execute(tower_stats.upgrade_attack_script)
	}
	
	var _target = scr_get_bloon_target(tower_stats, x, y)
	
	if !instance_exists(_target) {
		exit;
	}
	
	if variable_struct_exists(tower_stats, "no_target") {
		if tower_stats.no_target {
			_target = noone;
		}
	}
	
	
	var _angle_offset = 0;
	if variable_struct_exists(tower_stats, "attack_angle_offset") {
		show_debug_message(tower_stats.attack_angle_offset)
		_angle_offset += tower_stats.attack_angle_offset
	}
	
	tower_stats.attack_cooldown += tower_stats.delay	
	scr_create_tower_projectiles(tower_stats.projectile_stats, x, y, _target, _angle_offset)
	
}