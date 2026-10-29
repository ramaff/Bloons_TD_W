function scr_mission_complete(_req){

	var _req_mission_prog = variable_struct_get(global.missions_complete, _req)
	
	return _req_mission_prog.complete

}