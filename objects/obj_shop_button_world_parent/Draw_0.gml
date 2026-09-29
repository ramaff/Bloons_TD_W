draw_self()

if abs(mouse_x - x) < 32 and abs(mouse_y - y) < 32 {
	//show_debug_message(_mission_prog)
	draw_sprite(spr_mission_info_panel, 0, x, y);
	scr_draw_outline_text(x - 76, y - 160, shop_string)
	
}
