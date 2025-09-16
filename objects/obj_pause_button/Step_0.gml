/// @description Insert description here
// You can write your code in this editor

if !paused {
	sprite_index = spr_pause_butt	
} else {
	sprite_index = spr_unpause_butt
}

if mouse_x >= x and mouse_x <= x + 32 and mouse_y >= y and mouse_y <= y + 30 {
	image_index = 1;	
} else {
	image_index = 0;	
}





