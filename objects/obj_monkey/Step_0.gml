/// @description Insert description here
// You can write your code in this editor

depth = -y

scr_generic_tower_pre_fire_step();

if tower_stats.attack_cooldown <= 0 {	
	attacked = scr_tower_attack(tower_stats, tower_stats.projectile_stats, current_boosts, range_boost, targeting) || attacked
	if variable_struct_exists(tower_stats, "attack_barrages") {
		tower_stats.barrage_count = tower_stats.attack_barrages
		alarm[1] = tower_stats.barrage_delay
	}
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
		var _add_attack = scr_tower_attack(_attack, _attack.projectile_stats, current_boosts, range_boost, undefined, tower_stats.id)
		attacked = _add_attack || attacked
		if _add_attack {
			_attack.attack_cooldown += _attack.delay
		}
	}	
}

scr_generic_tower_post_fire_step();

