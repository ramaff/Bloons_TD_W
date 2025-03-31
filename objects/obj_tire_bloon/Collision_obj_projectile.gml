/// @description Insert description here
// You can write your code in this editor

other.direction = other.direction - 270 + random(180);

other.x += lengthdir_x(other.speed + 20, other.direction)
other.y += lengthdir_y(other.speed + 20, other.direction)

var _old_added_speed = added_speed
added_speed = max(2, added_speed + 0.3);
speed += added_speed - _old_added_speed
path_speed += added_speed - _old_added_speed

