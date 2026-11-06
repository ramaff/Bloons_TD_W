/// @description Insert description here
// You can write your code in this editor

var _potency = floor(bloon_stats.layers + sqrt(bloon_stats.rbe - bloon_stats.layers))
var _target = scr_bloon_projectile_target(100 + sqrt(_potency), x, y)

if instance_exists(_target) {
	with instance_create_depth(x, y, depth - 1, obj_stun_proj) {
		stun = _potency
		direction = point_direction(x, y, _target.x, _target.y);
		speed = 6;
		image_blend = other.bloon_stats.stun_color;
		alarm[1] = 300;
		image_xscale = 0.1 + (sqrt(sqrt(_potency)) / 5);
		image_yscale = image_xscale;
	}
}

alarm[1] = 90;