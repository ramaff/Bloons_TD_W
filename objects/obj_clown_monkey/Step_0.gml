/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if stun > 0 {
	exit;
}


if global.round > saved_round {
	saved_round = global.round
	
	
	var _layers = ["red", "blue", "green"]
	var _class = "animal"
	var _xx = x;
	var _yy = y;
	var _bloon_object = obj_bloon
	var _path = global.paths[irandom(array_length(global.paths) - 1)]
	var _properties = ["float to track"]
	var _round = -1

	var _pack_count = 2;
	
	if variable_struct_exists(tower_stats.active_upgrades, "Higher Quality Animals") {
		_layers = ["red", "blue", "green", "yellow", "pink"]
	}
	if variable_struct_exists(tower_stats.active_upgrades, "Increased Bloon Flow") {
		_pack_count = 4;
	}

	repeat(_pack_count) {
		for (var _i = 0; _i < array_length(_layers); _i++) {

			var _layer = _layers[_i];
	
			with instance_create_depth(_xx, _yy, depth, _bloon_object) {
				scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
				path_position = 0
				x = _xx;
				y = _yy;
				bloon_stats.vertical_speed += 1 + random(2);
				bloon_stats.float_height += 5;
		
				if instance_exists(target) {
					target.path_position = 0;
					target.x = path_get_x(bloon_stats.path, path_position);
					target.y = path_get_y(bloon_stats.path, path_position);
				
				}
			}
		}
	}
}
