/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

if bloon_stats.health < stored_health {
	
	var _lost_hp = ceil(stored_health - bloon_stats.health)
	
	while(_lost_hp > 0) {
		path_position -= 0.001;
		var _class = "normal"
		var _layers = ["red", "blue", "green", "yellow", "pink"]
		var _layer = _layers[abs((stored_health - _lost_hp) mod 5)]
		var _xx = x;
		var _yy = y;
		var _bloon_object = obj_bloon
		var _path = bloon_stats.path
		var _properties = ["float to track"]
		var _round = -1
	
		var _pos = path_position;
	
		with instance_create_depth(_xx, _yy, depth, _bloon_object) {
			scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
			path_position = _pos
			x = path_get_x(_path, path_position);
			y = path_get_y(_path, path_position);
			bloon_stats.vertical_speed += 2 + random(4);
			bloon_stats.float_height += 10;
			bloon_stats.vertical_direction = random(360);
		
			if instance_exists(target) {
				target.path_position = _pos	* 1;
				target.x = path_get_x(bloon_stats.path, path_position);
				target.y = path_get_y(bloon_stats.path, path_position);
				
				x = _xx;
				y = _yy
			}
		}
		_lost_hp--;
	}
	
	stored_health = bloon_stats.health	
}
