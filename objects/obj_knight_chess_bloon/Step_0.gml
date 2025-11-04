
event_inherited();

if leak_frame {

	scr_bloon_set_speed(bloon_stats.speed * 1.1);

	
}

if direction < 90 || direction > 270 {
	image_xscale = -1;
} else {
	image_xscale = 1;	
}

