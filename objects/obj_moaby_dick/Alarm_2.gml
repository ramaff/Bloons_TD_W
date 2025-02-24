/// @description Insert description here
// You can write your code in this editor

if water_count > 0 {
	water_count--;
	alarm[2] = 1;
}


repeat(4) {
	instance_create_depth(x, y, depth, obj_water_particle)	
}

