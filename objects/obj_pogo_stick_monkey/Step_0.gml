/// @description Insert description here
// You can write your code in this editor

depth = -y - hop_height

if stun > 0 {
	hop_height = lerp(hop_height, -1, 0.1);
	hop_speed = lerp(hop_speed, 0, 0.1);
	speed = 0;
	stun -= sqrt(tower_stats.total_cost) / 60;	
	exit;
}

y -= hop_speed
hop_height += hop_speed
	
hop_speed -= hop_gravity

var _target = scr_get_bloon_target(tower_stats, tower_base.x, tower_base.y, targeting)
	
if !instance_exists(_target) {
	_target = tower_base
}

if hop_height <= 0 {
	hop_height = 0;
	hop_speed = max_hop_speed
	scr_create_tower_projectiles(tower_stats.projectile_stats, x, y, _target, 0, {}, id)
}

direction = point_direction(x, y, _target.x, _target.y - hop_height);
speed = min(6, point_distance(x, y, _target.x, _target.y - hop_height))


