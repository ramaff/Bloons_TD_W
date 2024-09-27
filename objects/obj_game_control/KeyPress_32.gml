/// @description Insert description here
// You can write your code in this editor

if global.round > array_length(global.bloon_sends) {
	exit;	
}

var _round = []	
if global.round > 0 {
	_round = global.bloon_sends[global.round - 1];
}
var _next_round = global.bloon_sends[global.round]

for(var _i = 0; _i < array_length(_round); _i++) {
	if _round[_i].count < 1 {
		continue;
	}
	_next_round[array_length(_next_round)] = _round[_i];
}

global.round++;
global.round_gap = 360;
with instance_create_depth(x, y, depth, obj_round_check) {
	round_number = global.round;
	alarm[0] = other.round_properties[global.round - 1].sends_end_time;
}