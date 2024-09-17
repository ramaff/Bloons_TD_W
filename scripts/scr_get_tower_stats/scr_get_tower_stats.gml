// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_tower_stats(_base_tower_id){
	return variable_struct_get(global.tower_stats, _base_tower_id)
}