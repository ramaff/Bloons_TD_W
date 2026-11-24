if global.round > 50 {
	global.cash_flow = 0.1;
} else if global.round > 40 {
	global.cash_flow = 0.2;
} else if global.round > 30 {
	global.cash_flow = 0.4;
} else if global.round > 20 {
	global.cash_flow = 0.6;
}

if variable_struct_exists(global.tutorials, global.mission) {
	var _mission_tutorials = variable_struct_get(global.tutorials, global.mission)
	var _mission_tutorial_prog = variable_struct_get(global.tutorials_progress, global.mission)
	scr_create_note(_mission_tutorials, _mission_tutorial_prog, $"{global.round}")
}