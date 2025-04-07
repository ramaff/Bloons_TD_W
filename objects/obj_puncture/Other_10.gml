/// @description Insert description here
// You can write your code in this editor


if instance_exists(target) {
	var _projectile_stats = {
		damage: puncture_damage,
		pierce: 999999999,
		tower_id: og_proj_tower_id
	}
	var _layers = ["red", "blue", "green", "yellow", "pink"]
	var _layer = _layers[puncture_damage - 1]
	var _class = "normal"
	var _xx = x;
	var _yy = y;
	var _bloon_object = obj_bloon
	var _path = target.bloon_stats.path
	var _properties = ["float to track"]
	var _round = -1
	
	scr_bloon_hit(target, target.bloon_stats.class, _projectile_stats);
	
	if !instance_exists(target) {
		instance_destroy()
		exit;
	}
	
	var _pos = target.path_position;
	
	with instance_create_depth(_xx, _yy, depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round, _xx, _yy)
		path_position = _pos
		bloon_stats.vertical_speed += 2 + random(4);
		bloon_stats.float_height += 10;
		
		if instance_exists(target) {
			target.path_position = _pos	* 0.7;
			if bloon_stats.path != -1 {
				target.x = path_get_x(bloon_stats.path, path_position);
				target.y = path_get_y(bloon_stats.path, path_position);
			}
			
			x = _xx;
			y = _yy
		}
	}
	
} else {
	instance_destroy();	
}

puncture -= 0.05;

if puncture <= 0 {
	instance_destroy()	
}



