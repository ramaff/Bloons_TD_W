/// @description Insert description here
// You can write your code in this editor

alarm[1] = 600 / spawn_speed;
alarm[2] = 30;

spawn_speed += 0.1;
water_count = 30;

var _class = "moab"
var _layer = "mini"
var _xx = x;
var _yy = y - 100;
var _bloon_object = obj_moab_class
var _path = bloon_stats.path
var _properties = ["float to track"]
var _round = -1
	
var _pos = path_position;

repeat(2) {
	with instance_create_depth(_xx, _yy, depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
		path_position = _pos
		x = _xx
		y = _yy
		bloon_stats.vertical_speed += 2 + random(2);
		bloon_stats.vertical_direction = -60 + random(120);
		
		if instance_exists(target) {
			target.path_position = (0.8 + _pos + _pos) * 0.333;
			target.x = path_get_x(bloon_stats.path, path_position);
			target.y = path_get_y(bloon_stats.path, path_position);
				
			x = _xx;
			y = _yy
		}
	}
}



