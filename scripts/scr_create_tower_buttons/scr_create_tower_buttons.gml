// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_tower_buttons(){
	with instance_create_depth(800, 128, depth, obj_tower_butt) {
		base_tower_id = "jim"
		tower_stats = scr_get_tower_stats(base_tower_id)
	}

	with instance_create_depth(800, 192, depth, obj_tower_butt) {
		base_tower_id = "sling_monkey"
		tower_stats = scr_get_tower_stats(base_tower_id)
	}
	with instance_create_depth(800, 256, depth, obj_tower_butt) {
		base_tower_id = "marbles_monkey"
		tower_stats = scr_get_tower_stats(base_tower_id)
	}
	with instance_create_depth(868, 256, depth, obj_tower_butt) {
		base_tower_id = "pogo_stick_monkey"
		tower_stats = scr_get_tower_stats(base_tower_id)
	}
}