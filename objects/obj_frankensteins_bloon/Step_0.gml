/// @description Insert description here
// You can write your code in this editor

if bloon_stats.health <= (bloon_stats.max_health / 2) and alarm[3] = -1 {
	if alarm[1] == -1 {
		alarm[1] = 600;
		alarm[2] = 740;
		speed = 0;
		path_speed = 0;
		sprite_index = spr_frankensteins_bloon_pile;
		image_index = 0;
	}
}

// Inherit the parent event
event_inherited();

if leak_frame {
	
	
	bloon_stats.speed = bloon_stats.speed * 1.15;
	path_speed = speed;
	speed = bloon_stats.speed;
	path_speed = speed;
	
}


