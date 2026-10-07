function scr_calc_monkey_money(){
	
	global.monkey_money = 0
	
	var _i = 0;
	var _missions = struct_get_names(global.mission_unlocks)
	for(_i = 0; _i < array_length(_missions); _i++) {
		var _track = _missions[_i]
		var _current_mission_stats = variable_struct_get(global.mission_unlocks, _track);
		var _mission_prog = variable_struct_get(global.missions_complete, string_delete(_track, 0, 3))
		var _complete = _mission_prog.complete
		
		if _complete {
			var _difficulty = variable_struct_get(_current_mission_stats, "difficulty")
			var _add_cash = {
				"beginner": 100,
				"intermediate": 200,
				"advanced": 300,
				"expert": 400
			}
	
			global.monkey_money += variable_struct_get(_add_cash, _difficulty)
		}
	}
	
	var _goodies = struct_get_names(global.goodie_stats)
	for(_i = 0; _i < array_length(_goodies); _i++) {
		var _goodie = _goodies[_i]
		var _current_goodie_stats = variable_struct_get(global.goodie_stats, _goodie);
		var _price = variable_struct_get(_current_goodie_stats, "price")

		if variable_struct_exists(global.towers_progress, _goodie) {
			var _goodie_prog = variable_struct_get(global.towers_progress, _goodie)
			
			if _goodie_prog.unlocked {		
				global.monkey_money -= _price
			}
		}
	}

}