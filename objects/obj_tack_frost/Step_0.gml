/// @description Insert description here
// You can write your code in this editor

event_inherited();

if leak_frame {

	scr_bloon_set_speed(bloon_stats.speed * 1.1);
	
}

if stacks > 0 and bloon_stats.health < (bloon_stats.max_health * ((stacks - 1) / 3)) {
	// place one third or one half of consumed bloons into rolling head snowball
	
	var _class = "snow"
	var _layer = "jack_head"
	var _xx = x;
	var _yy = y;
	var _bloon_object = obj_snow_ball_bloon
	var _path = bloon_stats.path
	var _properties = []
	var _round = bloon_stats.round
	
	var _pos = path_position;
	
	var _transfer_bloons = []
	var _amt = floor(array_length(consumed_bloons) / (stacks))
	array_copy(_transfer_bloons, 0, consumed_bloons, array_length(consumed_bloons) - _amt, _amt)
	array_delete(consumed_bloons, array_length(consumed_bloons) - _amt, _amt)

	with instance_create_depth(_xx, _yy, depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
		path_position = _pos
		
		added_speed = 5
		event_user(0)
		consumed_bloons = _transfer_bloons
		banned = BANNED_EATS_BLOONS
	}
	
	stacks--;
	
}
image_index = stacks



