// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_cactus_base_alternate(){

	tower_stats.attack_angle_offset += 45;

}

function scr_needle_storm(){

	tower_stats.attack_angle_offset = scr_wave(-45, 45, 0.75, 0)

}