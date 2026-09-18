function scr_supply_drop(){

	with instance_create_depth(x, y, depth, obj_target_into_delivery) {
		delivery_type = "supply_drop"
		tower_id = other.id;
		xx = x;
		yy = y;
		alarm[0] = 90;
	}

}