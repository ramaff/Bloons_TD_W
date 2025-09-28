/// @description Insert description here
// You can write your code in this editor


if path_position <= 0 {
	var _path = global.paths[path_num mod array_length(global.paths)]
	path_num++;
	path_start(_path, -5, path_action_stop, true);
	if variable_struct_exists(tower_stats.active_upgrades, "Pro Skater") {
		path_speed = path_speed * 1.5
	}
	if variable_struct_exists(tower_stats.active_upgrades, "Motorbike") {
		path_speed = path_speed * 2
	}
				
	x = path_get_x(_path, 1)
	y = path_get_y(_path, 1)
	
	path_position = 1;
	
	var _projs_size = array_length(projs);
	var _i;
	for(_i = 0; _i < _projs_size; _i++) {
		if instance_exists(projs[_i]) {
			instance_destroy(projs[_i])	
		}
	}
	
	var _damage_keys = []
	if variable_struct_exists(tower_stats, "damage_keys") {
		_damage_keys = tower_stats.damage_keys	
	}

	projs = scr_create_tower_projectiles(tower_stats.projectile_stats, x, y, noone, 0, {}, id, targeting, _damage_keys)

}



tick_down = 1;
range_boost = 0;
current_boosts = {
	"damage_boost": 0,
	"pierce_boost": 0,
	"speed_boost": 0,
	"shot_count": 0,
	"shot_spread": 0,
	"angular_velocity": 0,
	"puncture": 0
}

// NOTE There is a better way to write this in the future:
if variable_struct_exists(tower_stats, "stat_boosts") {
	var _boosts = variable_struct_get_names(tower_stats.stat_boosts);
	for(var _i = 0; _i < array_length(_boosts); _i++) {
		var _current_boost = variable_struct_get(tower_stats.stat_boosts, _boosts[_i])
		if variable_struct_exists(_current_boost, "boost_duration") {
			if variable_struct_exists(_current_boost, "fire_rate_boost_multiplier") {
				tick_down = tick_down * _current_boost.fire_rate_boost_multiplier;
			}
			if variable_struct_exists(_current_boost, "range_boost") {
				range_boost += _current_boost.range_boost;
			}
			if variable_struct_exists(_current_boost, "damage_boost") {
				current_boosts.damage_boost += _current_boost.damage_boost;
			}
			if variable_struct_exists(_current_boost, "pierce_boost") {
				current_boosts.pierce_boost += _current_boost.pierce_boost;
			}
			if variable_struct_exists(_current_boost, "speed_boost") {
				current_boosts.speed_boost += _current_boost.speed_boost;
			}
			if variable_struct_exists(_current_boost, "puncture") {
				current_boosts.puncture += _current_boost.puncture;
			}
			if variable_struct_exists(_current_boost, "shot_count") {
				current_boosts.shot_count += _current_boost.shot_count;
			}
			if variable_struct_exists(_current_boost, "shot_spread") {
				current_boosts.shot_spread = _current_boost.shot_spread;
			}
			if variable_struct_exists(_current_boost, "alternating_angular_velocity") {
				var _ang_vel = _current_boost.alternating_angular_velocity;
				if _current_boost.boost_duration mod 30 < 15 {
					_ang_vel = _ang_vel * -1;	
				}
				current_boosts.angular_velocity += _ang_vel
			}
			
			_current_boost.boost_duration--;
			
			if _current_boost.boost_duration <= 0 {
				struct_remove(tower_stats.stat_boosts, _boosts[_i])
			}
		}
	}
}

if stun > 0 {
	stun -= sqrt(tower_stats.total_cost) / 60;	
	exit;
}



var _additional_attacks = []
if variable_struct_exists(tower_stats, "additional_attacks") {
	_additional_attacks = tower_stats.additional_attacks	
}

for(var _i = 0; _i < array_length(_additional_attacks); _i++) {
	var _attack = _additional_attacks[_i];
	_attack.damage_keys = tower_stats.damage_keys
	
	if _attack.attack_cooldown > 0 {
		_attack.attack_cooldown -= tick_down;
	}
	
	if _attack.attack_cooldown <= 0 {
		var _add_attack = scr_tower_attack(_attack, _attack.projectile_stats, current_boosts, range_boost, undefined, tower_stats.id)
		attacked = _add_attack || attacked
		if _add_attack {
			_attack.attack_cooldown += _attack.delay
		}
	}	
}

if hspeed <= 0 {
	image_xscale = -1;	
} else {
	image_xscale = 1;	
}
