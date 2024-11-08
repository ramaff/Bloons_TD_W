/// @description Insert description here
// You can write your code in this editor

event_inherited();

if leak_frame {
	
	bloon_stats.speed = bloon_stats.speed * 1.2;
	//path_speed = speed;
	//speed = bloon_stats.speed;
	//path_speed = speed;
	
}

path_speed = lerp(path_speed, bloon_stats.speed, 0.02);

if distance_to_object(obj_big_bully_bloon) < 100 {
	path_speed = lerp(path_speed, bloon_stats.speed * 4, 0.1);
}

if path_speed > (bloon_stats.speed * 4) {
	image_angle	+= 5;
} else {
	image_angle = scr_angle_converge(0, image_angle, 10)	
}



