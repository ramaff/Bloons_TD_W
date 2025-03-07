// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_track_end_bloon_check(_bloon_stats = bloon_stats){
	if path_position >= 1 {
	
		var _hero_number = irandom(instance_number(obj_hero) - 1)
	
		if !instance_exists(obj_hero) {
			if !instance_exists(obj_lose_indication) {
				instance_create_depth(10, 600, -500, obj_lose_indication)
			}
		}
		var _damage = 1;
		if variable_struct_exists(_bloon_stats, "rbe") {
			_damage = _bloon_stats.rbe
		}
		if variable_struct_exists(_bloon_stats, "max_health") {
			_damage += _bloon_stats.health - _bloon_stats.max_health;
		}
		if variable_struct_exists(_bloon_stats, "damage") {
			_damage = _bloon_stats.damage	
		}
	
		with (obj_hero) {
			if _hero_number = 0 {
				tower_stats.health -= _damage
				with instance_create_depth(x, y, -100, obj_text) {
					text = "-" + string(_damage);	
				}
				if variable_struct_exists(tower_stats, "damage_scripts") {
					for(var _i = 0; _i < array_length(tower_stats.damage_scripts); _i++) {
						script_execute(tower_stats.damage_scripts[_i])
					}
				}
			}
			_hero_number--;
			if tower_stats.health <= 0 {
				with (obj_tower_tile) {
					if instance_exists(tower_id) {
						if tower_id = other.id {
							instance_destroy()
						}
					}
				}
				instance_destroy();	
			}
		}
	
		path_position = 0;
		if instance_exists(target) {
			x = path_get_point_x(bloon_stats.path, 0)
			y = path_get_point_x(bloon_stats.path, 0)
		} else {
			path_start(bloon_stats.path, _bloon_stats.speed, path_action_stop, true);
		}
		
		return true;
	
	}
	
	return false;
}