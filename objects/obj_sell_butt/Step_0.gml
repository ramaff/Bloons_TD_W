/// @description Insert description here
// You can write your code in this editor

if instance_exists(obj_lawyer_bloon_yellow) {
	instance_destroy()
	exit;
}

if (keyboard_check_pressed(vk_backspace)) {
	event_perform(ev_mouse, ev_left_release)	
}



