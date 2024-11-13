/// @description Insert description here
// You can write your code in this editor

//if instance_number(obj_bloon) <= 0 {
	
//}

if global.round < 1 {
	exit;	
}

if global.round > array_length(global.bloon_sends) {
	exit;
}

var _round = global.bloon_sends[global.round - 1];
var _bloons_remaining = false;

for(var _i = 0; _i < array_length(_round); _i++) {
	if variable_struct_exists(_round[_i], "round_icon_sprite") {
		continue;	
	}
	if _round[_i].count < 1 {
		continue;
	}
	_bloons_remaining = true;
	if _round[_i].cooldown <= 0 {
		var _bloon_object = scr_bloon_class_to_object(struct_get(_round[_i], "class"), struct_get(_round[_i], "layer"));
		var _properties = []
		var _round_number = 0;
		if variable_struct_exists(_round[_i], "properties") {
			_properties = struct_get(_round[_i], "properties")
		}
		if variable_struct_exists(_round[_i], "round") {
			_round_number = struct_get(_round[_i], "round")
		}
		var _path = global.paths[bloon_send_number mod array_length(global.paths)];
		with instance_create_depth(path_get_x(_path, 0), path_get_y(_path, 0), depth, _bloon_object) {
			scr_bloon_stat_setup(id, _round[_i].class, struct_get(_round[_i], "layer"), _path, _properties, _round_number);
		}
		_round[_i].cooldown += _round[_i].spread;
		_round[_i].count--;
		bloon_send_number++;
	}
	_round[_i].cooldown--;
}

if !_bloons_remaining and global.round < array_length(global.bloon_sends) {
	global.round_gap--;
	if global.round_gap < 0 {
		global.round++;
		global.round_gap = 480;
		_bloons_remaining = true;
		//if global.round >= array_length(global.bloon_sends) {
		//	global.round_gap = 0;	
		//}
		if global.round < array_length(global.bloon_sends) {
			with instance_create_depth(x, y, depth, obj_round_check) {
				round_number = global.round;
				alarm[0] = other.round_properties[global.round - 1].sends_end_time;
			}
		}
	}
}

if global.round >= array_length(global.bloon_sends) and !_bloons_remaining and instance_number(obj_bloon) <= 0 {
	if !instance_exists(obj_win_indication) {
		//show_debug_message(global.mission)
		var _current_stage_prog = variable_struct_get(global.missions_complete, global.mission)
		
		if global.mission = "bloon_academia" {
			global.heroes_progress.angry_squirrel.unlocked = true
		}
		
		//show_debug_message(_current_stage_prog)
		_current_stage_prog.best_time = min(global.total_time, _current_stage_prog.best_time)
		_current_stage_prog.complete = true
		//variable_struct_set(global.missions_complete.training_room, "best_time", min(global.total_time, _best_time))
		scr_save_game()
		instance_create_depth(10, 600, -500, obj_win_indication)
	}
	exit;
}

global.total_time++;
global.round_time++;

/*if global.lives <= 0 {
	game_end()	
} */

/*if instance_number(obj_bloon) <= 0 and bully_count <= 0 {
	instance_create_depth(100, 100, depth - 100, obj_win_butt)	
}
*/