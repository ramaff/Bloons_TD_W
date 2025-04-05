// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_special_delivery(_tower_stats = tower_stats) {

	var _class = "clown"
	var _layer = "special_delivery"
	var _path = global.paths[irandom(array_length(global.paths) - 1)]
	var _properties = []
	var _round_number = -1
	var _bloon_object = obj_special_deliveries_moab
	var _xx = x;
	var _yy = y;

	with instance_create_depth(path_get_x(_path, 0), path_get_y(_path, 0), depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round_number);
	
		tower_id = _tower_stats.id

	}


}