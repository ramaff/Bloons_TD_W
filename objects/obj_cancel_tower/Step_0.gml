/// @description Insert description here
// You can write your code in this editor

if mouse_x < 800 {
	cancel_tower = true;	
}

if cancel_tower {

	image_alpha = lerp(image_alpha + 0.01, 1, 0.1);

}

if mouse_x >= 800 and image_alpha >= 1 {

	with(obj_place_tower) {
		instance_destroy()	
	}
	
	with(obj_non_placeable_tile) {
		image_alpha = 0;	
	}

	instance_destroy()

}




