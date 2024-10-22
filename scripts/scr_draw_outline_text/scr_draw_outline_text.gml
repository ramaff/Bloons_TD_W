// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_outline_text(_x, _y, _text, _color = c_white, _outline_color = c_black){
	draw_text_color(_x + 1, _y + 1, _text, _outline_color,_outline_color, _outline_color, _outline_color, 1)
	draw_text_color(_x - 1, _y + 1, _text, _outline_color,_outline_color, _outline_color, _outline_color, 1)
	draw_text_color(_x + 1, _y - 1, _text, _outline_color,_outline_color, _outline_color, _outline_color, 1)
	draw_text_color(_x - 1, _y - 1, _text, _outline_color,_outline_color, _outline_color, _outline_color, 1)
	draw_text_color(_x + 2, _y + 2, _text,	_outline_color,_outline_color, _outline_color, _outline_color, 1)
	draw_text_color(_x + 1, _y + 2, _text, _outline_color,_outline_color, _outline_color, _outline_color, 1)
	draw_text_color(_x + 2, _y + 1, _text, _outline_color,_outline_color, _outline_color, _outline_color, 1)
	draw_text_color(_x, _y, _text, _color, _color, _color, _color, 1)

}