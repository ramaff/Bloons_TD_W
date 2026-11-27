/// @description Insert description here
// You can write your code in this editor

var _tar_angle = scr_off_path_wave()

var _ang_off = hspeed * 12

image_angle = -_ang_off

// Inherit the parent event
event_inherited();

scr_off_path_leak()

if leak_frame {
	if bloon_stats.layer = "blue" {
		gift_tier = max(1, gift_tier)	
	} else if bloon_stats.layer = "green" {
		gift_tier = max(2, gift_tier)
	}else if bloon_stats.layer = "yellow" {
		gift_tier = max(3, gift_tier)
	}else if bloon_stats.layer = "pink" {
		gift_tier = max(4, gift_tier)
	}

	scr_bloon_set_speed(bloon_stats.speed * 1.1);
	gift_loop++;
	if gift_loop > 6 {
		gift_tier = min(6, gift_tier + 1)
		gift_loop = 1
	}
	alarm[1] = 450 / speed
	image_index = 0;
	
}





