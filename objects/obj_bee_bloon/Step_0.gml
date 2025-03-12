/// @description Insert description here
// You can write your code in this editor

if target.object_index = obj_bloon_target {
	path_position = target.path_position;
}

// Inherit the parent event
event_inherited();

if leak_frame {
	
	with (target) {
		if object_index = obj_bloon_target {
			path_position = 0;
			path_start(other.bloon_stats.path, other.bloon_stats.speed, path_action_stop, true);
		}
	}
	
	x = target.x;
	y = target.y;
	
}
