/// @description Insert description here
// You can write your code in this editor

var _tar_angle = scr_off_path_wave(0.2)

var _ang_off = hspeed * 12

image_angle = -_ang_off

if hspeed > 0 {
	image_xscale = abs(image_xscale)	
} else {
	image_xscale = -abs(image_xscale)		
}

// Inherit the parent event
event_inherited();

scr_off_path_leak()

if leak_frame {


	scr_bloon_set_speed(bloon_stats.speed * 1.1);

	
}





