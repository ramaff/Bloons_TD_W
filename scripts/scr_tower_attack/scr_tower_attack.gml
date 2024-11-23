// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_tower_attack(_tower_stats = tower_stats, _current_boosts = {}, _range_boost = 0){
	if variable_struct_exists(_tower_stats, "tower_attack_script") {
		script_execute(_tower_stats.tower_attack_script)
	}
	
	var _target = scr_get_bloon_target(_tower_stats, x, y, targeting, _range_boost)
	
	if !instance_exists(_target) {
		return false;
	}
	
	if variable_struct_exists(_tower_stats, "no_target") {
		if _tower_stats.no_target {
			_target = noone;
		}
	}
	
	var _angle_offset = 0;
	if variable_struct_exists(_tower_stats, "attack_angle_offset") {
		_angle_offset += _tower_stats.attack_angle_offset
	}
	
	_tower_stats.attack_cooldown += _tower_stats.delay	
	scr_create_tower_projectiles(_tower_stats.projectile_stats, x, y, _target, _angle_offset, _current_boosts, tower_stats.id)

	return true;
	
}