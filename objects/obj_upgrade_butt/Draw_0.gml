/// @description Insert description here
// You can write your code in this editor

draw_self()

scr_draw_outline_text(x + 8, y + 18, upgrade_stats.keyword, c_white, c_black)
//draw_text_ext_color(x + 8, y + 8, upgrade_stats.upgrade_string, 18, 128, c_black, c_black, c_black, c_black, 1)
//draw_text_ext_color(x + 8, y + 8, upgrade_stats.upgrade_string, 18, 128, c_black, c_black, c_black, c_black, 1)

scr_draw_outline_text(x + 80, y + 64, "$" + string(upgrade_stats.upgrade_cost), c_white, c_black)
