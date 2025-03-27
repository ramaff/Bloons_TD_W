// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_targeting_script(_targeting = "first", _best_target_info = {}){

	var _targeting_script = scr_first_targeting
	
	if _targeting = "last" {
		_targeting_script = scr_last_targeting
		_best_target_info.path_position = 1;
	}
	if _targeting = "strong" {
		_targeting_script = scr_strong_targeting
	}
	if _targeting = "close" {
		_targeting_script = scr_close_targeting
		_best_target_info.bloon_distance = 9999;
	}
	
	return _targeting_script

}