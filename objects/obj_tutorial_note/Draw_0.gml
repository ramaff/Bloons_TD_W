/// @description Insert description here
// You can write your code in this editor

if page >= array_length(text) {
	instance_destroy();
	exit;
}

draw_self()

draw_text_ext_color(x - 156, y - 24, text[page], 24, 308, c_black, c_black, c_black, c_black, 1)
draw_text_ext_color(x + 112, y + 120, string(page + 1) + "/" + string(array_length(text)), 24, 300, c_black, c_black, c_black, c_black, 1)




