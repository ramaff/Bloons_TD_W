/// @description Insert description here
// You can write your code in this editor


alarm[1] = 300;

var _class = "rune"
var _layer = "barrier"
var _xx = x;
var _yy = y;
var _bloon_object = obj_rune_bloon
var _path = -1
var _properties = ["straight_to_exit"]
var _round = -1
	
var _pos = path_position;

with instance_create_depth(_xx, _yy, depth, _bloon_object) {
	scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
	path_position = 1;
	speed = 0.5;
		
	var _tx = path_get_x(other.bloon_stats.path, path_position);
	var _ty = path_get_y(other.bloon_stats.path, path_position)
		
	direction = point_direction(x, y, _tx, _ty)
		
}



