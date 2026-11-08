/// @description Insert description here
// You can write your code in this editor

scr_bloon_set_speed(path_speed + 0.01)

if hspeed > 0 {
	image_xscale = abs(image_xscale)
} else {
	image_xscale = -abs(image_xscale)
}

// Inherit the parent event
event_inherited();

