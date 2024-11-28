// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_tower_attack(_tower_stats = tower_stats, _projectile_stats = tower_stats.projectile_stats, _current_boosts = {}, _range_boost = 0, _targeting = targeting){
	if variable_struct_exists(_tower_stats, "tower_attack_script") {
		script_execute(_tower_stats.tower_attack_script)
	}
	
	target = scr_get_bloon_target(_tower_stats, x, y, _targeting, _range_boost)
	
	if !instance_exists(target) {
		return false;
	}
	
	if variable_struct_exists(_tower_stats, "no_target") {
		if _tower_stats.no_target {
			target = noone;
		}
	}
	
	var _angle_offset = 0;
	if variable_struct_exists(_tower_stats, "attack_angle_offset") {
		_angle_offset += _tower_stats.attack_angle_offset
	}
	
	scr_create_tower_projectiles(_projectile_stats, x, y, target, _angle_offset, _current_boosts, _tower_stats.id)

	return true;
	
}