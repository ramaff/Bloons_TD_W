/// @description Insert description here
// You can write your code in this editor

parent_id = id

bloon_stats = {
	layers: 5,
	health: 1,
	density: 1,
	speed: 1.5,
}

image_index = bloon_stats.layers - 1;

path = pth_training_tent
path_start(path, bloon_stats.speed, path_action_stop, true);
