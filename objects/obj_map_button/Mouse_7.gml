/// @description Insert description here
// You can write your code in this editor

var _track = room_get_name(track);

var _track_info = variable_struct_get(tracks_info, _track);

if variable_struct_exists(_track_info, "requirement") {
	var _req = _track_info.requirement
	var _req_mission_prog = variable_struct_get(global.missions_complete, _req)
	
	if !_req_mission_prog.complete {
		exit;	
	}
}

global.paths = _track_info.paths
global.round_data = _track_info.round_data
global.mission = string_replace(_track, " ", "_")

room_goto(track)




