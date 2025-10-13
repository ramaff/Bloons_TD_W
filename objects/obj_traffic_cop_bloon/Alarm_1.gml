/// @description Insert description here
// You can write your code in this editor

alarm[2] = 600;
alarm[1] = 1200;

sprite_index = spr_traffic_cop_bloon_sign_up

sign_direction = pos_directions[sign_ind mod 2];

sign_ind++;

if sign_direction = "right" {
	image_xscale = -1;	
} else {
	image_xscale = 1;
}


