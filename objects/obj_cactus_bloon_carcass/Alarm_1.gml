/// @description Insert description here
// You can write your code in this editor


var _layer = "green"
var _class = "normal"
var _xx = x;
var _yy = y;
var _bloon_object = obj_bloon
var _path = path
var _properties = ["float to track"]
var _round = -1
	
var _pos = path_pos;
	
with instance_create_depth(_xx, _yy, depth, _bloon_object) {
	scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round, _xx, _yy)
	path_position = _pos
	bloon_stats.vertical_speed += 2 + random(4);
	bloon_stats.float_height += 10;
		
	if instance_exists(target) {
		target.path_position = _pos	* 0.7;
		if bloon_stats.path != -1 {
			target.x = path_get_x(bloon_stats.path, path_position);
			target.y = path_get_y(bloon_stats.path, path_position);
		}
			
		x = _xx;
		y = _yy
	}
}

_layer = "pink"

with instance_create_depth(_xx, _yy, depth, _bloon_object) {
	scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round, _xx, _yy)
	path_position = _pos
	bloon_stats.vertical_speed += 2 + random(4);
	bloon_stats.float_height += 10;
		
	if instance_exists(target) {
		target.path_position = _pos	* 0.7;
		if bloon_stats.path != -1 {
			target.x = path_get_x(bloon_stats.path, path_position);
			target.y = path_get_y(bloon_stats.path, path_position);
		}
			
		x = _xx;
		y = _yy
	}
}



instance_destroy()




