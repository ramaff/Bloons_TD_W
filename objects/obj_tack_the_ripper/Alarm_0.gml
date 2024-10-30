/// @description Insert description here
// You can write your code in this editor


var _xx = x;
var _yy = y;

with(obj_projectile) {
	if distance_to_point(_xx, _yy) < 160 {
		var _ang = point_direction(x, y, _xx, _yy);
		if abs(angle_difference(direction, _ang)) < 45 {
			var _proj = instance_copy(false)
			if image_angle = direction {
				image_angle -= 75;	
			}
			direction -= 75;
			if _proj.image_angle = _proj.direction {
				_proj.image_angle += 75;	
			}
			_proj.direction += 75;
		}
	}
}

alarm[0] = 5;

