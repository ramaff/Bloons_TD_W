
event_inherited();

if leak_frame {

	bloon_stats.speed = bloon_stats.speed * 1.15;
	speed = bloon_stats.speed;
	path_speed = speed;

	
}

if direction < 90 || direction > 270 {
	image_xscale = -1;
} else {
	image_xscale = 1;	
}

