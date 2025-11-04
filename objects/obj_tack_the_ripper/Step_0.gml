/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if leak_frame {
	
	scr_bloon_set_speed(bloon_stats.speed * 1.1);
	
}


if instance_exists(slicer) {
	image_alpha = 0
	path_speed = 0
} else {
	image_alpha = lerp(image_alpha, 1, 0.2);
	path_speed = bloon_stats.speed
}

