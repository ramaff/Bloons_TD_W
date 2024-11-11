/// @description Insert description here
// You can write your code in this editor

if !instance_exists(selected_monkey) {
	instance_destroy()
	exit;
}

draw_self()

scr_draw_outline_text(x + 10, y + 20, "pop count: " + string(selected_monkey.pop_count), c_white, c_black)
scr_draw_outline_text(x + 10, y + 56, "target: " + string(selected_monkey.targeting), c_white, c_black)




