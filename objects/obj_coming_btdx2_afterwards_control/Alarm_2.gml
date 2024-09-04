/// @description Insert description here
// You can write your code in this editor

if green_count > 0 {
	
	with instance_create_depth(-32, 192, depth, obj_bloon) {
		scr_bloon_stat_setup(id, "normal", 3)
	}
	
	green_count--;
	alarm[2] = 300 / bloon_send_speed
	bloon_send_speed += 0.05;
	
}

