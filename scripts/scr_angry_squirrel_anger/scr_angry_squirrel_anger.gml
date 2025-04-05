// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_angry_squirrel_anger(_tower_stats = tower_stats) {

	var _anger_boost = {
		fire_rate_boost_multiplier: 5,
		range_boost: 45,
		boost_duration: 180,
		sprite: "spr_angry_squirrel_angry",
		sprite_priority: 2
	}
	if !variable_struct_exists(_tower_stats, "stat_boosts") {
		_tower_stats.stat_boosts = {}
	}
	if variable_struct_exists(_tower_stats, "active_upgrades") {
		if variable_struct_exists(_tower_stats.active_upgrades, "Anger Mismanagement") {
			_anger_boost.boost_duration = _anger_boost.boost_duration * 2;
		}
		if variable_struct_exists(_tower_stats.active_upgrades, "Venting") {
			if !variable_struct_exists(_tower_stats.stat_boosts, "angry_boost") {
				_tower_stats.health += 5;
				if _tower_stats.health > _tower_stats.max_health {
					_tower_stats.health = _tower_stats.max_health	
				}
			}
		}
		if variable_struct_exists(_tower_stats.active_upgrades, "Acorn Assault") {
			_anger_boost.shot_count = 2;
		}
		if variable_struct_exists(_tower_stats.active_upgrades, "Lingering Flame") {
			_anger_boost.fire_rate_boost_multiplier = _anger_boost.fire_rate_boost_multiplier / 1.5
			var _lingering_flame_boost = {
				fire_rate_boost_multiplier: 2,
				boost_duration: 1200,
				range_boost: 15,
				sprite: "spr_angry_squirrel_lingering_flame",
				sprite_priority: 1
			}
			if variable_struct_exists(_tower_stats.active_upgrades, "Acorn Assault") {
				_lingering_flame_boost.shot_count = 1;
				_lingering_flame_boost.shot_spread = 45;
				_lingering_flame_boost.alternating_angular_velocity = 5;
			}
			variable_struct_set(_tower_stats.stat_boosts, "lingering_flame", _lingering_flame_boost)
		}
	}
	//var _boost_length = array_length(_tower_stats.stat_boosts)
	
	variable_struct_set(_tower_stats.stat_boosts, "angry_boost", _anger_boost)
	//_tower_stats.stat_boosts.angry_boost = _anger_boost

}