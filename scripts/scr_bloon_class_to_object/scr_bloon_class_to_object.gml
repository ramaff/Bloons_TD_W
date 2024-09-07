// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bloon_class_to_object(_class = "normal"){

	var _class_stats = struct_get(global.bloon_stats, _class)
	
	if variable_struct_exists(_class_stats, "object") {
		return asset_get_index(_class_stats.object);
	}
	
	return obj_bloon;

}