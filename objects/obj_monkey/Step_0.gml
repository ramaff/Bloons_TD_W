/// @description Insert description here
// You can write your code in this editor

var _tick_down = 1;
var _range_boost = 0;
var _current_boosts = {
	"damage_boost": 0,
	"pierce_boost": 0,
	"puncture": 0
}

// NOTE There is a better way to write this in the future:
if variable_struct_exists(tower_stats, "stat_boosts") {
	var _boosts = variable_struct_get_names(tower_stats.stat_boosts);
	for(var _i = 0; _i < array_length(_boosts); _i++) {
		var _current_boost = variable_struct_get(tower_stats.stat_boosts, _boosts[_i])
		if variable_struct_exists(_current_boost, "boost_duration") {
			if variable_struct_exists(_current_boost, "fire_rate_boost_multiplier") {
				_tick_down = _tick_down * _current_boost.fire_rate_boost_multiplier;
			}
			if variable_struct_exists(_current_boost, "range_boost") {
				_range_boost += _current_boost.range_boost;
			}
			if variable_struct_exists(_current_boost, "damage_boost") {
				_current_boosts.damage_boost += _current_boost.damage_boost;
			}
			if variable_struct_exists(_current_boost, "pierce_boost") {
				_current_boosts.pierce_boost += _current_boost.pierce_boost;
			}
			if variable_struct_exists(_current_boost, "puncture") {
				_current_boosts.puncture += _current_boost.puncture;
			}
			
			_current_boost.boost_duration--;
			
			if _current_boost.boost_duration <= 0 {
				struct_remove(tower_stats.stat_boosts, _boosts[_i])
			}
		}
	}
}

if tower_stats.attack_cooldown > 0 {
	tower_stats.attack_cooldown -= _tick_down;
}

if tower_stats.attack_cooldown <= 0 {
	
	if variable_struct_exists(tower_stats, "tower_attack_script") {
		script_execute(tower_stats.tower_attack_script)
	}
	
	var _target = scr_get_bloon_target(tower_stats, x, y, _range_boost)
	
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
		_angle_offset += tower_stats.attack_angle_offset
	}
	
	tower_stats.attack_cooldown += tower_stats.delay	
	scr_create_tower_projectiles(tower_stats.projectile_stats, x, y, _target, _angle_offset, _current_boosts)
	
	if variable_struct_exists(tower_stats, "stat_boosts") {
		var _boosts = variable_struct_get_names(tower_stats.stat_boosts);
		for(var _i = 0; _i < array_length(_boosts); _i++) {
			var _current_boost = variable_struct_get(tower_stats.stat_boosts, _boosts[_i])
			if variable_struct_exists(_current_boost, "attack_expire") {
				struct_remove(tower_stats.stat_boosts, _boosts[_i])
			}
		}
	}
	
}