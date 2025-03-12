/// @description Insert description here
// You can write your code in this editor

alarm[1] = 30

var _class = "splitter"
var _layers = ["orange", "cyan", "lime", "amber", "purple"]
//var _layer = _layers[floor(abs((stored_health - _lost_hp) mod 25) / 5)]
var _xx = x;
var _yy = y;
var _bloon_object = obj_bloon
var _path = bloon_stats.path
var _properties = ["float to track"]
var _round = -1
	
var _pos = path_position;

var _layer = _layers[irandom(4)]
with instance_create_depth(_xx, _yy, depth, _bloon_object) {
	scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
	path_position = _pos
	x = path_get_x(_path, path_position);
	y = path_get_y(_path, path_position);
	bloon_stats.vertical_speed += 2 + random(4);
	bloon_stats.float_height += 5;
	bloon_stats.vertical_direction = random(360);
		
	if instance_exists(target) {
		target.path_position = _pos	* 1;
		target.x = path_get_x(bloon_stats.path, path_position);
		target.y = path_get_y(bloon_stats.path, path_position);
				
		x = _xx;
		y = _yy
	}
}





