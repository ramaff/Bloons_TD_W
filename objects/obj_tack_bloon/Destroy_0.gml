/// @description Insert description here
// You can write your code in this editor

var _projectile_stats = [
	{
		sprite: "spr_tack",
		projectile_count: 8,
		projectile_spread: 45,
		direction: 0,
		pierce: 1,
		damage: 1,
		speed: 12,
		lifespan: 15
	}
]

scr_create_tower_projectiles(_projectile_stats, x, y, noone, 0, {}, tower_id);

// Inherit the parent event
event_inherited();

