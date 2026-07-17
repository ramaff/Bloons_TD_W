// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_setup_global_vars(){
	
	global.tower_stats = scr_setup_tower_stats();
	
	global.upgrade_stats = scr_setup_upgrade_stats();

	global.bloon_stats = scr_setup_bloon_stats();
	
	global.mission_unlocks = scr_import_json("mission_info.json", json_parse);

}