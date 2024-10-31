/// @description Insert description here
// You can write your code in this editor

var _bloon_object = asset_get_index(bloon_stats.object);
var _bloon_class = bloon_stats.class
var _bloon_layer = bloon_stats.layer
var _bloon_path = bloon_stats.path
var _round = bloon_stats.round

with instance_create_depth(path_get_x(_bloon_path, path_position), path_get_y(_bloon_path, path_position), depth, _bloon_object) {
	scr_bloon_stat_setup(id, _bloon_class, _bloon_layer, _bloon_path, [], _round);
	path_position = other.path_position
}


instance_destroy()