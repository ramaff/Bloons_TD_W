/// @description Insert description here
// You can write your code in this editor

var _tar_angle = scr_off_path_wave(0.2)

var _ang_off = hspeed * 12

image_angle = -_ang_off

if hspeed > 0 {
	image_xscale = abs(image_xscale)	
} else {
	image_xscale = -abs(image_xscale)		
}

// Inherit the parent event
event_inherited();

scr_off_path_leak()

if leak_frame {
	if bloon_stats.layer = "blue" {
		gift_tier = max(1, gift_tier)	
	} else if bloon_stats.layer = "green" {
		gift_tier = max(2, gift_tier)
	} else if bloon_stats.layer = "yellow" {
		gift_tier = max(3, gift_tier)
	} else if bloon_stats.layer = "pink" {
		gift_tier = max(4, gift_tier)
	} else if bloon_stats.layer = "rainbow" {
		gift_tier = max(5, gift_tier)
	}

	scr_bloon_set_speed(bloon_stats.speed * 1.1);
	gift_loop++;
	/*if gift_loop > 6 and gift_tier < 5 {
		gift_tier += 1
		gift_loop = 1
	} */
	alarm[1] = 450 / speed
	image_index = 0;
	
}





