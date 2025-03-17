/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if !instance_exists(target) {
	instance_destroy();
	exit;
}

var _tar_x = target.x + lengthdir_x(orbit_distance, orbit_angle)
var _tar_y = target.y + lengthdir_y(orbit_distance, orbit_angle)

x = lerp(x, _tar_x, 0.5);
y = lerp(y, _tar_y, 0.5);

orbit_angle += speed;
