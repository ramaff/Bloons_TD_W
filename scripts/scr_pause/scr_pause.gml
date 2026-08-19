function scr_pause(){
	with (obj_bloon) {
		scr_create_pause_decoy(sprite_index, image_index)
	}
	with (obj_monkey) {
		scr_create_pause_decoy(sprite_index, image_index)
	}
	with (obj_damage_dealer) {
		scr_create_pause_decoy(sprite_index, image_index)
	}
	instance_deactivate_object(obj_bloon)	
	instance_deactivate_object(obj_monkey)
	instance_deactivate_object(obj_damage_dealer)
	instance_deactivate_object(obj_in_mission_controllers)
}

function scr_unpause() {
	instance_destroy(obj_pause_decoy)
	instance_activate_object(obj_bloon)
	instance_activate_object(obj_monkey)
	instance_activate_object(obj_damage_dealer)
	instance_activate_object(obj_in_mission_controllers)
}