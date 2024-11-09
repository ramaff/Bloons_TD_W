/// @description Insert description here
// You can write your code in this editor

if cancel_tower and image_alpha >= 1 {

	with(obj_place_tower) {
		instance_destroy()	
	}
	
	with(obj_non_placeable_tile) {
		image_alpha = 0;	
	}

	instance_destroy()

}


