/// @description Insert description here
// You can write your code in this editor

depth = -y - hop_height

y -= hop_speed
hop_height += hop_speed
	
hop_speed -= hop_gravity


var _target = scr_get_bloon_target(tower_stats, tower_base.x, tower_base.y)
	
if !instance_exists(_target) {
	_target = tower_base
}

if hop_height <= 0 {
	hop_height = 0;
	hop_speed = max_hop_speed
	scr_create_tower_projectiles(tower_stats.projectile_stats, x, y, _target)
}

direction = point_direction(x, y, _target.x, _target.y - hop_height);
speed = min(5, point_distance(x, y, _target.x, _target.y - hop_height))


