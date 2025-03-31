/// @description Insert description here
// You can write your code in this editor


alarm[1] = 300;

var _class = "rune"
var _layer = "magic_shot"
var _xx = x;
var _yy = y;
var _bloon_object = obj_straight_to_exit_bloon
var _path = -1
var _properties = ["straight_to_exit"]
var _round = -1
	
var _pos = path_position;

with instance_create_depth(_xx, _yy, depth, _bloon_object) {
	scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
	path_position = 0.99;
	speed = 1.5;
	
	bloon_stats.path = other.bloon_stats.path
		
	var _tx = path_get_x(bloon_stats.path, 1);
	var _ty = path_get_y(bloon_stats.path, 1);
		
	direction = random(360);
		
}



