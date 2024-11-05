/// @description Insert description here
// You can write your code in this editor

x = floor(mouse_x / 16) * 16;
y = (floor((mouse_y - 60) / 16) * 16) + 60;

x = clamp(x, 0, 800)
y = clamp(y, 60, 540)


