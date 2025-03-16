/// @description Insert description here
// You can write your code in this editor

image_index = 1;

alarm[3] = 60 / bloon_stats.speed;

var _target = noone
var _min_dist = 9999

with(obj_monkey) {
	var _dist = distance_to_object(other)
	if _dist < _min_dist and stun <= 0 {
		_target = id;
		_min_dist = _dist
	}
}

with(_target) {
	stun += 300;
	var _dir = point_direction(x, y, other.x, other.y) + 180;
	with instance_create_depth(x, y, depth, obj_tower_collider) {
		speed = 8;
		direction = _dir
		alarm[0] = 180;
		target = _target
		//sprite_index = _target.sprite_index
	}
}



