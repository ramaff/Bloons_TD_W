// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_load_settings(){
	var _save_file = "savesettings.sav"
	var _backup_save_file = "savesettings_backup.sav"
	
	scr_handle_file_load(_save_file, _backup_save_file)
	

	if (file_exists(_save_file)) {
	    ini_open(_save_file)
  
		global.game_sound_level = ini_read_real("Settings", "game_sound_level", 1);
		global.game_music_level = ini_read_real("Settings", "game_music_level", 1);

	    ini_close();

	}
}