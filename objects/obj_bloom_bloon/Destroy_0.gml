/// @description Insert description here
// You can write your code in this editor

with instance_create_depth(x, y, depth, obj_bloom_spewer) {
	path_pos = other.path_position
	path = other.bloon_stats.path
	ang_offset = 90.2;
	bloom_type = other.bloon_stats.layer;
}
with instance_create_depth(x, y, depth, obj_bloom_spewer) {
	path_pos = other.path_position
	path = other.bloon_stats.path
	ang_offset = -90.2;
	bloom_type = other.bloon_stats.layer;
}




// Inherit the parent event
event_inherited();

