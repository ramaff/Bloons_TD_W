/// @description Insert description here
// You can write your code in this editor

if !instance_exists(menu) {
	instance_destroy();	
}

var _track_info = menu.track_info

global.paths = _track_info.paths
global.round_data = _track_info.round_data

global.mission = string_replace_all(_track_info.name, " ", "_")

room_goto(menu.track_room)


