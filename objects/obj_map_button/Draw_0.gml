/// @description Insert description here
// You can write your code in this editor

var _track = room_get_name(track);

var _track_info = variable_struct_get(tracks_info, _track);
var _struct_name = string_replace_all(_track_info.name, " ", "_")
var _mission_prog = variable_struct_get(global.missions_complete, _struct_name)

if variable_struct_exists(_track_info, "requirement") {
	var _req = _track_info.requirement
	//show_debug_message(global.missions_complete)
	//show_debug_message(_req)
	var _req_mission_prog = variable_struct_get(global.missions_complete, _req)
	//show_debug_message(_req_mission_prog)
	
	if !_req_mission_prog.complete {
		exit;	
	}
}

if _mission_prog.complete {
	sprite_index = spr_world_map_button_complete
}
	
draw_self()

if abs(mouse_x - x) < 32 and abs(mouse_y - y) < 32 {
	//show_debug_message(_mission_prog)
	draw_sprite(spr_mission_info_panel, 0, x, y);
	if _mission_prog.complete {
		var _best_time = _mission_prog.best_time
		scr_draw_outline_text(x - 76, y - 112, "best time: " + scr_timer_string(_best_time))
	} else {
		scr_draw_outline_text(x - 76, y - 112, "not completed")
	}
	scr_draw_outline_text(x - 76, y - 160, _track_info.name)
	//draw_sprite_ext(asset_get_index(_track_info.track_sprite), 0, x, y - 160, 0.25, 0.25, 0, c_white, image_alpha);
	
}




