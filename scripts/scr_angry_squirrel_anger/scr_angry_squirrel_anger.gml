// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_angry_squirrel_anger(_tower_stats = tower_stats) {

	var _anger_boost = {
		fire_rate_boost_multiplier: 3,
		fire_rate_boost_duration: 180,
	}
	if !variable_struct_exists(_tower_stats, "stat_boosts") {
		_tower_stats.stat_boosts = {}
	}
	//var _boost_length = array_length(_tower_stats.stat_boosts)
	
	variable_struct_set(_tower_stats.stat_boosts, "angry_boost", _anger_boost)
	//_tower_stats.stat_boosts.angry_boost = _anger_boost

}