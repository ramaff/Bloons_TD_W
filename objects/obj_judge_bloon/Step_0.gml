/// @description Insert description here
// You can write your code in this editor

event_inherited();


if leak_frame {

	scr_bloon_set_speed(bloon_stats.speed * 1.1);

}

if guilt > 50 {
	guilt -= 50;
	
	var _class = "lawyer"
	//var _layer = _layers[floor(abs((stored_health - _lost_hp) mod 25) / 5)]
	var _xx = x;
	var _yy = y;
	var _bloon_object = obj_executioner
	var _path = bloon_stats.path
	var _properties = []
	var _round = -1
	
	var _pos = 0;

	var _layer = "the executioner"
	with instance_create_depth(_xx, _yy, depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
		path_position = _pos
	}
	
	with instance_create_depth(480, 600, -600, obj_generic_bloons_note) {
		text = "The judge and jury has deemed you guilty."
		
		alarm[0] = 180;
		alarm[2] = 360;

		speed = 9;
		direction = 90;
	}
	
}

	



