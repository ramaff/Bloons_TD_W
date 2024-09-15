/// @description Insert description here
// You can write your code in this editor

//if instance_number(obj_bloon) <= 0 {
	
//}

if global.round < 1 || global.round > array_length(global.bloon_sends) {
	exit;	
}

var _round = global.bloon_sends[global.round - 1];
var _bloons_remaining = false;

for(var _i = 0; _i < array_length(_round); _i++) {
	if _round[_i].count < 1 {
		continue;
	}
	_bloons_remaining = true;
	if _round[_i].cooldown <= 0 {
		var _bloon_object = scr_bloon_class_to_object(struct_get(_round[_i], "class"));
		var _properties = []
		if variable_struct_exists(_round[_i], "properties") {
			_properties = struct_get(_round[_i], "properties")
		}
		with instance_create_depth(-32, 192, depth, _bloon_object) {
			scr_bloon_stat_setup(id, _round[_i].class, struct_get(_round[_i], "layer"), _properties);
		}
		_round[_i].cooldown += _round[_i].spread;
		_round[_i].count--;
	}
	_round[_i].cooldown--;
}

if !_bloons_remaining {
	global.round_gap--;
	if global.round_gap < 0 {
		global.round++;
		global.round_gap = 360;
	}
}

global.round_time++;

/*if global.lives <= 0 {
	game_end()	
} */

/*if instance_number(obj_bloon) <= 0 and bully_count <= 0 {
	instance_create_depth(100, 100, depth - 100, obj_win_butt)	
}
*/