/// @description Insert description here
// You can write your code in this editor

event_inherited();

if path_position >= 0.45 {
	speed = 0;	
	path_speed = 0;
} else {
	speed = 2;
	path_speed = 2;
}

if sign_direction != "none" {

	var _xx = x;
	var _sign_dir = sign_direction

	with(obj_projectile) {
	
		if abs(x - _xx) < 200 {
			if _sign_dir = "left" {
				if hspeed >= 0 {
					x -= hspeed + 4
				}
				x -= 6;
			} else {
				if hspeed <= 0 {
					x += hspeed + 4
				}
				x += 6;
			}
		}
	
	}
	
}


