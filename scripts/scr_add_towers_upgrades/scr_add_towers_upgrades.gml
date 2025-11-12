function scr_add_towers_upgrades(_current_mission_stats, _complete, _temporary = false){

	if variable_struct_exists(_current_mission_stats, "towers") {
		var _add_towers = variable_struct_get(_current_mission_stats, "towers")
		global.added_towers = _add_towers
	}
	if variable_struct_exists(_current_mission_stats, "heroes") {
		var _add_heroes = variable_struct_get(_current_mission_stats, "heroes")
		global.added_heroes = _add_heroes
	}
	if variable_struct_exists(_current_mission_stats, "paths") {
		var _add_paths = variable_struct_get(_current_mission_stats, "paths")
		
		var _i = 0;
		for(_i = 0; _i < array_length(_add_paths); _i++) {
			var _apply_tower = struct_get_names(_add_paths[_i])[0]
			if !_complete {
				if variable_struct_exists(global.upgrades_progress, _apply_tower) {
					var _tower_up_prog = variable_struct_get(global.upgrades_progress, _apply_tower)
					variable_struct_set(_tower_up_prog.unlocked_paths, variable_struct_get(_add_paths[_i], _apply_tower)[0], {"unlocked_upgrades": 2})
				}
			}
		}	
	}
}

function scr_unlock_towers_upgrades(_current_mission_stats, _complete){
	
	if !_complete {
		return	
	}

	if variable_struct_exists(_current_mission_stats, "towers") {
		var _add_towers = variable_struct_get(_current_mission_stats, "towers")
		
		var _i = 0;
		for(_i = 0; _i < array_length(_add_towers); _i++) {
			var _tower = _add_towers[_i];
			var _tower_prog = variable_struct_get(global.towers_progress, _tower)
			if !_tower_prog.unlocked {
				variable_struct_set(_tower_prog, "unlocked", true)
			
				with instance_create_depth(480, 600, -600, obj_world_map_note) {
					text = "The " + _tower + " has joined your party"	
				}
			}
		}
	}
	if variable_struct_exists(_current_mission_stats, "heroes") {
		var _add_heroes = variable_struct_get(_current_mission_stats, "heroes")
		
		var _i = 0;
		for(_i = 0; _i < array_length(_add_heroes); _i++) {
			var _hero = _add_heroes[_i];
			var _hero_prog = variable_struct_get(global.heroes_progress, _hero)
			if !_hero_prog.unlocked {
				variable_struct_set(_hero_prog, "unlocked", true)
			
				with instance_create_depth(480, 600, -600, obj_world_map_note) {
					text = "The " + _hero + " has joined your party"	
				}
			}
		}
	}
	if variable_struct_exists(_current_mission_stats, "paths") {
		var _add_paths = variable_struct_get(_current_mission_stats, "paths")
		
		var _i = 0;
		for(_i = 0; _i < array_length(_add_paths); _i++) {
			var _apply_tower_name = struct_get_names(_add_paths[_i])[0]
			if variable_struct_exists(global.upgrades_progress, _apply_tower_name) {
				var _tower_up_prog = variable_struct_get(global.upgrades_progress, _apply_tower_name)
				var _add_path = variable_struct_get(_add_paths[_i], _apply_tower_name)[0]
				
				if !variable_struct_exists(_tower_up_prog.unlocked_paths, _add_path) {
					variable_struct_set(_tower_up_prog.unlocked_paths, _add_path, {"unlocked_upgrades": 0})
				}
				var _upgrade_prog = variable_struct_get(_tower_up_prog.unlocked_paths, _add_path)
				
				if _upgrade_prog.unlocked_upgrades < 2 {
					variable_struct_set(_tower_up_prog.unlocked_paths, _add_path, {"unlocked_upgrades": 2})
					with instance_create_depth(480, 600, -600, obj_world_map_note) {
						text = "The " + _apply_tower_name + " has gained a new path to power"	
					}
				}
			}

		}	
	}
}

function scr_remove_temporary_unlocks(_current_mission_stats, _complete) {
	
	if variable_struct_exists(_current_mission_stats, "paths") {
		var _add_paths = variable_struct_get(_current_mission_stats, "paths")
		
		var _i = 0;
		for(_i = 0; _i < array_length(_add_paths); _i++) {
			var _apply_tower = struct_get_names(_add_paths[_i])[0]
			if _complete = false {
				if variable_struct_exists(global.upgrades_progress, _apply_tower) {
					var _tower_up_prog = variable_struct_get(global.upgrades_progress, _apply_tower)
					variable_struct_remove(_tower_up_prog.unlocked_paths, variable_struct_get(_add_paths[_i], _apply_tower)[0])
				}
			}
		}	
	}

}