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
  
		global.missions_complete = json_parse(ini_read_string("Progress", "missions_complete", global.missions_complete));

	    ini_close();

	}
}