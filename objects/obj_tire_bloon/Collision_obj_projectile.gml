/// @description Insert description here
// You can write your code in this editor

other.direction = other.direction - 270 + random(180);

other.x += lengthdir_x(other.speed + 20, other.direction)
other.y += lengthdir_y(other.speed + 20, other.direction)

added_speed = max(0, added_speed - (0.45 * other.projectile_stats.damage));
speed = added_speed + 1
path_speed = added_speed + 1

