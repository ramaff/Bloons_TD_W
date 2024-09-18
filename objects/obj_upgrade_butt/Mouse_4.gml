/// @description Insert description here
// You can write your code in this editor

if global.money >= upgrade_stats.upgrade_cost {
	scr_upgrade_monkey(selected_monkey, upgrade_stats)
	global.money -= upgrade_stats.upgrade_cost
}

instance_destroy(obj_upgrade_butt)
scr_create_tower_buttons()
