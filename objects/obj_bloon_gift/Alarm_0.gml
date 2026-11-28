/// @description Insert description here
// You can write your code in this editor

alarm[0] = 60;

image_index = 1;

var _layer = blayer
var _class = bclass
var _xx = x;
var _yy = y;
var _bloon_object = bobject
var _path = bpath
var _properties = ["float to track"]
var _round = bround

var _pos = 0;

	
with instance_create_depth(_xx, _yy, depth, _bloon_object) {
	scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
	path_position = _pos
			
	bloon_stats.vertical_speed += 1 + random(1);
	bloon_stats.float_height += 5;

}

bamt--;

if bamt <= 0 {
	instance_destroy()	
}
