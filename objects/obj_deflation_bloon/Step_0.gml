/// @description Insert description here
// You can write your code in this editor

var _tar_angle = scr_off_path_wave()

if angle_difference(direction, _tar_angle) < 0 {
	image_yscale = -1;	
} else {
	image_yscale = 1;	
}

image_angle = direction

// Inherit the parent event
event_inherited();

scr_off_path_leak()
