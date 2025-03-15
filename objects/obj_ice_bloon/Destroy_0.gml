/// @description Insert description here
// You can write your code in this editor

var _projectile_stats = [
	{
		object: "obj_explosion_projectile",
		sprite: "spr_ice_burst",
		lead_hit: true,
		lifespan: 20,
		speed: 0,
		direction: 0,
		damage: 0,
		pierce: 60,
		size: 0.65,
		freeze: 1,
		freeze_time: 45,
		camo_detection: true
	}
]

scr_create_tower_projectiles(_projectile_stats, x, y, noone, 0, {}, tower_id);

// Inherit the parent event
event_inherited();

