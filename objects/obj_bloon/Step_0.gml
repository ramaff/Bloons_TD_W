/// @description Insert description here
// You can write your code in this editor

if path_position >= 1 {
	
	var _hero_number = irandom(instance_number(obj_hero))
	
	with (obj_hero) {
		if _hero_number = 0 {
			tower_stats.health -= other.bloon_stats.rbe
		}
		_hero_number--;
		//global.lives -= bloon_stats.rbe
	}
	
	path_position = 0;
	path_start(path, bloon_stats.speed, path_action_stop, true);
	
}
