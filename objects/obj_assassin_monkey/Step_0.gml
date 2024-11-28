/// @description Insert description here
// You can write your code in this editor


var _target = scr_get_bloon_target(tower_stats, x, y, targeting, range_boost)
//var _ang = random(360);

var _cx = x;
var _cy = y;

if instance_exists(_target) and tower_stats.barrage_count = 0 and (tower_stats.attack_cooldown - tick_down) <= 0 {
	var _ang = _target.direction
	var _xx = lengthdir_x(50, _ang)
	var _yy = lengthdir_y(50, _ang)

	x = _target.x + _xx;
	y = _target.y + _yy;
	
	repeat(3) {
		_cx = lerp(_cx, x, 0.4)
		_cy = lerp(_cy, y, 0.4)
		with instance_create_depth(_cx, _cy, depth, obj_after_image) {
			sprite_index = other.sprite_index;
			image_index = other.image_index;
		}
	}
}

// Inherit the parent event
event_inherited();

if !attacked and tower_stats.barrage_count <= 0 {
	x = og_x;
	y = og_y;
}