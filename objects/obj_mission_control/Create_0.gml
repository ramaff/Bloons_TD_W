/// @description Insert description here
// You can write your code in this editor

scr_setup_global_vars()

global.money = 65000
global.lives = 200

global.round = 0;
global.bloon_sends = scr_import_json(global.round_data, json_parse);

global.total_time = 0;

bloon_send_number = 0;

instance_create_depth(x, y, depth, obj_tower_control)

/*with instance_create_depth(800, 444, depth, obj_go_button) {
	image_yscale = 0.75	
} */

// Loop through the bloon sends for the most powerful bloon (if a specific bloon isn't specified)
// If round_icon is set, then use that as the sprite
// Otherwise just use the default sprite value for that bloon class
round_properties = [
]

for(var _i = 0; _i < array_length(global.bloon_sends); _i++) {
	round_properties[_i] = {
		"sprite": "spr_bloon",
		"index": 0
	}
	
	var _group = global.bloon_sends[_i];
	var _bloon_sends_end_time = 30;
	//show_debug_message(_group)
	for(var _j = 0; _j < array_length(_group); _j++) {
		_group[_j].round = _i + 1;
		_bloon_sends_end_time = max(_group[_j].cooldown + (_group[_j].count * _group[_j].spread), _bloon_sends_end_time);
	}
	variable_struct_set(round_properties[_i], "sends_end_time",_bloon_sends_end_time + 30);
}

global.round_time = 0
global.round_gap = 360;

for(var _i = 0; _i < array_length(global.paths); _i++) {
	var _path = global.paths[_i];
	for(var _j = 0; _j < 100; _j++) {
		var _xx = path_get_x(_path, _j / 100)
		var _yy = path_get_y(_path, _j / 100)
		var _xx_up = ceil(_xx / 16) * 16;
		var _xx_down = floor(_xx / 16) * 16;
		var _yy_up = ceil(_yy / 16) * 16;
		var _yy_down = floor(_yy / 16) * 16;
		//show_debug_message("_xx: " + string(_xx) + "_yy: " + string(_yy))
		instance_create_depth(_xx_down, _yy_down, depth, obj_non_placeable_tile)
		instance_create_depth(_xx_up, _yy_down, depth, obj_non_placeable_tile)
		instance_create_depth(_xx_up, _yy_up, depth, obj_non_placeable_tile)
		instance_create_depth(_xx_down, _yy_up, depth, obj_non_placeable_tile)
	}
}
