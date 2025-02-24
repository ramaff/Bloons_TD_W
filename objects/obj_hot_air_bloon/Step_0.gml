/// @description Insert description here
// You can write your code in this editor

path_end()

if !instance_exists(target) {
	tower_captured = false;
	target = noone;
	var _tar_angle = point_direction(x, y, 400, 300);
	var _dist = point_distance(x, y, 400, 300)
	direction = _tar_angle + min(90, 15000 / _dist)
	speed = bloon_stats.speed;
	exit;
}


//path_position = 0.5;
//path_end()
var _tar_angle = point_direction(x, y, target.x, target.y - height)
var _dist = point_distance(x, y, target.x, target.y - height)

speed = min(_dist, bloon_stats.speed);

if tower_captured {
	speed = 0;
	var _og_height = height;
	height = lerp(height, 150, 0.02);
	y += _og_height - height
	target.x = x;
	target.y = y + 80;
	if target.stun < 100 {
		target.stun = 100
	}
} else if _dist <= 1 {
	height -= 4;
	if height <= 70 {
		tower_captured = true;
		target_x = target.x
		target_y = target.y
	}
}

var _depth = depth;
if instance_exists(target) {
	_depth = target.depth + 1;
}
with instance_create_depth(x, y, _depth, obj_draw_something) {
	depth = _depth;
	alarm[0] = 1;
	sprite_index = spr_hot_air_bloon_bottom;
}

direction = _tar_angle


// Inherit the parent event
event_inherited();

