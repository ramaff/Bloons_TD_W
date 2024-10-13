/// @description Insert description here
// You can write your code in this editor

if mouse_x < 800 {
	cancel_tower = true;	
}

if cancel_tower {

	image_alpha = lerp(image_alpha + 0.01, 1, 0.1);

}




