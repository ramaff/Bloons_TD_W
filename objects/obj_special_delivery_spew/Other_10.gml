/// @description Insert description here
// You can write your code in this editor

var _layers = ["red", "blue", "green", "yellow", "pink"]
var _class = "animal"
var _xx = x;
var _yy = y;
var _bloon_object = obj_bloon_animal_bloon
var _path = global.paths[irandom(array_length(global.paths) - 1)]
var _properties = ["float to track"]
var _round = -1

var _pack_count = 1;
var _pos = path_position;

//repeat(_pack_count) {
	//for (var _i = 0; _i < array_length(_layers); _i++) {

		var _layer = _layers[layer_ind mod 5];
	
		with instance_create_depth(_xx, _yy, depth, _bloon_object) {
			scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
			path_position = _pos
			
			tower_id = other.tower_id;
			bloon_stats.vertical_speed += 1 + random(1);
			bloon_stats.float_height += 5;
		}
	//}
//}

layer_ind++;
