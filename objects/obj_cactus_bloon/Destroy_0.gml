/// @description Insert description here
// You can write your code in this editor

var _projectile_stats = [
	{
		sprite: "spr_needle",
		projectile_count: 16,
		projectile_spread: 22.5,
		direction: 22.5,
		pierce: 2,
		damage: 1,
		speed: 15,
		lifespan: 15,
		camo_detection: true
	}
]

scr_create_tower_projectiles(_projectile_stats, x, y, noone, 0, {}, noone);

// Inherit the parent event
event_inherited();

