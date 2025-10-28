/// @description Insert description here
// You can write your code in this editor

event_inherited();

if leak_frame {

	bloon_stats.speed = bloon_stats.speed * 1.15;
	speed = bloon_stats.speed;
	path_speed = speed;

}

if capital > 2500 {
	capital -= 2500;
	
	var _class = "ceramic"
	//var _layer = _layers[floor(abs((stored_health - _lost_hp) mod 25) / 5)]
	var _xx = x;
	var _yy = y;
	var _bloon_object = obj_ceramic_class
	var _path = bloon_stats.path
	var _properties = []
	var _round = -1
	
	var _pos = path_position;

	var _layer = "housing"
	with instance_create_depth(_xx, _yy, depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
		path_position = _pos
	}
	
}





