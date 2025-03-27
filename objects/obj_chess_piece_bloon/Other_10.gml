/// @description Insert description here
// You can write your code in this editor

var _path = global.paths[irandom(array_length(global.paths) - 1)];
bloon_stats.path = _path
path_position = 0;
path_start(_path, bloon_stats.speed, path_action_stop, true);
speed = bloon_stats.speed;
path_speed = speed;
//x = path_get_x(_path, 0)
//y = path_get_y(_path, 0)




