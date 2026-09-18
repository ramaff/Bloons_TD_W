function scr_summon_golden_bloon(){
	var _layer = "red"
	var _class = "animal"
	var _xx = x;
	var _yy = y;
	var _bloon_object = obj_bloon_animal_bloon
	var _path = global.paths[irandom(array_length(global.paths) - 1)]
	var _properties = ["float to track"]
	var _round = -1

	with instance_create_depth(_xx, _yy, depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
		path_position = 0
		x = _xx;
		y = _yy;
		bloon_stats.vertical_speed += 1 + random(2);
		bloon_stats.float_height += 5;
		
		if instance_exists(target) {
			target.path_position = 0;
			target.x = path_get_x(bloon_stats.path, path_position);
			target.y = path_get_y(bloon_stats.path, path_position);
		}
	}
}