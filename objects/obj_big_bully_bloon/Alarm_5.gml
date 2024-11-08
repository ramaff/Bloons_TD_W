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
}



