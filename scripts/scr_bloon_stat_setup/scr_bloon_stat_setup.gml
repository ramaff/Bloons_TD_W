// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bloon_stat_setup(_bloon = self, _class = "normal", _layer = "red", _properties = []){

	var _class_stats = struct_get(global.bloon_stats, _class)
	
	show_debug_message(_layer)
	
	_bloon.bloon_stats = variable_clone(struct_get(_class_stats, _layer))
	
	for(var _i = 0; _i < array_length(_properties); _i++) {
		show_debug_message(_properties[_i])
		variable_struct_set(_bloon.bloon_stats, _properties[_i], true)
	}
	
	show_debug_message(_bloon.bloon_stats)

	if variable_struct_exists(_bloon.bloon_stats, "index") {
		_bloon.image_index = _bloon.bloon_stats.index
	}
	if _class = "splitter" {
		_bloon.sprite_index = spr_splitter_bloon;
	}
	path = pth_autumn_acres;
	path_start(path, bloon_stats.speed, path_action_stop, true);
	
	if variable_struct_exists(_bloon.bloon_stats, "tattered") {
		_bloon.bloon_stats.speed = _bloon.bloon_stats.speed * 2	
	}
	
	_bloon.speed = _bloon.bloon_stats.speed
	_bloon.path_speed = _bloon.speed
	_bloon.depth = -_bloon.bloon_stats.layers

}