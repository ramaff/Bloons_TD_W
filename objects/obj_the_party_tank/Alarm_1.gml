/// @description Insert description here
// You can write your code in this editor


alarm[1] = 180;

var _class = "normal"
var _layer = "rainbow"
var _xx = x + 160;
var _yy = y;
var _bloon_object = obj_bloon
var _path = bloon_stats.path
var _properties = ["float to track"]
var _round = -1
	
var _pos = path_position;
	
repeat(4) {
	with instance_create_depth(_xx, _yy, depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
		path_position = _pos
		x = _xx
		y = _yy
		bloon_stats.vertical_speed += 2 + random(4);
		bloon_stats.vertical_direction = -60 + random(120);
		
		if instance_exists(target) {
			target.path_position = _pos	* 1.25;
			target.x = path_get_x(bloon_stats.path, path_position);
			target.y = path_get_y(bloon_stats.path, path_position);
				
			x = _xx;
			y = _yy
		}
	}
}

