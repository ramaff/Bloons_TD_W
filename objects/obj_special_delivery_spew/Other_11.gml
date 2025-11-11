/// @description Insert description here
// You can write your code in this editor

var _class = "clown"
//var _layer = _layers[floor(abs((stored_health - _lost_hp) mod 25) / 5)]
var _bloon_object = obj_tack_bloon
var _path = global.paths[irandom(array_length(global.paths) - 1)]
var _round = -1
var _properties = ["float to track"]
	
var _pos = path_position;

var _layer = type


if _layer = "bomb" {
	_bloon_object = obj_bomb_bloon
}
if _layer = "ice" {
	_bloon_object = obj_ice_bloon
}

repeat(5) {
	var _xx = x - 50 + random(100);
	var _yy = y - 50 + random(100);
	with instance_create_depth(_xx, _yy, depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
		path_position = _pos
			
		tower_id = other.tower_id;
		bloon_stats.vertical_speed += 1 + random(1);
		bloon_stats.float_height += 5;
	}
}