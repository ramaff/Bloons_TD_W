/// @description Insert description here
// You can write your code in this editor

clicked = true;

var _tower = selected_monkey;

with (obj_tower_tile) {
	if instance_exists(tower_id) {
		if tower_id = _tower {
			instance_destroy()
		}
	}
}

with (selected_monkey) {
	instance_destroy()
}

instance_destroy(obj_upgrade_butt)
scr_create_tower_buttons()

global.money += sell_price;


