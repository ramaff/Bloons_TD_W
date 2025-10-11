/// @description Insert description here
// You can write your code in this editor

var _offset = 0;
if variable_struct_exists(projectile_stats, "spiral_homing_offset") {
	_offset = projectile_stats.spiral_homing_offset
}
	
if instance_exists(projectile_stats.tower_id) {
	var _xx = projectile_stats.tower_id.x + 15
	var _yy = projectile_stats.tower_id.y - 35
	var _dist = point_distance(x, y, _xx, _yy)
	
	if _dist > 200 {
		var _dir = point_direction(x, y, _xx, _yy) + 180
		x = _xx + lengthdir_x(200, _dir);
		y = _yy + lengthdir_y(200, _dir);
	}
	
	if !instance_exists(target) {
		target = scr_get_bloon_target({"camo_detection": variable_struct_exists(projectile_stats, "camo_detection"), "range": 160, "damage_keys": projectile_stats.damage_keys}, _xx, _yy, projectile_stats.targeting, 0, real(id) + projectile_stats.id_offset)
	}
}



if instance_exists(target) {
	orbit_dist = scr_converge(orbit_dist, point_distance(x, y, target.x, target.y), 1)
} else {
	orbit_dist = scr_converge(orbit_dist, 100, 1)	
}
var _tx = x + lengthdir_x(orbit_dist, orbit_angle)
var _ty = y + lengthdir_y(orbit_dist, orbit_angle)
orbit_angle += 30 * speed / orbit_dist;
direction = scr_angle_converge(point_direction(x, y, _tx, _ty) + _offset, direction, 20);




// Inherit the parent event
event_inherited();

