// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_trickster_projectile_replace(){

	if instance_exists(yoyo) {
		instance_destroy(yoyo)	
	}
	if instance_exists(around_the_world) {
		instance_destroy(around_the_world)	
	}
	if instance_exists(walk_the_bloon) {
		instance_destroy(walk_the_bloon)	
	}
	
	tower_stats.attack_cooldown = 0

	var _additional_attacks = []
	if variable_struct_exists(tower_stats, "additional_attacks") {
		_additional_attacks = tower_stats.additional_attacks	
	}

	for(var _i = 0; _i < array_length(_additional_attacks); _i++) {
		var _attack = _additional_attacks[_i];
		_attack.attack_cooldown = 0;
	}

}