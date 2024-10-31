// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_pineapple_juggling(){

	if !variable_struct_exists(tower_stats, "attack_angle_offset") {
		tower_stats.attack_angle_offset = 0;
	}
	tower_stats.attack_angle_offset += 15;

}