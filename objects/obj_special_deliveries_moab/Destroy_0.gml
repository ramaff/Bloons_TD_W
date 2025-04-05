/// @description Insert description here
// You can write your code in this editor



event_user(0)
with instance_create_depth(x, y, depth, obj_special_delivery_spew) {
	tower_id = other.tower_id;
	bloon_stats = other.bloon_stats;
	path_position = other.path_position
}


// Inherit the parent event
event_inherited();

