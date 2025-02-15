/// @description Insert description here
// You can write your code in this editor

if instance_exists(outline) {
	outline.x = x;	
	outline.y = y;	
}

direction += ang_vel;

ang_vel += ang_accel;
ang_accel += ang_jerk;



