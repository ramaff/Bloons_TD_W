/// @description Insert description here
// You can write your code in this editor

alarm[1] = 20;

var _tar_angle = point_direction(x, y, target.x, target.y)
direction = _tar_angle - 60 + random(120);

var _speed_fac = 1 + (2 - (2 * (bloon_stats.health / bloon_stats.max_health)))

speed = bloon_stats.speed * (_speed_fac + random(_speed_fac));




