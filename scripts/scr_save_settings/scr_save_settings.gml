// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_settings(){

	var _save_file = "savesettings.sav"
	var _backup_save_file = "savesettings_backup.sav"

	scr_handle_file_backup(_save_file, _backup_save_file)

	ini_open(_backup_save_file)
	
	ini_write_real("Settings", "game_sound_level", global.game_sound_level);
	ini_write_real("Settings", "game_music_level", global.game_music_level);

	ini_close();
	
	scr_copy_backup_to_save(_save_file, _backup_save_file)

}