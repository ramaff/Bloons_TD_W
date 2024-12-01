/// @description Insert description here
// You can write your code in this editor


var _cx = x;
var _cy = y;
	
var _ang = target.direction
var _xx = lengthdir_x(100, _ang)
var _yy = lengthdir_y(100, _ang)

x = target.x + _xx;
y = target.y + _yy;
	
var _nx = _cx
var _ny = _cy
repeat(3) {
	_nx = lerp(_nx, x, 0.4)
	_ny = lerp(_ny, y, 0.4)
	with instance_create_depth(_nx, _ny, depth, obj_after_image) {
		sprite_index = other.sprite_index;
		image_index = other.image_index;
	}
}
	
if variable_struct_exists(tower_stats.active_upgrades, "Shadow Clones") {
	repeat(2) {
		_ang += 120;
		_xx = lengthdir_x(100, _ang)
		_yy = lengthdir_y(100, _ang)
		with instance_create_depth(target.x + _xx, target.y + _yy, depth, obj_after_image) {
			sprite_index = other.sprite_index;
			image_index = other.image_index;
			alarm[0] = 40;
			scr_tower_attack(other.tower_stats, other.tower_stats.projectile_stats, other.current_boosts, other.range_boost, other.targeting, other.tower_stats.id)
		}
		_nx = _cx
		_ny = _cy
		repeat(3) {
			_nx = lerp(_nx, target.x + _xx, 0.4)
			_ny = lerp(_ny, target.y + _yy, 0.4)
			with instance_create_depth(_nx, _ny, depth, obj_after_image) {
				sprite_index = other.sprite_index;
				image_index = other.image_index;
			}
		}
	}
}



