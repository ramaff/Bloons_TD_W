// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_handle_file_load(_save_file, _backup_save_file){
	
	if !(file_exists(_save_file)) {
		if (file_exists(_backup_save_file)) {
			file_copy(_backup_save_file, _save_file);
			file_delete(_backup_save_file);
		}
	}
	
}

function scr_load_game(){
	var _save_file = "savegame.sav"
	var _backup_save_file = "savegame_backup.sav"
	
	scr_handle_file_load(_save_file, _backup_save_file)
	

	if (file_exists(_save_file)) {
	    ini_open(_save_file)
  
		var _missions_complete = json_parse(ini_read_string("Progress", "missions_complete", "{}"));
		var _towers_progress = json_parse(ini_read_string("Progress", "towers_progress", "{}"));
		var _heroes_progress = json_parse(ini_read_string("Progress", "heroes_progress", "{}"));
		var _upgrades_progress = json_parse(ini_read_string("Progress", "upgrades_progress", "{}"));
		
		global.missions_complete = scr_merge_struct(global.missions_complete, _missions_complete)
		global.towers_progress = scr_merge_struct(global.towers_progress, _towers_progress)
		global.heroes_progress = scr_merge_struct(global.heroes_progress, _heroes_progress)
		global.upgrades_progress = scr_merge_struct(global.upgrades_progress, _upgrades_progress)

	    ini_close();

	}
}