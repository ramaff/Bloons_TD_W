/// @description Insert description here
// You can write your code in this editor

alarm[0] = 5;

var _projectile_stats = [
	{
		sprite: "spr_needle",
		projectile_count: 4,
		projectile_spread: 90,
		direction: ang_offset,
		pierce: 2,
		damage: 1,
		speed: 15,
		lifespan: 15,
		camo_detection: true
	}
]

ang_offset += 45;

scr_create_tower_projectiles(_projectile_stats, x, y, noone, 0, {}, noone);

