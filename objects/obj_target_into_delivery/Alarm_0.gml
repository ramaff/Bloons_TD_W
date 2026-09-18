/// @description Insert description here
// You can write your code in this editor

if delivery_type == "supply_drop" {
	
	global.money += 200;

	with instance_create_depth(x, y, -100, obj_text) {
		text = "+$200";	
	}
	
	instance_destroy()
	exit;
}

with instance_create_depth(x, y, depth, obj_special_delivery_spew) {
	tower_id = other.tower_id;	
	type = other.delivery_type;
}


instance_destroy();


