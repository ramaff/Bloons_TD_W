/// @description Insert description here
// You can write your code in this editor

event_inherited();

if leak_frame {

	scr_bloon_set_speed(bloon_stats.speed * 1.1);
}

if added_speed < 3 and sprite_index = spr_monster_truck_on {
	added_speed += 0.05;
}

if sprite_index = spr_monster_truck {
	added_speed = lerp(added_speed, 0, 0.1);	
}

speed = added_speed + bloon_stats.speed
path_speed = added_speed + bloon_stats.speed

image_angle = -added_speed * 30


