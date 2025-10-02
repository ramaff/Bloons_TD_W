/// @description Insert description here
// You can write your code in this editor

if instance_exists(projectile_stats.tower_id) {
	var _xx = projectile_stats.tower_id.x
	var _yy = projectile_stats.tower_id.y
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
		target = scr_get_bloon_target({"camo_detection": variable_struct_exists(projectile_stats, "camo_detection"), "range": 160, "damage_keys": projectile_stats.damage_keys}, _xx, _yy, projectile_stats.targeting, 0, id)
	}
	if instance_exists(target) {
		direction = scr_angle_converge(point_direction(x, y, target.x, target.y) + _offset, direction, 20);
	}
}




// Inherit the parent event
event_inherited();

