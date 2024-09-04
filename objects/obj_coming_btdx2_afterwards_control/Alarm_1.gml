/// @description Insert description here
// You can write your code in this editor

if blue_count > 0 {
	
	with instance_create_depth(-32, 192, depth, obj_bloon) {
		scr_bloon_stat_setup(id, "normal", 2)
	}
	
	blue_count--;
	alarm[1] = 150 / bloon_send_speed
	bloon_send_speed += 0.03;
	
}

