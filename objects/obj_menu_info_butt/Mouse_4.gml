instance_destroy(obj_menu_info_page)
instance_destroy(obj_menu_info_upgrade_butt)

var _page = noone
with instance_create_depth(320, 70, depth, obj_menu_info_page){
	entry_sprite = other.entry_sprite
	entry_text = other.entry_text
	_page = id
}

if global.menu == MENU.towers {
	event_user(0)	
}
if global.menu == MENU.bloons {
	event_user(1)	
}