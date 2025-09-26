/// @description Insert description here
// You can write your code in this editor

with instance_create_depth(x, y, depth, obj_cactus_bloon_carcass) {
	path_pos = other.path_position
	path = other.bloon_stats.path
}

// Inherit the parent event
event_inherited();


