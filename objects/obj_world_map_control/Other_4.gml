/// @description Insert description here
// You can write your code in this editor

if room == rm_world_1_map || room == rm_world_1_5_map || room == rm_world_2_map || room == rm_world_2_5_map || room == rm_world_3_map {
	global.start_room = room
	
	var _i = 0;
	var _missions = struct_get_names(global.mission_unlocks)
	for(_i = 0; _i < array_length(_missions); _i++) {
		var _track = _missions[_i]
		var _current_mission_stats = variable_struct_get(global.mission_unlocks, _track);
		var _mission_prog = variable_struct_get(global.missions_complete, string_delete(_track, 0, 3))
		var _complete = _mission_prog.complete
		
		scr_unlock_towers_upgrades(_current_mission_stats, _complete)
	}
	
	scr_save_game()
}
