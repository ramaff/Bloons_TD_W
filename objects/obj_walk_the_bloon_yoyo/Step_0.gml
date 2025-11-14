/// @description Insert description here
// You can write your code in this editor

if instance_exists(projectile_stats.tower_id) {
	var _xx = projectile_stats.tower_id.x + 15
	var _yy = projectile_stats.tower_id.y - 35
	var _range = projectile_stats.tower_id.tower_stats.range + 10
	
	var _dist = point_distance(x, y, _xx, _yy)
	
	if _dist > 200 {
		var _dir = point_direction(x, y, _xx, _yy) + 180
		x = _xx + lengthdir_x(200, _dir);
		y = _yy + lengthdir_y(200, _dir);
	}
	
	var _offset = 0;
	if variable_struct_exists(projectile_stats, "spiral_homing_offset") {
		_offset = projectile_stats.spiral_homing_offset
	}
	if !instance_exists(target) {
		target = scr_get_bloon_target({"camo_detection": variable_struct_exists(projectile_stats, "camo_detection"), "range": _range, "damage_keys": projectile_stats.damage_keys}, _xx, _yy, projectile_stats.targeting, 0, real(id) + projectile_stats.id_offset)
	}
	if instance_exists(target) {
		tar_path = target.bloon_stats.path;
		tar_position = target.path_position;
		if point_distance(_xx, _yy, target.x, target.y) > (_range + 10) {
			target = noone;	
			if !instance_exists(target) {
				target = scr_get_bloon_target({"camo_detection": variable_struct_exists(projectile_stats, "camo_detection"), "range": _range, "damage_keys": projectile_stats.damage_keys}, _xx, _yy, projectile_stats.targeting, 0, real(id) + projectile_stats.id_offset)
			}
		}
	}
}

if tar_path != -1 {
			
	var _tpos = clamp(tar_position + scr_wave(-0.1, 0.1, 1, 0), 0, 1)
	var _tx = path_get_x(tar_path, _tpos)
	var _ty = path_get_y(tar_path, _tpos)
	
	direction = scr_angle_converge(point_direction(x, y, _tx, _ty), direction, 20);
}




// Inherit the parent event
event_inherited();

