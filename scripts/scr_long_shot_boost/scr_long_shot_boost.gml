// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_long_shot_boost(_tower_stats = tower_stats) {

	var _long_shot_boost = {
		range_boost: 0.33,
		damage_boost: 0,
		pierce_boost: 0,
		speed_boost: 0,
		boost_duration: 600,
		attack_expire: true
	}
	if !variable_struct_exists(_tower_stats, "stat_boosts") {
		_tower_stats.stat_boosts = {}
	}
	var _max_charge = 10;
	if variable_struct_exists(_tower_stats, "active_upgrades") {
		if variable_struct_exists(_tower_stats.active_upgrades, "Goliath Shot") {
			_long_shot_boost.range_boost = 0.6
			_max_charge = 20;
		}
	}
	if variable_struct_exists(_tower_stats.stat_boosts, "long shot boost") {
		var _current_long_shot_boost = variable_struct_get(_tower_stats.stat_boosts, "long shot boost")
		if variable_struct_exists(_tower_stats, "active_upgrades") {
			if variable_struct_exists(_tower_stats.active_upgrades, "Goliath Shot") {
				if _current_long_shot_boost.damage_boost > 10 {
					_long_shot_boost.puncture = ceil(_current_long_shot_boost.damage_boost / 4)
				}
			}
		}
		_long_shot_boost.range_boost += _current_long_shot_boost.range_boost;

		var _max_range_charge = 10 * _max_charge
		if _long_shot_boost.range_boost > _max_range_charge {
			_long_shot_boost.range_boost = _max_range_charge;	
		}
		_long_shot_boost.damage_boost = floor(_long_shot_boost.range_boost / 10);
		_long_shot_boost.pierce_boost = floor(_long_shot_boost.range_boost / 10);
		_long_shot_boost.speed_boost = floor(_long_shot_boost.range_boost / 10);
	}
	
	variable_struct_set(_tower_stats.stat_boosts, "long shot boost", _long_shot_boost)

}