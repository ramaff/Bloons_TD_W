/// @description Insert description here
// You can write your code in this editor


alarm[0] = 5;

if image_alpha = 0 {
	exit;	
}

var _xx = x;
var _yy = y;

with(obj_projectile) {
	var _dist = distance_to_point(_xx, _yy)
	if _dist < 160 and _dist > 60 {
		var _ang = point_direction(x, y, _xx, _yy);
		if abs(angle_difference(direction, _ang)) < 45 {
			with instance_create_depth(x, y, depth - 10, obj_slash) {
				image_angle = _ang
			}
			scr_split_projectile_bad()
		}
	}
}

