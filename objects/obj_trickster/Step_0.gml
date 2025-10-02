/// @description Insert description here
// You can write your code in this editor

depth = -y

scr_generic_tower_pre_fire_step();

if tower_stats.attack_cooldown <= 0 and !instance_exists(yoyo) {	
	var _damage_keys = []
	if variable_struct_exists(tower_stats, "damage_keys") {
		_damage_keys = tower_stats.damage_keys	
	}

	yoyo = scr_create_tower_projectiles(tower_stats.projectile_stats, x, y, noone, 0, {}, id, targeting, _damage_keys)[0]
}

scr_generic_tower_post_fire_step();
