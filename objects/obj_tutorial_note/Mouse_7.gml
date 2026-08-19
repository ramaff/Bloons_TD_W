/// @description Insert description here
// You can write your code in this editor

if page >= array_length(text) {
	gravity = 5
	image_index = 2
	with(obj_pause_button) {	
		if paused {
			image_index = 0
			event_user(0)
		}
	}
	exit;
}

page++;




