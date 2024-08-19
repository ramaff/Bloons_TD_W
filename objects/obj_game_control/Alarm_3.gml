/// @description Insert description here
// You can write your code in this editor

if yellow_count > 0 {
	
	with instance_create_depth(-32, 192, depth, obj_bloon) {
		scr_bloon_stat_setup(id, "normal", 4)
	}
	
	yellow_count--;
	alarm[3] = 540 / bloon_send_speed
	bloon_send_speed += 0.1;
	
}

