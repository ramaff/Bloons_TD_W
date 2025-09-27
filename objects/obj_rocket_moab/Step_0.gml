/// @description Insert description here
// You can write your code in this editor

show_debug_message($"path_position: {path_position}")
if path_position < 0.4 {
	speed = lerp(path_speed, bloon_stats.speed, 0.05)
	path_speed = speed;
	sprite_index = spr_rocket_moab_on
} else {
	speed = lerp(path_speed, bloon_stats.speed * 0.5, 0.2)	
	path_speed = speed;
	sprite_index = spr_rocket_moab
}

// Inherit the parent event
event_inherited();