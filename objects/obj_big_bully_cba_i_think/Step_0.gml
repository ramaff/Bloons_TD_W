/// @description Insert description here
// You can write your code in this editor

if path_position >= 1 {
	
	global.lives -= 2
	
	bloon_stats.speed += 0.5;
	
	path_start(pth_training_room, bloon_stats.speed, path_action_stop, true);
	path_position = 0;
	
	
}
