/// @description Insert description here
// You can write your code in this editor

	var _layer = "bully"
	var _class = "bully"
	var _xx = x;
	var _yy = y;
	var _bloon_object = obj_bully
	var _path = bloon_stats.path
	var _properties = ["float to track"]
	var _round = -1
	
	var _pos = path_position + 0.2;
	
	with instance_create_depth(_xx, _yy, depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
		path_position = _pos
		x = path_get_x(_path, path_position);
		y = path_get_y(_path, path_position);
		bloon_stats.vertical_speed += 2 + random(4);
		bloon_stats.float_height += 10;
		
		if instance_exists(target) {
			target.path_position = _pos
			target.x = path_get_x(bloon_stats.path, path_position);
			target.y = path_get_y(bloon_stats.path, path_position);
				
			x = _xx;
			y = _yy
		}
	}

speed = bloon_stats.speed;
path_speed = speed;


