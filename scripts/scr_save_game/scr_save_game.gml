// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_game(){

	var _save_file = "savegame.sav"
	var _backup_save_file = "savegame_backup.sav"

	scr_handle_file_backup(_save_file, _backup_save_file)

	ini_open(_backup_save_file)
	
	ini_write_string("Progress", "missions_complete", string_replace_all(json_stringify(global.missions_complete), "\"", "'"));
	ini_write_string("Progress", "towers_progress", string_replace_all(json_stringify(global.towers_progress), "\"", "'"));
	ini_write_string("Progress", "heroes_progress", string_replace_all(json_stringify(global.heroes_progress), "\"", "'"));
	ini_write_string("Progress", "upgrades_progress", string_replace_all(json_stringify(global.upgrades_progress), "\"", "'"));

	ini_close();
	
	scr_copy_backup_to_save(_save_file, _backup_save_file)

}