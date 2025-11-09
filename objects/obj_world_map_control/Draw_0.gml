/// @description Insert description here
// You can write your code in this editor

if !instance_exists(obj_mission_control) {

	scr_draw_outline_text(8, 520, "'Bloons TD W' v" + VERSION, c_white, c_black)

	scr_draw_outline_text(224, 520, scr_timer_string(global.full_game_time, true))

}
