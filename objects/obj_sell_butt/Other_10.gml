

clicked = true;

var _tower = selected_monkey;

with (obj_tower_tile) {
	if instance_exists(tower_id) {
		if tower_id = _tower {
			instance_destroy()
		}
	}
}

if instance_exists(_tower.tower_base) {
	
	with(_tower.tower_base) {
		instance_destroy()	
	}
	
}

with (selected_monkey) {
	instance_destroy()
}

scr_play_sound(sell_tower)

instance_destroy(obj_upgrade_butt)
scr_create_tower_buttons()

global.money += sell_price;



