/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

law_icon = noone;

with instance_create_depth(224, 96, -150, obj_law_icon) {
	law_text = "As long as the corresponding esquire floats, the following law is in effect:\nTowers can no longer be sold."	
	note = noone;
	other.law_icon = id;
}
