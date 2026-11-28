/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if !instance_exists(target) {
	instance_destroy();
	exit;
}

scr_orbit_target();