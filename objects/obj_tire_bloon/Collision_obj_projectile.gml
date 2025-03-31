/// @description Insert description here
// You can write your code in this editor

other.direction = other.direction - 270 + random(180);

other.x += lengthdir_x(other.speed + 20, other.direction)
other.y += lengthdir_y(other.speed + 20, other.direction)

added_speed = max(2, added_speed + 0.3);
speed = max(2, speed + 0.3);
path_speed = max(2, path_speed + 0.3);

