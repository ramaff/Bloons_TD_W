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
	attacked = true
	
	tower_stats.attack_cooldown += tower_stats.delay
}

var _additional_attacks = []
if variable_struct_exists(tower_stats, "additional_attacks") {
	_additional_attacks = tower_stats.additional_attacks	
}

for(var _i = 0; _i < array_length(_additional_attacks); _i++) {
	var _attack = _additional_attacks[_i];
	_attack.damage_keys = tower_stats.damage_keys
	
	if _attack.attack_cooldown > 0 {
		_attack.attack_cooldown -= tick_down;
	}
	
	if _attack.attack_cooldown <= 0 {
		
		var _damage_keys = []
		if variable_struct_exists(tower_stats, "damage_keys") {
			_damage_keys = tower_stats.damage_keys	
		}

		if !instance_exists(walk_the_bloon) and _i = 0 {
			walk_the_bloon = scr_create_tower_projectiles(_attack.projectile_stats, x, y, noone, 0, {}, id, targeting, _damage_keys)[0]
	
			attacked = true
			_attack.attack_cooldown += _attack.delay
		}
		if !instance_exists(around_the_world) and _i = 1 {
			around_the_world = scr_create_tower_projectiles(_attack.projectile_stats, x, y, noone, 0, {}, id, targeting, _damage_keys)[0]
	
			attacked = true
			_attack.attack_cooldown += _attack.delay
		}
		
	}	
}

scr_generic_tower_post_fire_step();
