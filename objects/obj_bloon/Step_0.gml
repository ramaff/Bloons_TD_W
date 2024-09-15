/// @description Insert description here
// You can write your code in this editor

if path_position >= 1 {
	
	global.lives -= bloon_stats.rbe
	
	path_position = 0;
	path_start(path, bloon_stats.speed, path_action_stop, true);
	
}
