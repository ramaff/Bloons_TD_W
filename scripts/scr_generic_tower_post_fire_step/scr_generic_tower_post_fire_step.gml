// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_generic_tower_post_fire_step(){

	if attacked {
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

}