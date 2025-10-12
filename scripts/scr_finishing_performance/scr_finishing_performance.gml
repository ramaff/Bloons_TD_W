// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_finishing_performance(){
	
	var _ability_stats = [
		{
			"projectile_stats": variable_clone(tower_stats.projectile_stats)
		}
	]
	if variable_struct_exists(tower_stats, "additional_attacks") {
		_ability_stats = array_concat(_ability_stats, variable_clone(tower_stats.additional_attacks))
	}
	
	_ability_stats = array_concat(_ability_stats, _ability_stats)
	
	var _base_speed = _ability_stats[0].projectile_stats[0].speed
	
	for(var _i = 0; _i < array_length(_ability_stats); _i++) {
		var _attack = _ability_stats[_i];
		
		var _damage_keys = []
		if variable_struct_exists(tower_stats, "damage_keys") {
			_damage_keys = tower_stats.damage_keys	
		}
		_attack.projectile_stats[0].lifespan = 1200
		
		_base_speed += 2;
		
		_attack.projectile_stats[0].speed = _base_speed

		scr_create_tower_projectiles(_attack.projectile_stats, x, y, noone, 0, {}, id, targeting, _damage_keys)
		
	}
	

}