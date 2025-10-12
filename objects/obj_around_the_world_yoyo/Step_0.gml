/// @description Insert description here
// You can write your code in this editor

var _offset = 0;
if variable_struct_exists(projectile_stats, "spiral_homing_offset") {
	_offset = projectile_stats.spiral_homing_offset
}
	
if instance_exists(projectile_stats.tower_id) {
	var _xx = projectile_stats.tower_id.x + 15
	var _yy = projectile_stats.tower_id.y - 35
	var _range = projectile_stats.tower_id.tower_stats.range + 10
	
	if !instance_exists(target) {
		target = scr_get_bloon_target({"camo_detection": variable_struct_exists(projectile_stats, "camo_detection"), "range": _range, "damage_keys": projectile_stats.damage_keys}, _xx, _yy, projectile_stats.targeting, 0, real(id) + projectile_stats.id_offset)
	}
	
	if instance_exists(target) {
	orbit_dist = scr_converge(orbit_dist, point_distance(_xx, _yy, target.x, target.y), 1)
	} else {
		orbit_dist = scr_converge(orbit_dist, 100, 1)	
	}
	var _tx = _xx + lengthdir_x(orbit_dist, orbit_angle)
	var _ty = _yy + lengthdir_y(orbit_dist, orbit_angle)
	orbit_angle += 100 * projectile_stats.speed / orbit_dist;
	direction = point_direction(x, y, _tx, _ty)
	speed = min(speed + 0.5, point_distance(x, y, _tx, _ty))
}





// Inherit the parent event
event_inherited();

