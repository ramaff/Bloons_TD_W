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

var _text = "round " + string(round_number) + " cleared: +$" + string(100 + round_number)

if !_bloons_remaining {
	global.money += 100 + round_number;
	with instance_create_depth(600, 200, -100, obj_text) {
		text = _text	
	}
	instance_destroy()
}




