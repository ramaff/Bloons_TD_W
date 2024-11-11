/// @description Insert description here
// You can write your code in this editor

clicked = true;

if !instance_exists(selected_monkey) {
	instance_destroy()
	exit;
}

if global.money >= upgrade_stats.upgrade_cost {
	scr_upgrade_monkey(selected_monkey, upgrade_stats, path)
	global.money -= upgrade_stats.upgrade_cost
}

with (selected_monkey) {
	scr_select_monkey()
}
//scr_create_tower_buttons()
