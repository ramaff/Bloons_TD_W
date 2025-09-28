/// @description Insert description here
// You can write your code in this editor

event_inherited();

projs = []

all_bases = false

path_num = 0;

var _path = global.paths[path_num mod array_length(global.paths)]
path_num++;
path_start(_path, -5, path_action_stop, true);
				
x = path_get_x(_path, 0)
y = path_get_y(_path, 0)

path_position = 0;
