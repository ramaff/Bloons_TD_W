// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bloon_stat_setup(_bloon = self, _class = "normal", _layers = 1){

	_bloon.bloon_stats = variable_clone(struct_get(global.bloon_stats, _class)[_layers - 1])

	_bloon.image_index = _layers - 1
	
	_bloon.speed = _bloon.bloon_stats.speed
	_bloon.path_speed = _bloon.speed

}