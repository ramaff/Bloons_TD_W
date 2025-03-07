/// @description Insert description here
// You can write your code in this editor

alarm[0] = 1;

var _class = "normal"
var _layer = "red"
var _xx = x;
var _yy = y;
var _bloon_object = obj_bloon
var _path = path
var _properties = []
var _round = -1

if alarm[1] < 9 {
	_layer = "yellow"	
}

var _pos = path_position;
	
with instance_create_depth(_xx, _yy, depth, _bloon_object) {
	scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
	path_position = _pos
	path_end()
	x = _xx
	y = _yy
	speed = 0;
	bloon_stats.speed = 0;
}
