// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_special_delivery(_tower_stats = tower_stats) {

	var _count = 1;
	if variable_struct_exists(_tower_stats.active_upgrades, "Clown Moab") {
		_count = 2;
	}

	var _xx = 0;
	var _yy = 0;

	repeat(_count) {
		with instance_create_depth(x, y, depth, obj_target_into_delivery) {
			delivery_type = other.targeting
			tower_id = other.id;
			xx = _xx;
			yy = _yy;
		}
		_xx = -50 + random(100);
		_yy = -50 + random(100);
	}


}