/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

if path_position < 0.4 {
	speed = lerp(speed, bloon_stats.speed, 0.05)
	sprite_index = spr_rocket_moab_on
} else {
	speed = lerp(speed, bloon_stats.speed * 0.5, 0.1)	
	sprite_index = spr_rocket_moab
}