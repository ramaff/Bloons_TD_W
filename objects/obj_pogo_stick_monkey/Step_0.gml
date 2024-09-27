/// @description Insert description here
// You can write your code in this editor

y -= hop_speed
hop_height += hop_speed
	
hop_speed -= hop_gravity


var _target = scr_get_bloon_target(tower_stats, x, y)
	
if !instance_exists(_target) {
	_target = tower_base
}

if hop_height <= 0 {
	hop_speed = hop_speed * (-1)
	scr_create_tower_projectiles(tower_stats, _target, x, y)
}

direction = point_direction(x, y, _target.x, _target.y - hop_height);
speed = min(5, point_distance(x, y, _target.x, _target.y))


