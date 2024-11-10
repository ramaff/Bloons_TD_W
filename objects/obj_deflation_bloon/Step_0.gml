/// @description Insert description here
// You can write your code in this editor

path_position = target.path_position;

var _tar_angle = point_direction(x, y, target.x, target.y)
direction = _tar_angle + scr_wave(-90, 90, 2, 0)
var _dist = point_distance(x, y, target.x, target.y)
speed = bloon_stats.speed * max(0.5, (0.5 + (_dist / 80)));

if angle_difference(direction, _tar_angle) < 0 {
	image_yscale = -1;	
} else {
	image_yscale = 1;	
}

image_angle = direction

/*
if point_distance(x, y, target.x, target.y) > 20 {
	var _angle = point_direction(x, y, target.x, target.y)
	direction = scr_angle_converge(_angle, direction, 3)
	speed = bloon_stats.speed * 2;
} else {
}
*/
// Inherit the parent event
event_inherited();

if leak_frame {
	
	with (target) {
		path_position = 0;
		path_start(other.bloon_stats.path, other.bloon_stats.speed, path_action_stop, true);
	}
	
	x = target.x;
	y = target.y;
	
}
