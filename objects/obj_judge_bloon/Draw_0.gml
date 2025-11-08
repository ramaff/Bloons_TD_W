/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


var _xx1 = x + 90
var _xx2 = x + 170
var _yy = y + 60
 
draw_sprite(spr_the_scales_of_justice, 0, _xx1, _yy - guilt)
draw_sprite(spr_the_scales_of_justice, 1, _xx2, _yy + guilt)

draw_line(_xx1, _yy - 72, _xx1, _yy - guilt)
draw_line(_xx2, _yy - 72, _xx2, _yy + guilt)


