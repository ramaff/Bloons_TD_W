/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if leak_frame {
	
	bloon_stats.speed = bloon_stats.speed * 1.15;
	path_speed = speed;
	speed = bloon_stats.speed;
	path_speed = speed;
	
}


if instance_exists(slicer) {
	image_alpha = 0
	path_speed = 0
} else {
	image_alpha = lerp(image_alpha, 1, 0.2);
	path_speed = bloon_stats.speed
}

