// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bloon_class_to_object(_class = "normal", _layer = ""){

	var _class_stats = struct_get(global.bloon_stats, _class)
	var _asset = obj_bloon
	
	if variable_struct_exists(_class_stats, "object") {
		_asset = asset_get_index(_class_stats.object);
	}
	if variable_struct_exists(_class_stats, _layer) {
		var _layer_stats = variable_struct_get(_class_stats, _layer)
		if variable_struct_exists(_layer_stats, "object") {
			_asset = asset_get_index(_layer_stats.object);
		}
	}
	
	//show_debug_message(object_get_name(_asset))
	
	return _asset;

}