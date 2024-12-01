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
		path_position -= 0.0033;
		if ceil((stored_health - _lost_hp) mod 10) = 0 {
			var _class = "splitter"
			var _layers = ["orange", "cyan", "lime", "amber", "purple"]
			//var _layer = _layers[floor(abs((stored_health - _lost_hp) mod 25) / 5)]
			var _xx = x;
			var _yy = y;
			var _bloon_object = obj_bloon
			var _path = bloon_stats.path
			var _properties = ["float to track"]
			var _round = -1
	
			var _pos = path_position;
	
			for (var _i = 0; _i < array_length(_layers); _i++) {
				var _layer = _layers[_i]
				with instance_create_depth(_xx, _yy, depth, _bloon_object) {
					scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
					path_position = _pos
					x = path_get_x(_path, path_position);
					y = path_get_y(_path, path_position);
					bloon_stats.vertical_speed += 2 + random(4);
					bloon_stats.float_height += 5;
					bloon_stats.vertical_direction = random(360);
		
					if instance_exists(target) {
						target.path_position = _pos	* 1;
						target.x = path_get_x(bloon_stats.path, path_position);
						target.y = path_get_y(bloon_stats.path, path_position);
				
						x = _xx;
						y = _yy
					}
				}
			}
		}
		_lost_hp--;
	}
	
	stored_health = bloon_stats.health	
}
