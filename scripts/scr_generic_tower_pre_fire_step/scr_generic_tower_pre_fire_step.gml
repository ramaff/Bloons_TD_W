// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_generic_tower_pre_fire_step(){

	tick_down = 1;
	range_boost = 0;
	current_boosts = {
		"damage_boost": 0,
		"pierce_boost": 0,
		"speed_boost": 0,
		"shot_count": 0,
		"shot_spread": 0,
		"angular_velocity": 0,
		"puncture": 0,
		"stun_heal_fac": 1
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
				if variable_struct_exists(_current_boost, "stun_heal_fac") {
					current_boosts.stun_heal_fac = _current_boost.stun_heal_fac;
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
		stun -= current_boosts.stun_heal_fac * tower_stats.total_cost / 3000;
		exit;
	}

	if tower_stats.attack_cooldown > 0 {
		tower_stats.attack_cooldown -= tick_down;
	}

	attacked = false;

}