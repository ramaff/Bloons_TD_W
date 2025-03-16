/// @description Insert description here
// You can write your code in this editor

alarm[0] = 90;

if x < 0 || x > 800 || y < 60 || y > 540 {
	if path_speed = 0 {
		speed = 2;
		direction = point_direction(x, y, 400, 300)
	}
}

if variable_struct_exists(bloon_stats, "regrow") {
	scr_bloon_regen(self, bloon_stats)
}




