/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

if stored_health > bloon_stats.max_health {
	stored_health = bloon_stats.max_health	
}

if bloon_stats.health < stored_health {
	
	var _lost_hp = ceil(stored_health - bloon_stats.health)
	
	while(_lost_hp > 0) {
		if ceil((stored_health - _lost_hp) mod 10) = 0 {
			var _class = "bee"
			//var _layer = _layers[floor(abs((stored_health - _lost_hp) mod 25) / 5)]
			var _xx = x;
			var _yy = y;
			var _bloon_object = obj_bee_bloon
			var _path = bloon_stats.path
			var _round = -1
			var _properties = []
	
			var _pos = path_position;

			var _layer = "sturdy bee"
			repeat(5) {
				with instance_create_depth(_xx, _yy, depth, _bloon_object) {
					scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
					path_position = _pos
				
					if instance_exists(target) {
						instance_destroy(target)	
					}
		
					target = instance_nearest(x, y, obj_monkey)
					bloon_stats.remaining_value = 0;
				}
			}
		}
		_lost_hp--;
	}
	
	stored_health = bloon_stats.health	
}
