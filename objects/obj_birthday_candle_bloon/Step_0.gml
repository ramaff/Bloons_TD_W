/// @description Insert description here
// You can write your code in this editor

if candle_lit and bloon_stats.health <= bloon_stats.max_health / 4 {
	candle_lit = false
	sprite_index = spr_birthday_candle_bloon_blown_out
	event_user(0)
}

scr_orbit_target(1);

if hspeed > 0 {
	image_xscale = abs(image_xscale)	
} else {
	image_xscale = -abs(image_xscale)		
}

// Inherit the parent event
event_inherited();

scr_off_path_leak()

if leak_frame {

	scr_bloon_set_speed(bloon_stats.speed * 1.1);
}





