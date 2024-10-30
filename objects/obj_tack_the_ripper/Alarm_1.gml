/// @description Insert description here
// You can write your code in this editor

alarm[1] = 60 + (300 / bloon_stats.speed);

if instance_number(obj_bloon) <= instance_number(obj_tack_the_ripper) {
	exit;	
}

with instance_create_depth(x, y, depth, obj_bloon_slicing_ripper) {
	path_start(other.bloon_stats.path, 30, path_action_stop, true)
	other.slicer = id;
}


