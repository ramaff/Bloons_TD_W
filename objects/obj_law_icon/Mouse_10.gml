/// @description Insert description here
// You can write your code in this editor

if !instance_exists(note) {
	with instance_create_depth(480, 600, -600, obj_generic_bloons_note) {
		text = other.law_text
		other.note = id;
		
		alarm[0] = 180;
		alarm[2] = 360;

		speed = 9;
		direction = 90;
	}	
}
