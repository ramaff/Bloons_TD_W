/// @description Insert description here
// You can write your code in this editor

alarm[0] = 20;

outline = instance_create_depth(x, y, depth + 10, obj_particle);
with outline {
	sprite_index = spr_water_part_outline;	
}

ang_vel = 0;
ang_accel = 0;
ang_jerk = 0.4;
if irandom(1) = 0 {
	ang_jerk = ang_jerk * -1;
}

speed = 8 + random(4);
direction = 90 * irandom(3);

path_pos = 0;