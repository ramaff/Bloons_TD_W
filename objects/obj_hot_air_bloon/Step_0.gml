/// @description Insert description here
// You can write your code in this editor

if !instance_exists(target) {
	tower_captured = false;
	event_user(0)
	exit;
}


path_position = 0.5;
path_end()
var _tar_angle = point_direction(x, y, target.x, target.y - height)
var _dist = point_distance(x, y, target.x, target.y - height)

speed = min(_dist, bloon_stats.speed);

if tower_captured {
	speed = 0;
	var _og_height = height;
	height = lerp(height, 150, 0.01);
	y += _og_height - height
	target.x = x;
	target.y = y + 80;
	if target.stun < 100 {
		target.stun = 100
	}
} else if _dist <= 1 {
	height -= 1;
	if height <= 70 {
		tower_captured = true;	
	}
}

direction = _tar_angle

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

