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
		with instance_create_depth(x, y, depth - 10, obj_slash) {
			image_angle = _ang
		}
		if abs(angle_difference(direction, _ang)) < 45 {
			projectile_stats.damage = projectile_stats.damage / 2;
			projectile_stats.size = projectile_stats.size / 1.4;
			image_xscale = image_xscale / 1.4;
			image_yscale = image_yscale / 1.4;
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

