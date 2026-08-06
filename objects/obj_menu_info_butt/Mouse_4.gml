instance_destroy(obj_menu_info_page)
instance_destroy(obj_menu_info_upgrade_butt)

if global.menu == MENU.towers {
	event_user(0)	
}
if global.menu == MENU.bloons {
	event_user(1)	
}