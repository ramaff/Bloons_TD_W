/// @description Insert description here
// You can write your code in this editor

alarm[2] = 30;

if variable_struct_exists(tower_stats.active_upgrades, "Inspiring Music") {
	
	var _range = tower_stats.range;
	var _xx = x;
	var _yy = y;
	var _inspiring_boost = {
		fire_rate_boost_multiplier: 1.15,
		stun_heal_fac: 1.15
	}
	
	with(obj_monkey) {
		if distance_to_point(_xx, _yy) < _range {
			if !variable_struct_exists(tower_stats, "stat_boosts") {
				tower_stats.stat_boosts = {}
			}
			variable_struct_set(tower_stats.stat_boosts, "inspired", _inspiring_boost)
		}
	}
	
}
