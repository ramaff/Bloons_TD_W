/// @description Insert description here
// You can write your code in this editor


tower_stats.attack_cooldown = 60;

// Inherit the parent event
event_inherited();

var _ox = x;
var _oy = y
var _ang = angle_offset

var _ghosts = struct_get_names(ghosts)
var _ghost_count = array_length(_ghosts)
var _angle_gap = 360 / _ghost_count
var _angle_add = 0;
var _orbit = sqrt(6000 + (3000 * _ghost_count))

for(var _i = 0; _i < _ghost_count; _i++) {
	var _ghost = variable_struct_get(ghosts, _ghosts[_i])
	if !instance_exists(_ghost) {
		continue	
	}
	_angle_add += _angle_gap
	with(_ghost) {
		var _xx = _ox + lengthdir_x(_orbit, _ang + _angle_add)
		var _yy = _oy + lengthdir_y(_orbit, _ang + _angle_add)
	
		direction = point_direction(x, y, _xx, _yy)
		speed = min(4, point_distance(x, y, _xx, _yy))
	}
}

angle_offset++;