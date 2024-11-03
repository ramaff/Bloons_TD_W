// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_long_shot_boost(_tower_stats = tower_stats) {

	var _long_shot_boost = {
		range_boost: 0.5,
		damage_boost: 0,
		pierce_boost: 0,
		boost_duration: 600,
		attack_expire: true
	}
	if !variable_struct_exists(_tower_stats, "stat_boosts") {
		_tower_stats.stat_boosts = {}
	}
	if variable_struct_exists(_tower_stats.stat_boosts, "long shot boost") {
		var _current_long_shot_boost = variable_struct_get(_tower_stats.stat_boosts, "long shot boost")
		var _max_charge = 10;
		if variable_struct_exists(_tower_stats, "active_upgrades") {
			if variable_struct_exists(_tower_stats.active_upgrades, "Goliath Shot") {
				_long_shot_boost.range_boost = 1
				_max_charge = 20;
				if _current_long_shot_boost.damage_boost > 10 {
					_long_shot_boost.puncture = ceil(_current_long_shot_boost.damage_boost / 4)
				}
			}
		}
		_long_shot_boost.range_boost += _current_long_shot_boost.range_boost;
		_long_shot_boost.damage_boost += _current_long_shot_boost.damage_boost;
		_long_shot_boost.pierce_boost += _current_long_shot_boost.pierce_boost;
		if _long_shot_boost.range_boost mod 15 = 0 {
			_long_shot_boost.damage_boost += 1;
			_long_shot_boost.pierce_boost += 1;
		}
		var _max_range_charge = 15 * _max_charge
		//_current_long_shot_boost.boost_duration = 600;
		if _long_shot_boost.range_boost > _max_range_charge {
			_long_shot_boost.range_boost = _max_range_charge;	
		}
		if _long_shot_boost.damage_boost > _max_charge {
			_long_shot_boost.damage_boost = _max_charge;	
			_long_shot_boost.pierce_boost = _max_charge;	
		}
	}
	//var _boost_length = array_length(_tower_stats.stat_boosts)
	
	variable_struct_set(_tower_stats.stat_boosts, "long shot boost", _long_shot_boost)
	//_tower_stats.stat_boosts.angry_boost = _anger_boost

}