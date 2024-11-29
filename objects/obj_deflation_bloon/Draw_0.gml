/// @description Insert description here
// You can write your code in this editor

show_debug_message(bloon_stats.health)
show_debug_message(bloon_stats.health)
if bloon_stats.health <= bloon_stats.max_health / 2 {
	sprite_index = spr_big_deflation_bloon_damaged;	
} else {
	sprite_index = spr_big_deflation_bloon	
}

// Inherit the parent event
event_inherited();

