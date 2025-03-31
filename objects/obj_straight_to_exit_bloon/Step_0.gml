/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var _tar_dir = point_direction(x, y, path_get_x(bloon_stats.path, 1), path_get_y(bloon_stats.path, 1))

direction = scr_angle_converge(_tar_dir, direction, 1)

image_angle = direction;
