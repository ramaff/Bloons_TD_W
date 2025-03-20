/// @description Insert description here
// You can write your code in this editor

var _xx = x;
var _yy = y;
var _ang = 0;
var _wiz_id = id;
repeat(16) {
	with instance_create_depth(_xx, _yy, depth, obj_orbital_bloon) {
		scr_bloon_stat_setup(id, "rune", "barrier", pth_og_cba, [], -1)
		path_end()
		path_position = 0
		x = _xx;
		y = _yy;
				
		if instance_exists(target) {
			instance_destroy(target)	
		}
		
		target = _wiz_id
		bloon_stats.remaining_value = 0;
		orbit_angle = _ang
		orbit_distance = 150;
	}
	_ang += 22.5
}
repeat(8) {
	with instance_create_depth(_xx, _yy, depth, obj_orbital_bloon) {
		scr_bloon_stat_setup(id, "rune", "barrier", pth_og_cba, [], -1)
		path_end()
		path_position = 0
		x = _xx;
		y = _yy;
				
		if instance_exists(target) {
			instance_destroy(target)	
		}
		
		target = _wiz_id
		bloon_stats.remaining_value = 0;
		orbit_angle = _ang
	}
	_ang += 45
}

image_index = 1;

alarm[3] = 60 / bloon_stats.speed;