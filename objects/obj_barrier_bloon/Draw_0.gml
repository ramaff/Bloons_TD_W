/// @description Insert description here
// You can write your code in this editor

if bloon_stats.health <= bloon_stats.max_health / 2 {
	sprite_index = spr_barrier_bloon_damaged;	
} else {
	sprite_index = spr_barrier_bloon	
}

// Inherit the parent event
event_inherited();

