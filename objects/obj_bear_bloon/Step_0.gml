/// @description Insert description here
// You can write your code in this editor
//show_debug_message(bloon_stats.speed)
//show_debug_message(speed)
//show_debug_message(path_speed)
//show_debug_message("fart")
//show_debug_message(path_index)
//show_debug_message(bloon_stats.path)
//path_speed = speed;

event_inherited();

if leak_frame {
		
	alarm[1] = 150 / bloon_stats.speed;
	bloon_stats.speed = bloon_stats.speed * 1.15;
	speed = bloon_stats.speed;
	path_speed = speed;
	nerd_spawn = 3;
	
	alarm[4] = 750 / bloon_stats.speed;
	
}



