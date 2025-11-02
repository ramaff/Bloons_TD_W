// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bloon_set_tattered(_bloon){

	_bloon.bloon_stats.speed = _bloon.bloon_stats.speed * 2
	_bloon.speed = _bloon.bloon_stats.speed
	_bloon.path_speed = _bloon.speed

}