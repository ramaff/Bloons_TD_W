/// @description Insert description here
// You can write your code in this editor

alarm[0] = 30;

if instance_exists(target) {
	x = target.x;
	y = target.y;
	var _projectile_stats = {
		damage: ceil(puncture),
		pierce: 999999999
	}
	var _layers = ["red", "blue", "green", "yellow", "pink"]
	var _layer = _layers[ceil(puncture) - 1]
	var _class = "normal"
	var _xx = x;
	var _yy = y;
	var _bloon_object = obj_bloon
	var _path = target.bloon_stats.path
	var _properties = ["float to track"]
	var _round = -1
	
	scr_bloon_hit(target, target.bloon_stats.class, _projectile_stats);
	
	var _pos = target.path_position;
	
	with instance_create_depth(_xx, _yy, depth, _bloon_object) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
		path_position = _pos
		x = path_get_x(_path, path_position);
		y = path_get_y(_path, path_position);
	}
	
} else {
	instance_destroy();	
}

puncture -= 0.2;

if puncture <= 0 {
	instance_destroy()	
}
