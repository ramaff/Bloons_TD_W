/// @description Insert description here
// You can write your code in this editor

draw_self()

if page >= array_length(text) {
	gravity = 5
	image_index = 2
	exit;
}

draw_text_ext_color(x - 208, y + 48, text[page], 24, 368, c_black, c_black, c_black, c_black, 1)
draw_text_ext_color(x + 208, y + 144, string(page + 1) + "/" + string(array_length(text)), 24, 480, c_black, c_black, c_black, c_black, 1)

if icon != noone {
	draw_sprite(icon, icon_index, x - 185, y - 30)	
}


