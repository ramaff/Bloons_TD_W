/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

global.money += 5;

with instance_create_depth(x, y, -100, obj_text) {
	text = "+$5";	
}
