// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_power_dart(){
	var _ability_stats = variable_clone(tower_stats.projectile_stats)
	
	var _proj_count = array_length(_ability_stats)
	
	for(var _i = 0; _i < _proj_count; _i++) {
		_ability_stats[_i].damage = _ability_stats[_i].damage * 3;	
		_ability_stats[_i].pierce = _ability_stats[_i].pierce * 50;
		
	}
	
	scr_create_tower_projectiles(_ability_stats, x, y, noone, 0)
}