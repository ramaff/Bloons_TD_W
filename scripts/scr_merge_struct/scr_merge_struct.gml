// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_merge_struct(_target_struct, _merging_struct, _inner_join = false){
	var _merged_struct = _target_struct;
    if (_inner_join) {
	    var _keys_to_copy = variable_struct_get_names(_target_struct);
	    for (var _i = 0; _i < array_length(_keys_to_copy); _i++) {
		    if (variable_struct_exists(_merging_struct, _keys_to_copy[_i]))          
		        variable_struct_set(_merged_struct, _keys_to_copy[_i], variable_struct_get(_merging_struct, _keys_to_copy[_i]));
		    }
	} else {
		var _keys_to_copy = variable_struct_get_names(_merging_struct);
		for (var _i = 0; _i < array_length(_keys_to_copy); _i++) {
		    variable_struct_set(_merged_struct, _keys_to_copy[_i], variable_struct_get(_merging_struct, _keys_to_copy[_i]));
		}
	}
    return _merged_struct;
}
