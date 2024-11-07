/// @description Insert description here
// You can write your code in this editor
show_debug_message(bloon_stats.speed)
path_speed = speed;

event_inherited();

if leak_frame {
		
	alarm[1] = 300 / bloon_stats.speed;
	bloon_stats.speed = bloon_stats.speed * 1.2;
	path_speed = speed;
	
}



