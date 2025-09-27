/// @description Insert description here
// You can write your code in this editor

alarm[1] = 300
alarm[2] = 30;

sprite_index = spr_catapult_bloon_shooting

var _class = "ceramic"
//var _layer = _layers[floor(abs((stored_health - _lost_hp) mod 25) / 5)]
var _xx = x;
var _yy = y - 50;
var _bloon_object = obj_ceramic_class
var _path = bloon_stats.path
var _properties = ["float to track"]
var _round = -1
	
var _pos = path_position;

var _layer = "ceramic"
repeat(5) {
	with instance_create_depth(_xx, _yy, depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
		path_position = _pos
		bloon_stats.vertical_speed += 2 + random(4);
		bloon_stats.float_height = 50;
		bloon_stats.remaining_value = 1;
		
		if instance_exists(target) {
			target.path_position = mean(1, _pos);
			target.x = path_get_x(bloon_stats.path, target.path_position);
			target.y = path_get_y(bloon_stats.path, target.path_position);
				
			x = _xx;
			y = _yy
		
			bloon_stats.vertical_direction = point_direction(x, y, target.x, target.y - 150)
		}
	}
}





