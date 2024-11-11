/// @description Insert description here
// You can write your code in this editor

var _xx = mouse_x - x
var _yy = mouse_y - y

if _xx < 160 and _xx > 0 and _yy < 96 and _yy > 0 {
	if variable_struct_exists(upgrade_stats, "upgrade_string") {
		if instance_number(obj_info_pan) < 1 {
			with instance_create_depth(x-256,y, depth - 10, obj_info_pan) {
				text = other.upgrade_stats.upgrade_string
				other.info_pan_id = id;
			}
		}
	}
} else {
	instance_destroy(info_pan_id)	
}

if (keyboard_check_pressed(ord(ord_key))) {
	event_perform(ev_mouse, ev_left_release)	
}



