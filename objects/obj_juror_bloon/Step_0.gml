/// @description Insert description here
// You can write your code in this editor

if bloon_stats.health < bloon_stats.max_health / 4 {
	bloon_stats.health = lerp(bloon_stats.health, bloon_stats.max_health / 4, 0.05);
	
	sprite_index = spr_happy_juror;
} else {
	sprite_index = spr_angry_juror	
}

event_inherited();

if leak_frame {

	scr_bloon_set_speed(bloon_stats.speed * 1.1);

}




