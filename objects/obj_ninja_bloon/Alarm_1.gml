/// @description Insert description here
// You can write your code in this editor
var _potency = bloon_stats.layers
var _target = scr_bloon_projectile_target(160 + (_potency * 2.5), x, y)

if instance_exists(_target) {
	var _count = floor(_potency / 5)
	var _gap = 15
	var _dir = point_direction(x, y, _target.x, _target.y);
	_dir -= ((_count - 1) * (_gap / 2))
	repeat(_count) {
		with instance_create_depth(x, y, depth - 1, obj_stun_proj) {
			sprite_index = spr_ninja_star
			stun = 5
			direction = _dir;
			speed = 6;
			alarm[1] = 300;
		}
		_dir += _gap
	}
}

alarm[1] = 120 / path_speed;


