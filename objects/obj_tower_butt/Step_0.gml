/// @description Insert description here
// You can write your code in this editor

if !variable_struct_exists(global.tower_stats, base_tower_id) {
	exit;	
}

if abs(mouse_x - x - 32) < 32 and abs(mouse_y - y - 32) < 32 {
	if instance_number(obj_tower_info_pan) < 1 {
		with instance_create_depth(x-256,y, depth - 10, obj_tower_info_pan) {
			base_tower_id = other.base_tower_id
			tower_stats = other.tower_stats
			other.info_pan_id = id;
		}
	}
} else {
	instance_destroy(info_pan_id)	
}




