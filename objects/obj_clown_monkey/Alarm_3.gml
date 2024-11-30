/// @description Insert description here
// You can write your code in this editor

alarm[3] = 75;
if variable_struct_exists(tower_stats.active_upgrades, "Increased Bloon Flow") {
	alarm[3] = alarm[3] / 2;
}

var _class = "tack"
var _layer = "pink"
var _path = global.paths[irandom(array_length(global.paths) - 1)]
var _properties = []
var _round_number = global.round
var _bloon_object = obj_tack_bloon

with instance_create_depth(path_get_x(_path, 0), path_get_y(_path, 0), depth, _bloon_object) {
	scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round_number);
	
	tower_id = other.tower_stats.id
}


