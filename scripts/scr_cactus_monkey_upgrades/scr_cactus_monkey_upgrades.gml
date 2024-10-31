// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_bandito(){
	if variable_struct_exists(tower_stats, "tower_attack_script") {
		variable_struct_remove(tower_stats, "tower_attack_script")
	}
	if variable_struct_exists(tower_stats, "no_target") {
		variable_struct_remove(tower_stats, "no_target")
	}
	tower_stats.attack_angle_offset = 0
}