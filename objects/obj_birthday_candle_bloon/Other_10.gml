var _class = "belated_birthday"
var _layer = "wish"
var _xx = x;
var _yy = y;
var _bloon_object = obj_wish_bloon
var _path = bloon_stats.path
var _properties = []
var _round = bloon_stats.round
	
//var _pos = path_position;

with instance_create_depth(_xx, _yy, depth, _bloon_object) {
	scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
	saved_smackaroons = bloon_stats.max_health;
	//path_position = _pos
}

