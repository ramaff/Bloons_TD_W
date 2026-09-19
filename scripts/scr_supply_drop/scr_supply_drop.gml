function scr_supply_drop(){

	with instance_create_depth(x, y, depth, obj_target_into_delivery) {
		delivery_type = "supply_drop"
		tower_id = other.id;
		xx = 0;
		yy = 0;
		alarm[0] = 90;
	}

}