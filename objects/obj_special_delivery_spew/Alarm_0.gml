/// @description Insert description here
// You can write your code in this editor

alarm[0] = 30;

var _class = "clown"
//var _layer = _layers[floor(abs((stored_health - _lost_hp) mod 25) / 5)]
var _xx = x - 50 + random(100);
var _yy = y - 50 + random(100);
var _bloon_object = obj_tack_bloon
var _path = bloon_stats.path
var _round = -1
var _properties = ["float to track"]
	
var _pos = path_position;

var _layer = "tack"


if round(alarm[1] / alarm[0]) mod 3 = 2 {
	_layer = "bomb"
	_bloon_object = obj_bomb_bloon
}
if round(alarm[1] / alarm[0]) mod 3 = 1 {
	_layer = "ice"
	_bloon_object = obj_ice_bloon
}

repeat(6) {
	with instance_create_depth(_xx, _yy, depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
		path_position = _pos
			
		tower_id = other.tower_id;
		bloon_stats.vertical_speed += 2 + random(4);
		bloon_stats.float_height += 5;
	}
}