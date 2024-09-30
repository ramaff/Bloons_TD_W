/// @description Insert description here
// You can write your code in this editor

alarm[0] = 30;

var _bloons_remaining = false

with(obj_bloon) {
	if bloon_stats.round = other.round_number {
		_bloons_remaining = true
		exit;
	}
}

if !_bloons_remaining {
	global.money += 100 + round_number;
	instance_destroy()
}




