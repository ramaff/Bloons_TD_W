/// @description Insert description here
// You can write your code in this editor

if path_position >= 1 {
	
	global.lives -= bloon_stats.damage
	
	bloon_stats.speed += 0.5;
	
	path_start(pth_training_tent, bloon_stats.speed, path_action_stop, true);
	path_position = 0;
	
	
}
