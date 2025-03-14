/// @description Insert description here
// You can write your code in this editor

	var _class = "beehive"
	var _layer = "bee"
	var _xx = x;
	var _yy = y;
	var _bloon_object = obj_beehive_bloon
	var _path = bloon_stats.path
	var _properties = []
	var _round = -1
	
	var _pos = path_position;
	
	with instance_create_depth(_xx, _yy, depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
		path_position = _pos
		x = path_get_x(_path, path_position);
		y = path_get_y(_path, path_position);
	}

image_index = 1;

alarm[3] = 60 / bloon_stats.speed;
hive_spawn--;