/// @description Insert description here
// You can write your code in this editor

if bully_count > 0 {
	
	with instance_create_depth(-32, 192, depth, obj_big_bully) {
		scr_bloon_stat_setup(id, "bully", 1)
	}
	
	bully_count--;
	alarm[6] = 150000 / bloon_send_speed
	bloon_send_speed += 5;
}