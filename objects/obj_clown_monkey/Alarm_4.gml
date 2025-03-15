/// @description Insert description here
// You can write your code in this editor

alarm[4] = 120;
if variable_struct_exists(tower_stats.active_upgrades, "Increased Bloon Flow") {
	alarm[4] = alarm[4] / 2;
}

if stun > 0 {
	exit;
}

var _class = "bomb"
var _layer = "red"
var _path = global.paths[irandom(array_length(global.paths) - 1)]
var _properties = ["float to track"]
var _round_number = -1
var _bloon_object = obj_bomb_bloon
var _xx = x;
var _yy = y;

with instance_create_depth(path_get_x(_path, 0), path_get_y(_path, 0), depth, _bloon_object) {
	scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round_number);
	
	tower_id = other.tower_stats.id
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


