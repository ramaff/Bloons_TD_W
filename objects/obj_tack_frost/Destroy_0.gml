// Inherit the parent event
event_inherited();

var _class = "snow"
var _layer = "jack_head"
var _xx = x;
var _yy = y;
var _bloon_object = obj_snow_ball_bloon
var _path = bloon_stats.path
var _properties = []
var _round = bloon_stats.round
	
var _pos = path_position;
	
var _transfer_bloons = consumed_bloons

with instance_create_depth(_xx, _yy, depth, _bloon_object) {
	scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
	path_position = _pos
		
	added_speed = 0
	consumed_bloons = _transfer_bloons
	banned = BANNED_EATS_BLOONS
}