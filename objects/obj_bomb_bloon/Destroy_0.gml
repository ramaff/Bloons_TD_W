/// @description Insert description here
// You can write your code in this editor

var _projectile_stats = [
	{
		object: "obj_explosion_projectile",
		sprite: "spr_explosion",
		lead_hit: true,
		lifespan: 20,
		speed: 0,
		direction: 0,
		damage: 1,
		pierce: 60,
		size: 0.75,
		camo_detection: true
	}
]

scr_create_tower_projectiles(_projectile_stats, x, y, noone, 0, {}, tower_id);

// Inherit the parent event
event_inherited();

