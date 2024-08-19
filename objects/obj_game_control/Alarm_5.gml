/// @description Insert description here
// You can write your code in this editor

if mini_moab_count > 0 {
	
	with instance_create_depth(-32, 192, depth, obj_mini_moab) {
		scr_bloon_stat_setup(id, "moab", 1)
	}
	
	mini_moab_count--;
	alarm[5] = 15000 / bloon_send_speed
	bloon_send_speed += 1.5;
	
}